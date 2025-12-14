.globl avx_vnni_int16_256b_dp2a_s32s16u16
.globl avx_vnni_int16_256b_dp2a_s32u16s16
.globl avx_vnni_int16_256b_dp2a_s32u16u16
.globl avx_vnni_int16_128b_dp2a_s32s16u16
.globl avx_vnni_int16_128b_dp2a_s32u16s16
.globl avx_vnni_int16_128b_dp2a_s32u16u16

avx_vnni_int16_256b_dp2a_s32s16u16:
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
.avx.vnni.int16.256b.dp2a.s32s16u16.L1:
    vpdpwsud %ymm0, %ymm0, %ymm0
    vpdpwsud %ymm1, %ymm1, %ymm1
    vpdpwsud %ymm2, %ymm2, %ymm2
    vpdpwsud %ymm3, %ymm3, %ymm3
    vpdpwsud %ymm4, %ymm4, %ymm4
    vpdpwsud %ymm5, %ymm5, %ymm5
    vpdpwsud %ymm6, %ymm6, %ymm6
    vpdpwsud %ymm7, %ymm7, %ymm7
    vpdpwsud %ymm8, %ymm8, %ymm8
    vpdpwsud %ymm9, %ymm9, %ymm9
    vpdpwsud %ymm10, %ymm10, %ymm10
    vpdpwsud %ymm11, %ymm11, %ymm11
    vpdpwsud %ymm12, %ymm12, %ymm12
    vpdpwsud %ymm13, %ymm13, %ymm13
    vpdpwsud %ymm14, %ymm14, %ymm14
    vpdpwsud %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.int16.256b.dp2a.s32s16u16.L1
    ret

avx_vnni_int16_256b_dp2a_s32u16s16:
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
.avx.vnni.int16.256b.dp2a.s32u16s16.L1:
    vpdpwusd %ymm0, %ymm0, %ymm0
    vpdpwusd %ymm1, %ymm1, %ymm1
    vpdpwusd %ymm2, %ymm2, %ymm2
    vpdpwusd %ymm3, %ymm3, %ymm3
    vpdpwusd %ymm4, %ymm4, %ymm4
    vpdpwusd %ymm5, %ymm5, %ymm5
    vpdpwusd %ymm6, %ymm6, %ymm6
    vpdpwusd %ymm7, %ymm7, %ymm7
    vpdpwusd %ymm8, %ymm8, %ymm8
    vpdpwusd %ymm9, %ymm9, %ymm9
    vpdpwusd %ymm10, %ymm10, %ymm10
    vpdpwusd %ymm11, %ymm11, %ymm11
    vpdpwusd %ymm12, %ymm12, %ymm12
    vpdpwusd %ymm13, %ymm13, %ymm13
    vpdpwusd %ymm14, %ymm14, %ymm14
    vpdpwusd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.int16.256b.dp2a.s32u16s16.L1
    ret

avx_vnni_int16_256b_dp2a_s32u16u16:
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
.avx.vnni.int16.256b.dp2a.s32u16u16.L1:
    vpdpwuud %ymm0, %ymm0, %ymm0
    vpdpwuud %ymm1, %ymm1, %ymm1
    vpdpwuud %ymm2, %ymm2, %ymm2
    vpdpwuud %ymm3, %ymm3, %ymm3
    vpdpwuud %ymm4, %ymm4, %ymm4
    vpdpwuud %ymm5, %ymm5, %ymm5
    vpdpwuud %ymm6, %ymm6, %ymm6
    vpdpwuud %ymm7, %ymm7, %ymm7
    vpdpwuud %ymm8, %ymm8, %ymm8
    vpdpwuud %ymm9, %ymm9, %ymm9
    vpdpwuud %ymm10, %ymm10, %ymm10
    vpdpwuud %ymm11, %ymm11, %ymm11
    vpdpwuud %ymm12, %ymm12, %ymm12
    vpdpwuud %ymm13, %ymm13, %ymm13
    vpdpwuud %ymm14, %ymm14, %ymm14
    vpdpwuud %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.int16.256b.dp2a.s32u16u16.L1
    ret

