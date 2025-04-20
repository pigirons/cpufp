.globl amx_fp16_mm_f32f16f16

amx_fp16_mm_f32f16f16:
    ldtilecfg (%rsi)
    tilezero %tmm0
    tilezero %tmm1
    tilezero %tmm2
    tilezero %tmm3
    tilezero %tmm4
    tilezero %tmm5
.amx.fp16.mm.f32f16f16:
    tdpfp16ps %tmm4, %tmm5, %tmm0
    tdpfp16ps %tmm4, %tmm5, %tmm1
    tdpfp16ps %tmm4, %tmm5, %tmm2
    tdpfp16ps %tmm4, %tmm5, %tmm3
    sub $0x1, %rdi
    jne .amx.fp16.mm.f32f16f16
    ret
