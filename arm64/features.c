#include "arm64_features.h"

#if defined(__APPLE__)
#include <sys/types.h>
#include <sys/sysctl.h>

static int feature(const char *name)
{
    int value = 0;
    size_t size = sizeof(value);
    return sysctlbyname(name, &value, &size, 0, 0) == 0 && value != 0;
}
#elif defined(__linux__)
#include <asm/hwcap.h>
#include <sys/auxv.h>
#endif

uint64_t arm64_get_features(void)
{
    uint64_t result = 0;
#if defined(__APPLE__)
    if (feature("hw.optional.arm.AdvSIMD")) result |= ARM64_ASIMD;
    if (feature("hw.optional.arm.FEAT_FP16")) result |= ARM64_FP16;
    if (feature("hw.optional.arm.FEAT_DotProd")) result |= ARM64_DOT;
    if (feature("hw.optional.arm.FEAT_BF16")) result |= ARM64_BF16;
    if (feature("hw.optional.arm.FEAT_I8MM")) result |= ARM64_I8MM;
    // Darwin exposes baseline SME arithmetic as one feature. Optional
    // non-widening F16F16/B16B16 differ from the F16/BF16 -> F32 tests here.
    if (feature("hw.optional.arm.FEAT_SME"))
        result |= ARM64_SME | ARM64_SME_F32 | ARM64_SME_F16 |
            ARM64_SME_BF16 | ARM64_SME_I8;
    if (feature("hw.optional.arm.FEAT_SME2")) result |= ARM64_SME2;
    // SME does NOT imply non-streaming SVE/SVE2 on Apple Silicon.
#elif defined(__linux__)
    const uint64_t hwcap = getauxval(AT_HWCAP);
    const uint64_t hwcap2 = getauxval(AT_HWCAP2);
#ifdef HWCAP_ASIMD
    if (hwcap & HWCAP_ASIMD) result |= ARM64_ASIMD;
#endif
#ifdef HWCAP_ASIMDHP
    if (hwcap & HWCAP_ASIMDHP) result |= ARM64_FP16;
#endif
#ifdef HWCAP_ASIMDDP
    if (hwcap & HWCAP_ASIMDDP) result |= ARM64_DOT;
#endif
#ifdef HWCAP2_BF16
    if (hwcap2 & HWCAP2_BF16) result |= ARM64_BF16;
#endif
#ifdef HWCAP2_I8MM
    if (hwcap2 & HWCAP2_I8MM) result |= ARM64_I8MM;
#endif
#ifdef HWCAP_SVE
    if (hwcap & HWCAP_SVE) result |= ARM64_SVE;
#endif
#ifdef HWCAP2_SVE2
    if (hwcap2 & HWCAP2_SVE2) result |= ARM64_SVE2;
#endif
#ifdef HWCAP2_SME
    if (hwcap2 & HWCAP2_SME) result |= ARM64_SME;
#endif
#ifdef HWCAP2_SME2
    if (hwcap2 & HWCAP2_SME2) result |= ARM64_SME2;
#endif
#ifdef HWCAP2_SME_F32F32
    if (hwcap2 & HWCAP2_SME_F32F32) result |= ARM64_SME_F32;
#endif
#ifdef HWCAP2_SME_F16F32
    if (hwcap2 & HWCAP2_SME_F16F32) result |= ARM64_SME_F16;
#endif
#ifdef HWCAP2_SME_B16F32
    if (hwcap2 & HWCAP2_SME_B16F32) result |= ARM64_SME_BF16;
#endif
#ifdef HWCAP2_SME_I8I32
    if (hwcap2 & HWCAP2_SME_I8I32) result |= ARM64_SME_I8;
#endif
#endif
    return result;
}