avx_vnni_int16_128b_dp2a_s32s16u16:
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
.avx.vnni.int16.128b.dp2a.s32s16u16.L1:
    vpdpwsud %xmm0, %xmm0, %xmm0
    vpdpwsud %xmm1, %xmm1, %xmm1
    vpdpwsud %xmm2, %xmm2, %xmm2
    vpdpwsud %xmm3, %xmm3, %xmm3
    vpdpwsud %xmm4, %xmm4, %xmm4
    vpdpwsud %xmm5, %xmm5, %xmm5
    vpdpwsud %xmm6, %xmm6, %xmm6
    vpdpwsud %xmm7, %xmm7, %xmm7
    vpdpwsud %xmm8, %xmm8, %xmm8
    vpdpwsud %xmm9, %xmm9, %xmm9
    vpdpwsud %xmm10, %xmm10, %xmm10
    vpdpwsud %xmm11, %xmm11, %xmm11
    vpdpwsud %xmm12, %xmm12, %xmm12
    vpdpwsud %xmm13, %xmm13, %xmm13
    vpdpwsud %xmm14, %xmm14, %xmm14
    vpdpwsud %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.int16.128b.dp2a.s32s16u16.L1
    ret

avx_vnni_int16_128b_dp2a_s32u16s16:
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
.avx.vnni.int16.128b.dp2a.s32u16s16.L1:
    vpdpwusd %xmm0, %xmm0, %xmm0
    vpdpwusd %xmm1, %xmm1, %xmm1
    vpdpwusd %xmm2, %xmm2, %xmm2
    vpdpwusd %xmm3, %xmm3, %xmm3
    vpdpwusd %xmm4, %xmm4, %xmm4
    vpdpwusd %xmm5, %xmm5, %xmm5
    vpdpwusd %xmm6, %xmm6, %xmm6
    vpdpwusd %xmm7, %xmm7, %xmm7
    vpdpwusd %xmm8, %xmm8, %xmm8
    vpdpwusd %xmm9, %xmm9, %xmm9
    vpdpwusd %xmm10, %xmm10, %xmm10
    vpdpwusd %xmm11, %xmm11, %xmm11
    vpdpwusd %xmm12, %xmm12, %xmm12
    vpdpwusd %xmm13, %xmm13, %xmm13
    vpdpwusd %xmm14, %xmm14, %xmm14
    vpdpwusd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.int16.128b.dp2a.s32u16s16.L1
    ret

avx_vnni_int16_128b_dp2a_s32u16u16:
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
.avx.vnni.int16.128b.dp2a.s32u16u16.L1:
    vpdpwuud %xmm0, %xmm0, %xmm0
    vpdpwuud %xmm1, %xmm1, %xmm1
    vpdpwuud %xmm2, %xmm2, %xmm2
    vpdpwuud %xmm3, %xmm3, %xmm3
    vpdpwuud %xmm4, %xmm4, %xmm4
    vpdpwuud %xmm5, %xmm5, %xmm5
    vpdpwuud %xmm6, %xmm6, %xmm6
    vpdpwuud %xmm7, %xmm7, %xmm7
    vpdpwuud %xmm8, %xmm8, %xmm8
    vpdpwuud %xmm9, %xmm9, %xmm9
    vpdpwuud %xmm10, %xmm10, %xmm10
    vpdpwuud %xmm11, %xmm11, %xmm11
    vpdpwuud %xmm12, %xmm12, %xmm12
    vpdpwuud %xmm13, %xmm13, %xmm13
    vpdpwuud %xmm14, %xmm14, %xmm14
    vpdpwuud %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.int16.128b.dp2a.s32u16u16.L1
    ret

