#include <stdio.h>
#include <stdint.h>
#ifndef __APPLE__
#include <asm/hwcap.h>
#include <sys/auxv.h>
#else
#include <stdlib.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <string.h>
#endif

int main()
{
#ifndef __APPLE__
    uint64_t hwcaps = getauxval(AT_HWCAP);

#ifdef HWCAP2_I8MM
    if (hwcaps & HWCAP2_I8MM)
    {
        printf("_I8MM_\n");
    }
#endif

#ifdef HWCAP2_BF16
    if (hwcaps & HWCAP2_BF16)
    {
        printf("_BF16_\n");
    }
#endif

#ifdef HWCAP_ASIMDDP
    if (hwcaps & HWCAP_ASIMDDP)
    {
        printf("_ASIMD_DP_\n");
    }
#endif

#ifdef HWCAP_ASIMDHP
    if (hwcaps & HWCAP_ASIMDHP)
    {
        printf("_ASIMD_HP_\n");
    }
#endif

#ifdef HWCAP_ASIMD
    if (hwcaps & HWCAP_ASIMD)
    {
        printf("_ASIMD_\n");
    }
#endif
#else
    size_t size = 4;
    uint32_t res;

    sysctlbyname("hw.optional.arm.FEAT_I8MM", &res, &size, NULL, 0);
    if (res == 1) {
        printf("_I8MM_\n");
    }

    sysctlbyname("hw.optional.arm.FEAT_BF16", &res, &size, NULL, 0);
    if (res == 1) {
        printf("_BF16_\n");
    }

    sysctlbyname("hw.optional.arm.FEAT_DotProd", &res, &size, NULL, 0);
    if (res == 1) {
        printf("_ASIMD_DP_\n");
    }

    sysctlbyname("hw.optional.AdvSIMD_HPFPCv", &res, &size, NULL, 0);
    if (res == 1) {
        printf("_ASIMD_HP_\n");
    }

    sysctlbyname("hw.optional.AdvSIMD", &res, &size, NULL, 0);
    if (res == 1) {
        printf("_ASIMD_\n");
    }
#endif

    return 0;
}
