#ifndef _CPUID_X86_H
#define _CPUID_X86_H

typedef enum
{
    _CPUID_X86_SSE_         = 0x1,
    _CPUID_X86_AVX_         = 0x2,
    _CPUID_X86_FMA_         = 0x4,
    _CPUID_X86_AVX512F_     = 0x8,
    _CPUID_X86_AVX512_VNNI_ = 0x10,
    _CPUID_X86_AVX_VNNI_    = 0x20,
} cpuid_x86_feature_t;

void cpuid_x86_init();

int cpuid_x86_support(cpuid_x86_feature_t isa);

#endif

