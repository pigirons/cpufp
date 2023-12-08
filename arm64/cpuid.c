#include <stdio.h>

typedef enum
{
    _ASIMD_   = 0x1,
    _ASIMDHP_ = 0x2,
    _ASIMDDP_ = 0x3,
} x64_simd_t;

static unsigned int feat = 0;

#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)
#define SET_FEAT(feat_mask) { feat |= (feat_mask); }

static void cpuid_init()
{
    if (feat != 0)
    {
        return;
    }
}

int main()
{
    cpuid_init();

    printf("_ASIMD_\n");

    return 0;
}

