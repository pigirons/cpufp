#include <stdio.h>
#include "arm64_features.h"

int main(void)
{
    const uint64_t features = arm64_get_features();
    if (features & ARM64_I8MM) puts("_I8MM_");
    if (features & ARM64_BF16) puts("_BF16_");
    if (features & ARM64_DOT) puts("_ASIMD_DP_");
    if (features & ARM64_FP16) puts("_ASIMD_HP_");
    if (features & ARM64_ASIMD) puts("_ASIMD_");
    if (features & ARM64_SVE) puts("_SVE_");
    if (features & ARM64_SME) puts("_SME_");
    if ((features & (ARM64_SVE | ARM64_SVE2)) == (ARM64_SVE | ARM64_SVE2)) puts("_SVE2_");
    if ((features & (ARM64_SME | ARM64_SME2)) == (ARM64_SME | ARM64_SME2)) puts("_SME2_");
    return 0;
}
