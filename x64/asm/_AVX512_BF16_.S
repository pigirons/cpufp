.globl avx512_bf16_dp2a_f32bf16bf16

avx512_bf16_dp2a_f32bf16bf16:
    vpxorq %zmm0, %zmm0, %zmm0
    vpxorq %zmm1, %zmm1, %zmm1
    vpxorq %zmm2, %zmm2, %zmm2
    vpxorq %zmm3, %zmm3, %zmm3
    vpxorq %zmm4, %zmm4, %zmm4
    vpxorq %zmm5, %zmm5, %zmm5
    vpxorq %zmm6, %zmm6, %zmm6
    vpxorq %zmm7, %zmm7, %zmm7
    vpxorq %zmm8, %zmm8, %zmm8
    vpxorq %zmm9, %zmm9, %zmm9
    vpxorq %zmm10, %zmm10, %zmm10
    vpxorq %zmm11, %zmm11, %zmm11
    vpxorq %zmm12, %zmm12, %zmm12
    vpxorq %zmm13, %zmm13, %zmm13
    vpxorq %zmm14, %zmm14, %zmm14
    vpxorq %zmm15, %zmm15, %zmm15
    vpxorq %zmm16, %zmm16, %zmm16
.avx512.bf16.dp2a.fp32bf16bf16.L1:
    vdpbf16ps %zmm16, %zmm16, %zmm0
    vdpbf16ps %zmm16, %zmm16, %zmm1
    vdpbf16ps %zmm16, %zmm16, %zmm2
    vdpbf16ps %zmm16, %zmm16, %zmm3
    vdpbf16ps %zmm16, %zmm16, %zmm4
    vdpbf16ps %zmm16, %zmm16, %zmm5
    vdpbf16ps %zmm16, %zmm16, %zmm6
    vdpbf16ps %zmm16, %zmm16, %zmm7
    vdpbf16ps %zmm16, %zmm16, %zmm8
    vdpbf16ps %zmm16, %zmm16, %zmm9
    vdpbf16ps %zmm16, %zmm16, %zmm10
    vdpbf16ps %zmm16, %zmm16, %zmm11
    vdpbf16ps %zmm16, %zmm16, %zmm12
    vdpbf16ps %zmm16, %zmm16, %zmm13
    vdpbf16ps %zmm16, %zmm16, %zmm14
    vdpbf16ps %zmm16, %zmm16, %zmm15
    sub $0x1, %rdi
    jne .avx512.bf16.dp2a.fp32bf16bf16.L1
    ret

