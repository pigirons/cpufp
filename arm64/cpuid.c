#include <stdio.h>
#include <stdint.h>
#include <asm/hwcap.h>
#include <sys/auxv.h>

int main()
{
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

    return 0;
}

