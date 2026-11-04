#ifndef CPUFP_ARM64_SCALABLE_H
#define CPUFP_ARM64_SCALABLE_H

#include <stdint.h>

// Ordinary non-streaming, private-ZA interfaces. A null output measures only
// register arithmetic; tests use non-null outputs outside timed runs.
extern "C" {
int64_t sve_vector_bytes(void);
int64_t sme_vector_bytes(void);
#define CPUFP_KERNEL(name) void name(int64_t iterations, void *output)
CPUFP_KERNEL(sve_fmla_f16);
CPUFP_KERNEL(sve_fmla_f32);
CPUFP_KERNEL(sve_fmla_f64);
CPUFP_KERNEL(sve_sdot_s8);
CPUFP_KERNEL(sve_udot_u8);
CPUFP_KERNEL(sve2_smlalb_s8);
CPUFP_KERNEL(sve2_smlalt_s8);
CPUFP_KERNEL(sve2_smlalb_s16);
CPUFP_KERNEL(sve2_smlalt_s16);
CPUFP_KERNEL(sve2_smlalb_s32);
CPUFP_KERNEL(sve2_smlalt_s32);
CPUFP_KERNEL(sme_fmopa_f32);
CPUFP_KERNEL(sme_fmopa_f16);
CPUFP_KERNEL(sme_bfmopa_bf16);
CPUFP_KERNEL(sme_smopa_s8);
CPUFP_KERNEL(sme_umopa_u8);
CPUFP_KERNEL(sme2_fmla_f32);
CPUFP_KERNEL(sme2_fdot_f16);
CPUFP_KERNEL(sme2_bfdot_bf16);
CPUFP_KERNEL(sme2_sdot_s8);
CPUFP_KERNEL(sme2_udot_u8);
#undef CPUFP_KERNEL
}

// Each loop has 24 arithmetic instructions; each multiply-add counts as 2 ops.
// SME outer products scale quadratically with SVL, vector kernels linearly.
inline int64_t scalable_ops(int64_t bytes, int element_bytes,
    int products, bool outer_product)
{
    const int64_t lanes = bytes / element_bytes;
    return 24 * 2 * products * lanes * (outer_product ? lanes : 1);
}

#endif
