#include <stdio.h>

struct cpuid_t
{
    unsigned int eax;
    unsigned int ebx;
    unsigned int ecx;
    unsigned int edx;
};

#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)

static void cpuid_x86_exec(unsigned int ieax,
    unsigned int iecx,
    struct cpuid_t *cpuid)
{
    asm volatile ("cpuid"
                  : "=a"(cpuid->eax), "=b"(cpuid->ebx), "=c"(cpuid->ecx), "=d"(cpuid->edx)
                  : "0"(ieax), "2"(iecx));
}

int main()
{
    struct cpuid_t cpuid_0x1_0x0, cpuid_0x7_0x0, cpuid_0x7_0x1;;

    cpuid_x86_exec(0x1, 0x0, &cpuid_0x1_0x0);
    cpuid_x86_exec(0x7, 0x0, &cpuid_0x7_0x0);
    cpuid_x86_exec(0x7, 0x1, &cpuid_0x7_0x1);

    if (BIT_TEST(cpuid_0x7_0x0.edx, 24))
    {
        if (BIT_TEST(cpuid_0x7_0x0.edx, 25))
        {
            printf("_AMX_INT8_\n");
        }
        if (BIT_TEST(cpuid_0x7_0x0.edx, 22))
        {
            printf("_AMX_BF16_\n");
        }
    }
    if (BIT_TEST(cpuid_0x7_0x1.eax, 4))
    {
        printf("_AVX_VNNI_\n");
    }
    if (BIT_TEST(cpuid_0x7_0x1.edx, 4))
    {
        printf("_AVX_VNNI_INT8_\n");
    }
    if (BIT_TEST(cpuid_0x7_0x0.ecx, 11))
    {
        printf("_AVX512_VNNI_\n");
    }
    if (BIT_TEST(cpuid_0x7_0x1.eax, 5))
    {
        printf("_AVX512_BF16_\n");
    }
    if (BIT_TEST(cpuid_0x7_0x0.edx, 23))
    {
        printf("_AVX512_FP16_\n");
    }
    if (BIT_TEST(cpuid_0x7_0x0.ebx, 16))
    {
        printf("_AVX512F_\n");
    }
    if (BIT_TEST(cpuid_0x1_0x0.ecx, 12))
    {
        printf("_FMA_\n");
    }
    if (BIT_TEST(cpuid_0x1_0x0.ecx, 28))
    {
        printf("_AVX_\n");
    }
    if (BIT_TEST(cpuid_0x1_0x0.edx, 25))
    {
        printf("_SSE_\n");
    }
    if (BIT_TEST(cpuid_0x1_0x0.edx, 26))
    {
        printf("_SSE2_\n");
    }

    return 0;
}

