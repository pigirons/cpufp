#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define CPUID_MAX_FEAT 8
#define GET_MAJOR_KEY(key) ((key) / 32)
#define GET_MINOR_KEY(key) ((key) % 32)
#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)

typedef enum
{
    _CPUID_X86_SSE_   = 0,
    _CPUID_X86_SSE2_  = 1,
    _CPUID_X86_SSE3_  = 2,
    _CPUID_X86_SSSE3_ = 3,
    _CPUID_X86_SSE41_ = 4,
    _CPUID_X86_SSE42_ = 5,
    _CPUID_X86_AVX_   = 6,
    _CPUID_X86_AVX2_  = 7,
    _CPUID_X86_FMA_   = 8,
} cpuid_x86_feature_t;

struct cpuid_t
{
    unsigned int ieax;
    unsigned int iecx;
    unsigned int eax;
    unsigned int ebx;
    unsigned int ecx;
    unsigned int edx;
};

static unsigned int feat[CPUID_MAX_FEAT];

static void cpuid_x86_exec(struct cpuid_t *cpuid)
{
    asm volatile("pushq %%rbx\n"
        "cpuid\n"
        "movl %%ebx, %1\n"
        "popq %%rbx\n"
        : "=a"(cpuid->eax), "=r"(cpuid->ebx), "=c"(cpuid->ecx), "=d"(cpuid->edx)
        : "a"(cpuid->ieax), "c"(cpuid->iecx)
        : "cc");
}

static void cpuid_x86_init()
{
    struct cpuid_t cpuid;

    memset(feat, 0, CPUID_MAX_FEAT * sizeof(unsigned int));

    cpuid.ieax = 0x1;
    cpuid.iecx = 0x0;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.edx, 25))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_SSE_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_SSE_));
    }
    if (BIT_TEST(cpuid.edx, 26))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_SSE2_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_SSE2_));
    }
    if (BIT_TEST(cpuid.ecx, 0))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_SSE3_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_SSE3_));
    }
    if (BIT_TEST(cpuid.ecx, 9))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_SSSE3_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_SSSE3_));
    }
    if (BIT_TEST(cpuid.ecx, 19))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_SSE41_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_SSE41_));
    }
    if (BIT_TEST(cpuid.ecx, 20))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_SSE42_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_SSE42_));
    }
    if (BIT_TEST(cpuid.ecx, 28))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_AVX_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_AVX_));
    }
    if (BIT_TEST(cpuid.ecx, 12))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_FMA_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_FMA_));
    }

    cpuid.ieax = 0x7;
    cpuid.iecx = 0x0;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.ebx, 5))
    {
        feat[GET_MAJOR_KEY(_CPUID_X86_AVX2_)] |=
            (0x1 << GET_MINOR_KEY(_CPUID_X86_AVX2_));
    }
}

unsigned int cpuid_x86_support(cpuid_x86_feature_t feature)
{
    return (feat[GET_MAJOR_KEY(feature)] >> GET_MINOR_KEY(feature)) & 0x1;
}

int main()
{
    cpuid_x86_init();
    if (cpuid_x86_support(_CPUID_X86_FMA_))
    {
        printf("as -o cpufp_x86_fma.o cpufp_x86_fma.s\n");
        printf("gcc -pthread -O3 -D_USE_X86_FMA -c cpufp_x86.c\n");
        printf("gcc -pthread -O3 -o cpufp cpufp_x86.o cpufp_x86_fma.o\n");
    }
    else if (cpuid_x86_support(_CPUID_X86_AVX_))
    {
        printf("as -o cpufp_x86_avx.o cpufp_x86_avx.s\n");
        printf("gcc -pthread -O3 -D_USE_X86_AVX -c cpufp_x86.c\n");
        printf("gcc -pthread -O3 -o cpufp cpufp_x86.o cpufp_x86_avx.o\n");
    }
    else if (cpuid_x86_support(_CPUID_X86_SSE2_))
    {
        printf("as -o cpufp_x86_sse.o cpufp_x86_sse.s\n");
        printf("gcc -pthread -O3 -D_USE_X86_SSE -c cpufp_x86.c\n");
        printf("gcc -pthread -O3 -o cpufp cpufp_x86.o cpufp_x86_sse.o\n");
    }
    
    return 0;
}

