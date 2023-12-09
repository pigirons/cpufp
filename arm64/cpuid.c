#include <stdio.h>
#include <stdint.h>
#include <asm/hwcap.h>
#include <sys/auxv.h>

int main()
{
    uint64_t hwcaps = getauxval(AT_HWCAP);

    if (hwcaps & HWCAP_ASIMDDP)
    {
        printf("_ASIMD_DP_\n");
    }

    if (hwcaps & HWCAP_ASIMDHP)
    {
        printf("_ASIMD_HP_\n");
    }
    
    if (hwcaps & HWCAP_ASIMD)
    {
        printf("_ASIMD_\n");
    }

	return 0;
}

