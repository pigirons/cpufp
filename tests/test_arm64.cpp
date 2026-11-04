#include "../arm64/arm64_features.h"
#include "../arm64/scalable.h"

#include <cstdio>
#include <cstdlib>
#ifdef __linux__
#include <sys/prctl.h>
#endif
#include <thread>
#include <vector>

#ifdef _SME_
extern "C" bool test_sme_private_za(void (*kernel)(int64_t, void *));
extern "C" uint64_t test_sme_svcr(void);
#endif

static int passed = 0;
static int skipped = 0;
static int failed = 0;

template <typename T>
static void check(const char *name, uint64_t required,
    void (*kernel)(int64_t, void *), int64_t (*vector_bytes)(void),
    int vectors, int repeats, int products)
{
    if ((arm64_get_features() & required) != required)
    {
        printf("SKIP %s (CPU/OS feature unavailable)\n", name);
        skipped++;
        return;
    }
#ifdef _SME_
    const bool uses_sme = (required & ARM64_SME) != 0;
    const uint64_t before = uses_sme ? test_sme_svcr() : 0;
#endif
    const size_t count = vectors * vector_bytes() / sizeof(T);
    for (int64_t iterations : {0LL, 1LL, 3LL})
    {
        const T sentinel = static_cast<T>(113);
        std::vector<T> output(count + 16, sentinel);
        kernel(iterations, output.data() + 8);
        const T expected = static_cast<T>(iterations * repeats * products);
        for (size_t i = 0; i < output.size(); i++)
        {
            const T want = i < 8 || i >= count + 8 ? sentinel : expected;
            if (output[i] != want)
            {
                fprintf(stderr, "FAIL %s: iterations=%lld index=%zu got=%g expected=%g\n",
                    name, static_cast<long long>(iterations), i,
                    static_cast<double>(output[i]), static_cast<double>(want));
                failed++;
                return;
            }
        }
        // Also exercise exactly the no-store path used during benchmarking.
        kernel(iterations, nullptr);
    }
#ifdef _SME_
    if (uses_sme && ((test_sme_svcr() & 3) != (before & 3) ||
        ((arm64_get_features() & ARM64_SME_F32) && !test_sme_private_za(kernel))))
    {
        fprintf(stderr, "FAIL %s: SM/ZA state was not preserved\n", name);
        failed++;
        return;
    }
#endif
    printf("PASS %s (%zu accumulator lanes and output guards)\n", name, count);
    passed++;
}

