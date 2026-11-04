#include "table.hpp"
#include "smtl.hpp"
#include "arm64_features.h"
#include "scalable.h"

#include <unistd.h>
#include <cstdint>
#include <ctime>
#include <cstring>
#include <cstdint>
#include <vector>
#include <sstream>
#include <iomanip>
#include <algorithm>
#include <cerrno>
#include <climits>
#include <cstdlib>

using namespace std;

extern "C"
{
#ifdef _ASIMD_
    void asimd_fmla_vs_f32f32f32(int64_t);
    void asimd_fmla_vv_f32f32f32(int64_t);
    void asimd_fmla_vs_f64f64f64(int64_t);
    void asimd_fmla_vv_f64f64f64(int64_t);
#endif

#ifdef _ASIMD_HP_
    void asimd_fmla_vs_fp16fp16fp16(int64_t);
    void asimd_fmla_vv_fp16fp16fp16(int64_t);
#endif

#ifdef _ASIMD_DP_
    void asimd_dp4a_vs_s32s8s8(int64_t);
    void asimd_dp4a_vv_s32s8s8(int64_t);
    void asimd_dp4a_vs_u32u8u8(int64_t);
    void asimd_dp4a_vv_u32u8u8(int64_t);
#endif

#ifdef _BF16_
    void asimd_mmla_fp32bf16bf16(int64_t);
    void asimd_dp2a_vs_fp32bf16bf16(int64_t);
    void asimd_dp2a_vv_fp32bf16bf16(int64_t);
#endif

#ifdef _I8MM_
    void asimd_mmla_s32s8s8(int64_t);
    void asimd_mmla_u32u8u8(int64_t);
    void asimd_mmla_s32u8s8(int64_t);

    void asimd_dp4a_vs_s32s8u8(int64_t);
    void asimd_dp4a_vs_s32u8s8(int64_t);
    void asimd_dp4a_vv_s32u8s8(int64_t);
#endif
}

typedef struct
{
    std::string isa;
    std::string type;
    std::string dim;
    int64_t loop_time;
    int64_t comp_pl;
    void (*bench)(int64_t);
    void (*scalable_bench)(int64_t, void *);
    int64_t (*vector_bytes)(void);
    int element_bytes;
    int products;
    bool outer_product;
} cpubm_t;
static vector<cpubm_t> bm_list;

static double get_time(struct timespec *start,
    struct timespec *end)
{
    return end->tv_sec - start->tv_sec +
        (end->tv_nsec - start->tv_nsec) * 1e-9;
}

static void reg_new_isa(std::string isa,
    std::string type,
    std::string dim,
    int64_t loop_time,
    int64_t comp_pl,
    void (*bench)(int64_t))
{
    cpubm_t new_one = {};
    new_one.isa = isa;
    new_one.type = type;
    new_one.dim = dim;
    new_one.loop_time = loop_time;
    new_one.comp_pl = comp_pl;
    new_one.bench = bench;

    bm_list.push_back(new_one);
}

static void reg_scalable(const char *isa, const char *type, const char *dim,
    int64_t (*vector_bytes)(void), int element_bytes, int products,
    bool outer_product, void (*bench)(int64_t, void *))
{
    reg_new_isa(isa, type, dim, 0x1000000LL, 0, nullptr);
    cpubm_t &item = bm_list.back();
    item.scalable_bench = bench;
    item.vector_bytes = vector_bytes;
    item.element_bytes = element_bytes;
    item.products = products;
    item.outer_product = outer_product;
}

struct thread_params
{
    cpubm_t *bm;
    int64_t comp_pl;
};

static void thread_func(void *params)
{
    thread_params *task = static_cast<thread_params *>(params);
    cpubm_t *bm = task->bm;
    if (bm->scalable_bench != nullptr)
    {
        // Linux VL/SVL is per thread. Query it in the actual worker rather
        // than assuming all workers inherit the main thread's vector length.
        task->comp_pl = scalable_ops(bm->vector_bytes(), bm->element_bytes,
            bm->products, bm->outer_product);
        bm->scalable_bench(bm->loop_time, nullptr);
    }
    else
    {
        task->comp_pl = bm->comp_pl;
        bm->bench(bm->loop_time);
    }
}

