#include <stdio.h>

typedef enum
{
    _SSE_           = 0x1,
    _SSE2_          = 0x2,
    _AVX_           = 0x4,
    _FMA_           = 0x8,
    _AVX512F_       = 0x10,
    _AVX512_VNNI_   = 0x20,
    _AVX_VNNI_      = 0x40,
    _AVX_VNNI_INT8_ = 0x80,
    _AVX512_BF16_   = 0x100,
    _AVX512_FP16_   = 0x200,
} x64_simd_t;

struct cpuid_t
{
    unsigned int eax;
    unsigned int ebx;
    unsigned int ecx;
    unsigned int edx;
};

static unsigned int feat = 0;

#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)
#define SET_FEAT(feat_mask) { feat |= (feat_mask); }

static void cpuid_x86_exec(unsigned int ieax,
    unsigned int iecx,
    struct cpuid_t *cpuid)
{
    asm volatile ("cpuid"
                  : "=a"(cpuid->eax), "=b"(cpuid->ebx), "=c"(cpuid->ecx), "=d"(cpuid->edx)
                  : "0"(ieax), "2"(iecx));
}

static void cpuid_init()
{
    struct cpuid_t cpuid;

    if (feat != 0)
    {
        return;
    }

    /*
     * Test SSE/SSE2/AVX/FMA
     */
    cpuid_x86_exec(0x1, 0x0, &cpuid);

    if (BIT_TEST(cpuid.edx, 25))
    {
        SET_FEAT(_SSE_);
    }
    if (BIT_TEST(cpuid.edx, 26))
    {
        SET_FEAT(_SSE2_);
    }
    if (BIT_TEST(cpuid.ecx, 28))
    {
        SET_FEAT(_AVX_);
    }
    if (BIT_TEST(cpuid.ecx, 12))
    {
        SET_FEAT(_FMA_);
    }

    /*
     * Test AVX512F/AVX512_VNNI/AVX512_FP16
     */
    cpuid_x86_exec(0x7, 0x0, &cpuid);

    if (BIT_TEST(cpuid.ebx, 16))
    {
        SET_FEAT(_AVX512F_);
    }
    if (BIT_TEST(cpuid.ecx, 11))
    {
        SET_FEAT(_AVX512_VNNI_);
    }
    if (BIT_TEST(cpuid.edx, 23))
    {
        SET_FEAT(_AVX512_FP16_);
    }
    
    /*
     * Test AVX_VNNI/AVX_VNNI_INT8/AVX512_BF16
     */
    cpuid_x86_exec(0x7, 0x1, &cpuid);

    if (BIT_TEST(cpuid.eax, 4))
    {
        SET_FEAT(_AVX_VNNI_);
    }
    if (BIT_TEST(cpuid.eax, 5))
    {
        SET_FEAT(_AVX512_BF16_);
    }
    if (BIT_TEST(cpuid.edx, 4))
    {
        SET_FEAT(_AVX_VNNI_INT8_);
    }
}

int main()
{
    cpuid_init();
    if ((feat & _AVX512_VNNI_) != 0)
    {
        printf("_AVX512_VNNI_\n");
    }
    if ((feat & _AVX_VNNI_) != 0)
    {
        printf("_AVX_VNNI_\n");
    }
    if ((feat & _AVX_VNNI_INT8_) != 0)
    {
        printf("_AVX_VNNI_INT8_\n");
    }
    if ((feat & _AVX512_FP16_) != 0)
    {
        printf("_AVX512_FP16_\n");
    }
    if ((feat & _AVX512_BF16_) != 0)
    {
        printf("_AVX512_BF16_\n");
    }
    if ((feat & _AVX512F_) != 0)
    {
        printf("_AVX512F_\n");
    }
    if ((feat & _FMA_) != 0)
    {
        printf("_FMA_\n");
    }
    if ((feat & _AVX_) != 0)
    {
        printf("_AVX_\n");
    }
    if ((feat & _SSE_) != 0)
    {
        printf("_SSE_\n");
    }
    if ((feat & _SSE2_) != 0)
    {
        printf("_SSE2_\n");
    }

    return 0;
}