#define CHECK(T, NAME, FLAGS, VL, VECTORS, REPEATS, PRODUCTS) \
    check<T>(#NAME, FLAGS, NAME, VL, VECTORS, REPEATS, PRODUCTS)

static void kernels()
{
#if defined(__linux__) && defined(PR_SVE_SET_VL)
    const char *requested_vl = std::getenv("CPUFP_TEST_VL_BYTES");
    if (requested_vl != nullptr && (arm64_get_features() & ARM64_SVE))
    {
        if (prctl(PR_SVE_SET_VL, strtoul(requested_vl, nullptr, 10), 0, 0, 0) < 0)
        {
            perror("PR_SVE_SET_VL");
            failed++;
            return;
        }
    }
#endif
#if defined(__linux__) && defined(PR_SME_SET_VL)
    const char *requested_svl = std::getenv("CPUFP_TEST_SVL_BYTES");
    if (requested_svl != nullptr && (arm64_get_features() & ARM64_SME))
    {
        if (prctl(PR_SME_SET_VL, strtoul(requested_svl, nullptr, 10), 0, 0, 0) < 0)
        {
            perror("PR_SME_SET_VL");
            failed++;
            return;
        }
    }
#endif
#ifdef _SVE_
    if (arm64_get_features() & ARM64_SVE)
        printf("Worker SVE VL: %lld bits\n", static_cast<long long>(sve_vector_bytes() * 8));
    CHECK(__fp16, sve_fmla_f16, ARM64_SVE, sve_vector_bytes, 24, 1, 1);
    CHECK(float, sve_fmla_f32, ARM64_SVE, sve_vector_bytes, 24, 1, 1);
    CHECK(double, sve_fmla_f64, ARM64_SVE, sve_vector_bytes, 24, 1, 1);
    CHECK(int32_t, sve_sdot_s8, ARM64_SVE, sve_vector_bytes, 24, 1, 4);
    CHECK(uint32_t, sve_udot_u8, ARM64_SVE, sve_vector_bytes, 24, 1, 4);
#endif
#ifdef _SVE2_
    const uint64_t sve2 = ARM64_SVE | ARM64_SVE2;
    CHECK(int16_t, sve2_smlalb_s8, sve2, sve_vector_bytes, 24, 1, 1);
    CHECK(int16_t, sve2_smlalt_s8, sve2, sve_vector_bytes, 24, 1, 1);
    CHECK(int32_t, sve2_smlalb_s16, sve2, sve_vector_bytes, 24, 1, 1);
    CHECK(int32_t, sve2_smlalt_s16, sve2, sve_vector_bytes, 24, 1, 1);
    CHECK(int64_t, sve2_smlalb_s32, sve2, sve_vector_bytes, 24, 1, 1);
    CHECK(int64_t, sve2_smlalt_s32, sve2, sve_vector_bytes, 24, 1, 1);
#endif
#ifdef _SME_
    if (arm64_get_features() & ARM64_SME)
        printf("Worker SME SVL: %lld bits\n", static_cast<long long>(sme_vector_bytes() * 8));
    CHECK(float, sme_fmopa_f32, ARM64_SME | ARM64_SME_F32, sme_vector_bytes, 4, 6, 1);
    CHECK(float, sme_fmopa_f16, ARM64_SME | ARM64_SME_F16, sme_vector_bytes, 4, 6, 2);
    CHECK(float, sme_bfmopa_bf16, ARM64_SME | ARM64_SME_BF16, sme_vector_bytes, 4, 6, 2);
    CHECK(int32_t, sme_smopa_s8, ARM64_SME | ARM64_SME_I8, sme_vector_bytes, 4, 6, 4);
    CHECK(uint32_t, sme_umopa_u8, ARM64_SME | ARM64_SME_I8, sme_vector_bytes, 4, 6, 4);
#endif
#ifdef _SME2_
    const uint64_t sme2 = ARM64_SME | ARM64_SME2;
    CHECK(float, sme2_fmla_f32, sme2 | ARM64_SME_F32, sme_vector_bytes, 16, 6, 1);
    CHECK(float, sme2_fdot_f16, sme2 | ARM64_SME_F16, sme_vector_bytes, 16, 6, 2);
    CHECK(float, sme2_bfdot_bf16, sme2 | ARM64_SME_BF16, sme_vector_bytes, 16, 6, 2);
    CHECK(int32_t, sme2_sdot_s8, sme2 | ARM64_SME_I8, sme_vector_bytes, 16, 6, 4);
    CHECK(uint32_t, sme2_udot_u8, sme2 | ARM64_SME_I8, sme_vector_bytes, 16, 6, 4);
#endif
}

int main()
{
    // Counts checked against independent known cases, including a non-power-of-
    // two SVE VL (384 bits). Do not use emulator timings as performance data.
    if (scalable_ops(16, 4, 1, false) != 192 ||
        scalable_ops(48, 2, 1, false) != 1152 ||
        scalable_ops(64, 4, 2, true) != 24576 ||
        scalable_ops(64, 4, 16, false) != 12288)
    {
        fprintf(stderr, "FAIL scalable operation counts\n");
        return 1;
    }
    kernels();
    // New workers have their own VL/SVL and private streaming/ZA state.
    std::thread worker(kernels);
    worker.join();
    printf("%d passed, %d skipped, %d failed\n", passed, skipped, failed);
    return failed ? 1 : 0;
}
