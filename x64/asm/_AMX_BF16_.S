.globl amx_bf16_mm_f32bf16bf16

amx_bf16_mm_f32bf16bf16:
    ldtilecfg (%rsi)
    tilezero %tmm0
    tilezero %tmm1
    tilezero %tmm2
    tilezero %tmm3
    tilezero %tmm4
    tilezero %tmm5
.amx.bf16.mm.f32bf16bf16:
    tdpbf16ps %tmm4, %tmm5, %tmm0
    tdpbf16ps %tmm4, %tmm5, %tmm1
    tdpbf16ps %tmm4, %tmm5, %tmm2
    tdpbf16ps %tmm4, %tmm5, %tmm3
    sub $0x1, %rdi
    jne .amx.bf16.mm.f32bf16bf16
    ret

