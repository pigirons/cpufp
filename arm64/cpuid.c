#include <stdio.h>
#include <stdint.h>
#include <asm/hwcap.h>
#include <sys/auxv.h>

typedef enum
{
    _ASIMD_    = 0x1,
    _ASIMD_HP_ = 0x2,
    _ASIMD_DP_ = 0x4,
} x64_simd_t;

#define GET_INTEVAL(FEAT, AT, SIZE) (((FEAT) >> (AT)) & ((0x1 << (SIZE)) - 1))

static uint64_t _GET_ID_AA64PFR0_EL1()
{
    uint64_t __cpuid;
    asm("mrs %0, ID_AA64PFR0_EL1" : "=r" (__cpuid));
    return __cpuid;
}

static uint64_t _GET_ID_AA64ISAR0_EL1()
{
    uint64_t __cpuid;
    asm("mrs %0, ID_AA64ISAR0_EL1" : "=r" (__cpuid));
    return __cpuid;
}

int main()
{
	if (!(getauxval(AT_HWCAP) & HWCAP_CPUID))
    {
		return 1;
	}
    uint64_t feat = 0;

    feat = _GET_ID_AA64ISAR0_EL1();
    if (GET_INTEVAL(feat, 44, 4) == 0x1)
    {
        printf("_ASIMD_DP_\n");
    }

    feat = _GET_ID_AA64PFR0_EL1();
    if (GET_INTEVAL(feat, 20, 4) == 0)
    {
        printf("_ASIMD_\n");
    }
    else if (GET_INTEVAL(feat, 20, 4) == 0x1)
    {
        printf("_ASIMD_HP_\n");
        printf("_ASIMD_\n");
    }

	return 0;
}