static void cpubm_arm64_one(smtl_handle sh,
    cpubm_t &item,
    Table &table)
{
    struct timespec start, end;
    double time_used, perf;
    char perfUnit = 'G';

    int i;
    int num_threads = smtl_num_threads(sh);

    vector<thread_params> tasks(num_threads);
    for (i = 0; i < num_threads; i++) tasks[i].bm = &item;

    // warm up
    for (i = 0; i < num_threads; i++)
    {
        smtl_add_task(sh, thread_func, &tasks[i]);
    }
    smtl_begin_tasks(sh);
    smtl_wait_tasks_finished(sh);

    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    for (i = 0; i < num_threads; i++)
    {
        smtl_add_task(sh, thread_func, &tasks[i]);
    }
    smtl_begin_tasks(sh);
    smtl_wait_tasks_finished(sh);
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);

    time_used = get_time(&start, &end);
    double operations_per_loop = 0;
    for (i = 0; i < num_threads; i++) operations_per_loop += tasks[i].comp_pl;
    perf = static_cast<double>(item.loop_time) * operations_per_loop / time_used;
    if (perf > 1e12)
    {
        perfUnit = 'T';
        perf /= 1e12;
    }
    else
    {
        perf /= 1e9;
    }

    stringstream ss;
    ss << std::setprecision(5) << perf << " " << perfUnit << item.dim;

    vector<string> cont;
    cont.resize(3);
    cont[0] = item.isa;
    cont[1] = item.type;
    cont[2] = ss.str();
    table.addOneItem(cont);
}

static void cpubm_do_bench(std::vector<int> &set_of_threads,
    uint32_t idle_time)
{
    int i;

    if (bm_list.size() > 0)
    {
        int num_threads = set_of_threads.size();

        printf("Number Threads: %d\n", num_threads);
#ifdef __APPLE__
        printf("Thread labels (macOS chooses cores; QoS user-interactive):");
#else
        printf("Thread Pool Binding:");
#endif
        for (i = 0; i < num_threads; i++)
        {
            printf(" %d", set_of_threads[i]);
        }
        printf("\n");

        // set table head
        vector<string> ti;
        ti.resize(3);
        ti[0] = "Instruction Set";
        ti[1] = "Core Computation";
        ti[2] = "Peak Performance";

        Table table;
        table.setColumnNum(3);
        table.addOneItem(ti);

        // set thread pool
        smtl_handle sh;
        smtl_init(&sh, set_of_threads);

        // traverse task list
        cpubm_arm64_one(sh, bm_list[0], table);
        for (i = 1; i < bm_list.size(); i++)
        {
            sleep(idle_time);
            cpubm_arm64_one(sh, bm_list[i], table);
        }

        table.print();

        smtl_fini(sh);
    }
    else
    {
        printf("Sorry, there's no any supported SIMD isa.\n");
    }
}

static bool parse_thread_pool(const char *sets, vector<int> &threads)
{
    if (*sets++ != '[') return false;
    const long cpu_count = sysconf(_SC_NPROCESSORS_CONF);
    while (*sets != ']' && *sets != '\0')
    {
        char *end;
        if (*sets < '0' || *sets > '9') return false;
        errno = 0;
        long left = strtol(sets, &end, 10), right = left;
        if (errno || left < 0 || left >= cpu_count) return false;
        sets = end;
        if (*sets == '-')
        {
            sets++;
            if (*sets < '0' || *sets > '9') return false;
            errno = 0;
            right = strtol(sets, &end, 10);
            if (errno || right < left || right >= cpu_count) return false;
            sets = end;
        }
        for (long cpu = left; cpu <= right; cpu++)
        {
            if (threads.size() >= 512 ||
                find(threads.begin(), threads.end(), cpu) != threads.end()) return false;
            threads.push_back(static_cast<int>(cpu));
        }
        if (*sets == ',')
        {
            sets++;
            if (*sets == ']') return false;
        }
        else if (*sets != ']') return false;
    }
    return *sets == ']' && sets[1] == '\0' && !threads.empty();
}

