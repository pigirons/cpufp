#include <arm_sme.h>
#include "scalable.h"

#ifndef __ARM_FEATURE_LOCALLY_STREAMING
#error "SME tests require ACLE locally-streaming support"
#endif

extern "C" int64_t sme_vector_bytes(void)
{
    return svcntsb();
}

// Six groups of four independent ZA tile accumulators = 24 outer products.
// ACLE manages SMSTART/SMSTOP, private ZA and callee-saved vector state.
#define SME_KERNEL(NAME, VECTOR, DUP, PRED, MOPA, OUTPUT)                  \
extern "C" __arm_locally_streaming __arm_new("za")                       \
void NAME(int64_t iterations, void *output)                              \
{                                                                       \
    const svbool_t pg = PRED();                                          \
    const VECTOR a = DUP(1);                                             \
    svzero_za();                                                        \
    for (int64_t i = 0; i < iterations; i++)                             \
    {                                                                   \
        for (int j = 0; j < 6; j++)                                     \
        {                                                               \
            MOPA(0, pg, pg, a, a);                                       \
            MOPA(1, pg, pg, a, a);                                       \
            MOPA(2, pg, pg, a, a);                                       \
            MOPA(3, pg, pg, a, a);                                       \
        }                                                               \
    }                                                                   \
    if (output != nullptr)                                              \
    {                                                                   \
        OUTPUT *out = static_cast<OUTPUT *>(output);                     \
        const uint64_t lanes = svcntsw();                               \
        svst1_hor_za32(0, 0, svptrue_b32(), out);                         \
        svst1_hor_za32(1, 0, svptrue_b32(), out + lanes);                 \
        svst1_hor_za32(2, 0, svptrue_b32(), out + lanes * 2);             \
        svst1_hor_za32(3, 0, svptrue_b32(), out + lanes * 3);             \
    }                                                                   \
}

SME_KERNEL(sme_fmopa_f32, svfloat32_t, svdup_f32, svptrue_b32, svmopa_za32_f32_m, float)
SME_KERNEL(sme_fmopa_f16, svfloat16_t, svdup_f16, svptrue_b16, svmopa_za32_f16_m, float)
SME_KERNEL(sme_bfmopa_bf16, svbfloat16_t, svdup_bf16, svptrue_b16, svmopa_za32_bf16_m, float)
SME_KERNEL(sme_smopa_s8, svint8_t, svdup_s8, svptrue_b8, svmopa_za32_s8_m, int32_t)
SME_KERNEL(sme_umopa_u8, svuint8_t, svdup_u8, svptrue_b8, svmopa_za32_u8_m, uint32_t)
#undef SME_KERNEL
