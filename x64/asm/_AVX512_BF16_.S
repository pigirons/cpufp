.globl avx512_bf16_512b_dp2a_f32bf16bf16
.globl avx512_bf16_256b_dp2a_f32bf16bf16
.globl avx512_bf16_128b_dp2a_f32bf16bf16

avx512_bf16_512b_dp2a_f32bf16bf16:
    vpxord %zmm0, %zmm0, %zmm0
    vpxord %zmm1, %zmm1, %zmm1
    vpxord %zmm2, %zmm2, %zmm2
    vpxord %zmm3, %zmm3, %zmm3
    vpxord %zmm4, %zmm4, %zmm4
    vpxord %zmm5, %zmm5, %zmm5
    vpxord %zmm6, %zmm6, %zmm6
    vpxord %zmm7, %zmm7, %zmm7
    vpxord %zmm8, %zmm8, %zmm8
    vpxord %zmm9, %zmm9, %zmm9
    vpxord %zmm10, %zmm10, %zmm10
    vpxord %zmm11, %zmm11, %zmm11
    vpxord %zmm12, %zmm12, %zmm12
    vpxord %zmm13, %zmm13, %zmm13
    vpxord %zmm14, %zmm14, %zmm14
    vpxord %zmm15, %zmm15, %zmm15
    vpxord %zmm16, %zmm16, %zmm16
.avx512.bf16.512b.dp2a.fp32bf16bf16.L1:
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
    jne .avx512.bf16.512b.dp2a.fp32bf16bf16.L1
    ret

avx512_bf16_256b_dp2a_f32bf16bf16:
    vpxor %ymm0, %ymm0, %ymm0
    vpxor %ymm1, %ymm1, %ymm1
    vpxor %ymm2, %ymm2, %ymm2
    vpxor %ymm3, %ymm3, %ymm3
    vpxor %ymm4, %ymm4, %ymm4
    vpxor %ymm5, %ymm5, %ymm5
    vpxor %ymm6, %ymm6, %ymm6
    vpxor %ymm7, %ymm7, %ymm7
    vpxor %ymm8, %ymm8, %ymm8
    vpxor %ymm9, %ymm9, %ymm9
    vpxor %ymm10, %ymm10, %ymm10
    vpxor %ymm11, %ymm11, %ymm11
    vpxor %ymm12, %ymm12, %ymm12
    vpxor %ymm13, %ymm13, %ymm13
    vpxor %ymm14, %ymm14, %ymm14
    vpxor %ymm15, %ymm15, %ymm15
    vpxor %ymm16, %ymm16, %ymm16
.avx512.bf16.256b.dp2a.fp32bf16bf16.L1:
    vdpbf16ps %ymm16, %ymm16, %ymm0
    vdpbf16ps %ymm16, %ymm16, %ymm1
    vdpbf16ps %ymm16, %ymm16, %ymm2
    vdpbf16ps %ymm16, %ymm16, %ymm3
    vdpbf16ps %ymm16, %ymm16, %ymm4
    vdpbf16ps %ymm16, %ymm16, %ymm5
    vdpbf16ps %ymm16, %ymm16, %ymm6
    vdpbf16ps %ymm16, %ymm16, %ymm7
    vdpbf16ps %ymm16, %ymm16, %ymm8
    vdpbf16ps %ymm16, %ymm16, %ymm9
    vdpbf16ps %ymm16, %ymm16, %ymm10
    vdpbf16ps %ymm16, %ymm16, %ymm11
    vdpbf16ps %ymm16, %ymm16, %ymm12
    vdpbf16ps %ymm16, %ymm16, %ymm13
    vdpbf16ps %ymm16, %ymm16, %ymm14
    vdpbf16ps %ymm16, %ymm16, %ymm15
    sub $0x1, %rdi
    jne .avx512.bf16.256b.dp2a.fp32bf16bf16.L1
    ret

avx512_bf16_128b_dp2a_f32bf16bf16:
    pxor %xmm0, %xmm0
    pxor %xmm1, %xmm1
    pxor %xmm2, %xmm2
    pxor %xmm3, %xmm3
    pxor %xmm4, %xmm4
    pxor %xmm5, %xmm5
    pxor %xmm6, %xmm6
    pxor %xmm7, %xmm7
    pxor %xmm8, %xmm8
    pxor %xmm9, %xmm9
    pxor %xmm10, %xmm10
    pxor %xmm11, %xmm11
    pxor %xmm12, %xmm12
    pxor %xmm13, %xmm13
    pxor %xmm14, %xmm14
    pxor %xmm15, %xmm15
    pxor %xmm16, %xmm16
.avx512.bf16.128b.dp2a.fp32bf16bf16.L1:
    vdpbf16ps %xmm16, %xmm16, %xmm0
    vdpbf16ps %xmm16, %xmm16, %xmm1
    vdpbf16ps %xmm16, %xmm16, %xmm2
    vdpbf16ps %xmm16, %xmm16, %xmm3
    vdpbf16ps %xmm16, %xmm16, %xmm4
    vdpbf16ps %xmm16, %xmm16, %xmm5
    vdpbf16ps %xmm16, %xmm16, %xmm6
    vdpbf16ps %xmm16, %xmm16, %xmm7
    vdpbf16ps %xmm16, %xmm16, %xmm8
    vdpbf16ps %xmm16, %xmm16, %xmm9
    vdpbf16ps %xmm16, %xmm16, %xmm10
    vdpbf16ps %xmm16, %xmm16, %xmm11
    vdpbf16ps %xmm16, %xmm16, %xmm12
    vdpbf16ps %xmm16, %xmm16, %xmm13
    vdpbf16ps %xmm16, %xmm16, %xmm14
    vdpbf16ps %xmm16, %xmm16, %xmm15
    sub $0x1, %rdi
    jne .avx512.bf16.128b.dp2a.fp32bf16bf16.L1
    ret

