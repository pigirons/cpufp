#include <arm_sme.h>
#include "scalable.h"

#ifndef __ARM_FEATURE_LOCALLY_STREAMING
#error "SME tests require ACLE locally-streaming support"
#endif

// Four independent groups of four ZA vectors, repeated six times. The group
// indices 0..3 remain distinct even with the minimum 128-bit streaming VL.
#define SME2_KERNEL(NAME, VECTOR, GROUP, DUP, OP, READ, GET, STORE, OUTPUT) \
extern "C" __arm_locally_streaming __arm_new("za")                       \
void NAME(int64_t iterations, void *output)                              \
{                                                                       \
    const VECTOR a = DUP(1);                                             \
    const GROUP group = svcreate4(a, a, a, a);                            \
    svzero_za();                                                        \
    for (int64_t i = 0; i < iterations; i++)                             \
    {                                                                   \
        for (int j = 0; j < 6; j++)                                     \
        {                                                               \
            OP(0, group, group);                                        \
            OP(1, group, group);                                        \
            OP(2, group, group);                                        \
            OP(3, group, group);                                        \
        }                                                               \
    }                                                                   \
    if (output != nullptr)                                              \
    {                                                                   \
        OUTPUT *out = static_cast<OUTPUT *>(output);                     \
        const uint64_t lanes = svcntsw();                               \
        for (uint32_t slice = 0; slice < 4; slice++)                     \
        {                                                               \
            const auto value = READ(slice);                             \
            STORE(svptrue_b32(), out, GET(value, 0));                    \
            STORE(svptrue_b32(), out + lanes, GET(value, 1));            \
            STORE(svptrue_b32(), out + lanes * 2, GET(value, 2));        \
            STORE(svptrue_b32(), out + lanes * 3, GET(value, 3));        \
            out += lanes * 4;                                           \
        }                                                               \
    }                                                                   \
}

SME2_KERNEL(sme2_fmla_f32, svfloat32_t, svfloat32x4_t, svdup_f32,
    svmla_za32_f32_vg1x4, svread_za32_f32_vg1x4, svget4_f32, svst1_f32, float)
SME2_KERNEL(sme2_fdot_f16, svfloat16_t, svfloat16x4_t, svdup_f16,
    svdot_za32_f16_vg1x4, svread_za32_f32_vg1x4, svget4_f32, svst1_f32, float)
SME2_KERNEL(sme2_bfdot_bf16, svbfloat16_t, svbfloat16x4_t, svdup_bf16,
    svdot_za32_bf16_vg1x4, svread_za32_f32_vg1x4, svget4_f32, svst1_f32, float)
SME2_KERNEL(sme2_sdot_s8, svint8_t, svint8x4_t, svdup_s8,
    svdot_za32_s8_vg1x4, svread_za32_s32_vg1x4, svget4_s32, svst1_s32, int32_t)
SME2_KERNEL(sme2_udot_u8, svuint8_t, svuint8x4_t, svdup_u8,
    svdot_za32_u8_vg1x4, svread_za32_u32_vg1x4, svget4_u32, svst1_u32, uint32_t)
#undef SME2_KERNEL