static void cpufp_register_isa()
{
    const uint64_t features = arm64_get_features();
#ifdef _I8MM_
    if (features & ARM64_I8MM)
    {
        reg_new_isa("i8mm", "mmla(s32,s8,s8)", "OPS",
            0x10000000LL, 1536LL, asimd_mmla_s32s8s8);
        reg_new_isa("i8mm", "mmla(u32,u8,u8)", "OPS",
            0x10000000LL, 1536LL, asimd_mmla_u32u8u8);
        reg_new_isa("i8mm", "mmla(s32,u8,s8)", "OPS",
            0x10000000LL, 1536LL, asimd_mmla_s32u8s8);

        reg_new_isa("i8mm", "dp4a.vs(s32,s8,u8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vs_s32s8u8);
        reg_new_isa("i8mm", "dp4a.vs(s32,u8,s8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vs_s32u8s8);
        reg_new_isa("i8mm", "dp4a.vv(s32,u8,s8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vv_s32u8s8);
    }
#endif

#ifdef _ASIMD_DP_
    if (features & ARM64_DOT)
    {
        reg_new_isa("asimd_dp", "dp4a.vs(s32,s8,s8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vs_s32s8s8);
        reg_new_isa("asimd_dp", "dp4a.vv(s32,s8,s8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vv_s32s8s8);
        reg_new_isa("asimd_dp", "dp4a.vs(u32,u8,u8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vs_u32u8u8);
        reg_new_isa("asimd_dp", "dp4a.vv(u32,u8,u8)", "OPS",
            0x10000000LL, 768LL, asimd_dp4a_vv_u32u8u8);
    }
#endif

#ifdef _BF16_
    if (features & ARM64_BF16)
    {
        reg_new_isa("bf16", "mmla(f32,bf16,bf16)", "FLOPS",
            0x10000000LL, 768LL, asimd_mmla_fp32bf16bf16);
        reg_new_isa("bf16", "dp2a.vs(f32,bf16,bf16)", "FLOPS",
            0x10000000LL, 384LL, asimd_dp2a_vs_fp32bf16bf16);
        reg_new_isa("bf16", "dp2a.vv(f32,bf16,bf16)", "FLOPS",
            0x10000000LL, 384LL, asimd_dp2a_vv_fp32bf16bf16);
    }
#endif

#ifdef _ASIMD_HP_
    if (features & ARM64_FP16)
    {
        reg_new_isa("asimd_hp", "fmla.vs(fp16,fp16,fp16)", "FLOPS",
            0x10000000LL, 384LL, asimd_fmla_vs_fp16fp16fp16);
        reg_new_isa("asimd_hp", "fmla.vv(fp16,fp16,fp16)", "FLOPS",
            0x10000000LL, 384LL, asimd_fmla_vv_fp16fp16fp16);
    }
#endif

#ifdef _ASIMD_
    if (features & ARM64_ASIMD)
    {
        reg_new_isa("asimd", "fmla.vs(f32,f32,f32)", "FLOPS",
            0x10000000LL, 192LL, asimd_fmla_vs_f32f32f32);
        reg_new_isa("asimd", "fmla.vv(f32,f32,f32)", "FLOPS",
            0x10000000LL, 192LL, asimd_fmla_vv_f32f32f32);
        reg_new_isa("asimd", "fmla.vs(f64,f64,f64)", "FLOPS",
            0x10000000LL, 96LL, asimd_fmla_vs_f64f64f64);
        reg_new_isa("asimd", "fmla.vv(f64,f64,f64)", "FLOPS",
            0x10000000LL, 96LL, asimd_fmla_vv_f64f64f64);
    }
#endif

#ifdef _SVE_
    if ((features & (ARM64_SVE)) == (ARM64_SVE))
        reg_scalable("sve", "fmla(f16,f16,f16)", "FLOPS", sve_vector_bytes, 2, 1,
            false, sve_fmla_f16);
#endif
#ifdef _SVE_
    if ((features & (ARM64_SVE)) == (ARM64_SVE))
        reg_scalable("sve", "fmla(f32,f32,f32)", "FLOPS", sve_vector_bytes, 4, 1,
            false, sve_fmla_f32);
#endif
#ifdef _SVE_
    if ((features & (ARM64_SVE)) == (ARM64_SVE))
        reg_scalable("sve", "fmla(f64,f64,f64)", "FLOPS", sve_vector_bytes, 8, 1,
            false, sve_fmla_f64);
#endif
#ifdef _SVE_
    if ((features & (ARM64_SVE)) == (ARM64_SVE))
        reg_scalable("sve", "sdot(s32,s8,s8)", "OPS", sve_vector_bytes, 4, 4,
            false, sve_sdot_s8);
#endif
#ifdef _SVE_
    if ((features & (ARM64_SVE)) == (ARM64_SVE))
        reg_scalable("sve", "udot(u32,u8,u8)", "OPS", sve_vector_bytes, 4, 4,
            false, sve_udot_u8);
#endif
#ifdef _SVE2_
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2))
        reg_scalable("sve2", "smlalb(s16,s8,s8)", "OPS", sve_vector_bytes, 2, 1,
            false, sve2_smlalb_s8);
#endif
#ifdef _SVE2_
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2))
        reg_scalable("sve2", "smlalt(s16,s8,s8)", "OPS", sve_vector_bytes, 2, 1,
            false, sve2_smlalt_s8);
#endif
#ifdef _SVE2_
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2))
        reg_scalable("sve2", "smlalb(s32,s16,s16)", "OPS", sve_vector_bytes, 4, 1,
            false, sve2_smlalb_s16);
#endif
#ifdef _SVE2_
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2))
        reg_scalable("sve2", "smlalt(s32,s16,s16)", "OPS", sve_vector_bytes, 4, 1,
            false, sve2_smlalt_s16);
