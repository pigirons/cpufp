#define _GPU_SOURCE

#include "cpuid_x86.h"

struct cpuid_t
{
    unsigned int ieax;
    unsigned int iecx;
    unsigned int eax;
    unsigned int ebx;
    unsigned int ecx;
    unsigned int edx;
};

static unsigned int feat = 0;

#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)
#define SET_FEAT(feat_mask) { feat |= (feat_mask); }

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

void cpuid_x86_init()
{
    struct cpuid_t cpuid;

    if (feat != 0)
    {
        return;
    }

    /*
     * Test SSE/AVX/FMA
     */
    cpuid.ieax = 0x1;
    cpuid.iecx = 0x0;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.edx, 25))
    {
        SET_FEAT(_CPUID_X86_SSE_);
    }
    if (BIT_TEST(cpuid.ecx, 28))
    {
        SET_FEAT(_CPUID_X86_AVX_);
    }
    if (BIT_TEST(cpuid.ecx, 12))
    {
        SET_FEAT(_CPUID_X86_FMA_);
    }

    /*
     * Test AVX512F/AVX512-VNNI
     */
    cpuid.ieax = 0x7;
    cpuid.iecx = 0x0;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.ebx, 16))
    {
        SET_FEAT(_CPUID_X86_AVX512F_);
    }
    if (BIT_TEST(cpuid.ecx, 11))
    {
        SET_FEAT(_CPUID_X86_AVX512_VNNI_);
    }
    
    /*
     * Test AVX-VNNI
     */
    cpuid.ieax = 0x7;
    cpuid.iecx = 0x1;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.eax, 4))
    {
        SET_FEAT(_CPUID_X86_AVX_VNNI_);
    }
}

int cpuid_x86_support(cpuid_x86_feature_t isa)
{
    return ((feat & isa) != 0);
}

