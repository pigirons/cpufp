#include <stdio.h>
#include <stdint.h>

#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)

uint32_t read_cpucfg(uint32_t reg)
{
    uint32_t val = 0;
    asm volatile("cpucfg %0, %1\n\t"
        :"=r"(val)
        :"r"(reg)
        );
    return val;
}

int main()
{
    uint32_t f_0x2 = read_cpucfg(0x2);

    if (BIT_TEST(f_0x2, 0))
    {
        if (BIT_TEST(f_0x2, 1))
        {
            printf("_FP_SP_\n");
        }
        if (BIT_TEST(f_0x2, 2))
        {
            printf("_FP_DP_\n");
        }
    }
    if (BIT_TEST(f_0x2, 6))
    {
        printf("_LSX_\n");
    }
    if (BIT_TEST(f_0x2, 7))
    {
        printf("_LASX_\n");
    }

    return 0;
}