#endif
#ifdef _SVE2_
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2))
        reg_scalable("sve2", "smlalb(s64,s32,s32)", "OPS", sve_vector_bytes, 8, 1,
            false, sve2_smlalb_s32);
#endif
#ifdef _SVE2_
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2))
        reg_scalable("sve2", "smlalt(s64,s32,s32)", "OPS", sve_vector_bytes, 8, 1,
            false, sve2_smlalt_s32);
#endif
#ifdef _SME_
    if ((features & (ARM64_SME | ARM64_SME_F32)) == (ARM64_SME | ARM64_SME_F32))
        reg_scalable("sme", "fmopa(f32,f32,f32)", "FLOPS", sme_vector_bytes, 4, 1,
            true, sme_fmopa_f32);
#endif
#ifdef _SME_
    if ((features & (ARM64_SME | ARM64_SME_F16)) == (ARM64_SME | ARM64_SME_F16))
        reg_scalable("sme", "fmopa(f32,f16,f16)", "FLOPS", sme_vector_bytes, 4, 2,
            true, sme_fmopa_f16);
#endif
#ifdef _SME_
    if ((features & (ARM64_SME | ARM64_SME_BF16)) == (ARM64_SME | ARM64_SME_BF16))
        reg_scalable("sme", "bfmopa(f32,bf16,bf16)", "FLOPS", sme_vector_bytes, 4, 2,
            true, sme_bfmopa_bf16);
#endif
#ifdef _SME_
    if ((features & (ARM64_SME | ARM64_SME_I8)) == (ARM64_SME | ARM64_SME_I8))
        reg_scalable("sme", "smopa(s32,s8,s8)", "OPS", sme_vector_bytes, 4, 4,
            true, sme_smopa_s8);
#endif
#ifdef _SME_
    if ((features & (ARM64_SME | ARM64_SME_I8)) == (ARM64_SME | ARM64_SME_I8))
        reg_scalable("sme", "umopa(u32,u8,u8)", "OPS", sme_vector_bytes, 4, 4,
            true, sme_umopa_u8);
#endif
#ifdef _SME2_
    if ((features & (ARM64_SME | ARM64_SME2 | ARM64_SME_F32)) == (ARM64_SME | ARM64_SME2 | ARM64_SME_F32))
        reg_scalable("sme2", "fmla.vg4(f32,f32,f32)", "FLOPS", sme_vector_bytes, 4, 4,
            false, sme2_fmla_f32);
#endif
#ifdef _SME2_
    if ((features & (ARM64_SME | ARM64_SME2 | ARM64_SME_F16)) == (ARM64_SME | ARM64_SME2 | ARM64_SME_F16))
        reg_scalable("sme2", "fdot.vg4(f32,f16,f16)", "FLOPS", sme_vector_bytes, 4, 8,
            false, sme2_fdot_f16);
#endif
#ifdef _SME2_
    if ((features & (ARM64_SME | ARM64_SME2 | ARM64_SME_BF16)) == (ARM64_SME | ARM64_SME2 | ARM64_SME_BF16))
        reg_scalable("sme2", "bfdot.vg4(f32,bf16,bf16)", "FLOPS", sme_vector_bytes, 4, 8,
            false, sme2_bfdot_bf16);
