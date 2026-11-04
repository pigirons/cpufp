#ifndef CPUFP_ARM64_FEATURES_H
#define CPUFP_ARM64_FEATURES_H

#include <stdint.h>

enum arm64_feature
{
    ARM64_ASIMD = 1ULL << 0,
    ARM64_FP16 = 1ULL << 1,
    ARM64_DOT = 1ULL << 2,
    ARM64_BF16 = 1ULL << 3,
    ARM64_I8MM = 1ULL << 4,
    ARM64_SVE = 1ULL << 5,
    ARM64_SVE2 = 1ULL << 6,
    ARM64_SME = 1ULL << 7,
    ARM64_SME2 = 1ULL << 8,
    ARM64_SME_F32 = 1ULL << 9,
    ARM64_SME_F16 = 1ULL << 10,
    ARM64_SME_BF16 = 1ULL << 11,
    ARM64_SME_I8 = 1ULL << 12,
};

#ifdef __cplusplus
extern "C" {
#endif
uint64_t arm64_get_features(void);
#ifdef __cplusplus
}
#endif

#endif