#endif
#ifdef _SME2_
    if ((features & (ARM64_SME | ARM64_SME2 | ARM64_SME_I8)) == (ARM64_SME | ARM64_SME2 | ARM64_SME_I8))
        reg_scalable("sme2", "sdot.vg4(s32,s8,s8)", "OPS", sme_vector_bytes, 4, 16,
            false, sme2_sdot_s8);
#endif
#ifdef _SME2_
    if ((features & (ARM64_SME | ARM64_SME2 | ARM64_SME_I8)) == (ARM64_SME | ARM64_SME2 | ARM64_SME_I8))
        reg_scalable("sme2", "udot.vg4(u32,u8,u8)", "OPS", sme_vector_bytes, 4, 16,
            false, sme2_udot_u8);
#endif
}

static void usage(const char *program)
{
    fprintf(stderr, "Usage: %s --thread_pool='[0-3]' [--idle_time=0]\n", program);
    fprintf(stderr, "       [--isa=sve,sve2,sme,sme2] [--iterations=N] [--list]\n");
    fprintf(stderr, "--list needs no thread pool; only supported, compiled tests are listed.\n");
}

int main(int argc, char *argv[])
{
    vector<int> threads;
    uint32_t idle_time = 0;
    int64_t iterations = 0;
    string isa_filter;
    bool list_only = false;
    for (int i = 1; i < argc; i++)
    {
        if (strncmp(argv[i], "--thread_pool=", 14) == 0)
        {
            if (!threads.empty() || !parse_thread_pool(argv[i] + 14, threads))
            {
                fprintf(stderr, "Invalid thread pool: %s\n", argv[i] + 14);
                return 1;
            }
        }
        else if (strncmp(argv[i], "--iterations=", 13) == 0 ||
                 strncmp(argv[i], "--idle_time=", 12) == 0)
        {
            const bool is_iterations = argv[i][2] == 'i' && argv[i][3] == 't';
            const char *value = argv[i] + (is_iterations ? 13 : 12);
            char *end;
            errno = 0;
            const long long number = strtoll(value, &end, 10);
            if (*value < '0' || *value > '9' || *end != '\0' || errno ||
                number < (is_iterations ? 1 : 0) ||
                number > (is_iterations ? 1000000000000LL : UINT32_MAX))
            {
                fprintf(stderr, "Invalid numeric argument: %s\n", argv[i]);
                return 1;
            }
            if (is_iterations) iterations = number;
            else idle_time = static_cast<uint32_t>(number);
        }
        else if (strncmp(argv[i], "--isa=", 6) == 0) isa_filter = argv[i] + 6;
        else if (strcmp(argv[i], "--list") == 0) list_only = true;
        else if (strcmp(argv[i], "--help") == 0) { usage(argv[0]); return 0; }
        else { usage(argv[0]); return 1; }
    }

    cpufp_register_isa();
    if (!isa_filter.empty())
    {
        // Accept the explicit generation names as aliases for SVE and SME.
        stringstream names(isa_filter);
        string name, normalized;
        while (getline(names, name, ','))
        {
            if (name == "sve1") name = "sve";
            if (name == "sme1") name = "sme";
            normalized += "," + name;
        }
        isa_filter = normalized.substr(1);
        vector<cpubm_t> selected;
        for (const auto &item : bm_list)
            if (("," + isa_filter + ",").find("," + item.isa + ",") != string::npos)
                selected.push_back(item);
        bm_list.swap(selected);
    }
    if (iterations > 0)
        for (auto &item : bm_list) item.loop_time = iterations;
    if (list_only)
    {
        for (const auto &item : bm_list)
        {
            printf("%-10s %-32s", item.isa.c_str(), item.type.c_str());
            if (item.vector_bytes != nullptr)
            {
                const int64_t bytes = item.vector_bytes();
                printf(" %s=%lld bits; %lld ops/loop",
                    item.isa == "sme" || item.isa == "sme2" ? "SVL" : "VL",
                    static_cast<long long>(bytes * 8),
                    static_cast<long long>(scalable_ops(bytes, item.element_bytes,
                        item.products, item.outer_product)));
            }
            printf("\n");
        }
        if (bm_list.empty()) printf("No supported benchmarks match the ISA filter.\n");
        return 0;
    }
    if (threads.empty()) { usage(argv[0]); return 1; }
    if (bm_list.empty())
    {
        fprintf(stderr, "No supported benchmarks match the ISA filter.\n");
        return 1;
    }
    cpubm_do_bench(threads, idle_time);
    return 0;
}
