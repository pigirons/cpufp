.globl avx512_vnni_512b_dp4a_s32u8s8
.globl avx512_vnni_512b_dp2a_s32s16s16
.globl avx512_vnni_256b_dp4a_s32u8s8
.globl avx512_vnni_256b_dp2a_s32s16s16
.globl avx512_vnni_128b_dp4a_s32u8s8
.globl avx512_vnni_128b_dp2a_s32s16s16

avx512_vnni_512b_dp4a_s32u8s8:
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
.avx512.vnni.512b.dp4a.s32u8s8.L1:
    vpdpbusd %zmm0, %zmm0, %zmm0
    vpdpbusd %zmm1, %zmm1, %zmm1
    vpdpbusd %zmm2, %zmm2, %zmm2
    vpdpbusd %zmm3, %zmm3, %zmm3
    vpdpbusd %zmm4, %zmm4, %zmm4
    vpdpbusd %zmm5, %zmm5, %zmm5
    vpdpbusd %zmm6, %zmm6, %zmm6
    vpdpbusd %zmm7, %zmm7, %zmm7
    vpdpbusd %zmm8, %zmm8, %zmm8
    vpdpbusd %zmm9, %zmm9, %zmm9
    vpdpbusd %zmm10, %zmm10, %zmm10
    vpdpbusd %zmm11, %zmm11, %zmm11
    vpdpbusd %zmm12, %zmm12, %zmm12
    vpdpbusd %zmm13, %zmm13, %zmm13
    vpdpbusd %zmm14, %zmm14, %zmm14
    vpdpbusd %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512.vnni.512b.dp4a.s32u8s8.L1
    ret

avx512_vnni_512b_dp2a_s32s16s16:
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
.avx512.vnni.512b.dp2a.s32s16s16.L1:
    vpdpwssd %zmm0, %zmm0, %zmm0
    vpdpwssd %zmm1, %zmm1, %zmm1
    vpdpwssd %zmm2, %zmm2, %zmm2
    vpdpwssd %zmm3, %zmm3, %zmm3
    vpdpwssd %zmm4, %zmm4, %zmm4
    vpdpwssd %zmm5, %zmm5, %zmm5
    vpdpwssd %zmm6, %zmm6, %zmm6
    vpdpwssd %zmm7, %zmm7, %zmm7
    vpdpwssd %zmm8, %zmm8, %zmm8
    vpdpwssd %zmm9, %zmm9, %zmm9
    vpdpwssd %zmm10, %zmm10, %zmm10
    vpdpwssd %zmm11, %zmm11, %zmm11
    vpdpwssd %zmm12, %zmm12, %zmm12
    vpdpwssd %zmm13, %zmm13, %zmm13
    vpdpwssd %zmm14, %zmm14, %zmm14
    vpdpwssd %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512.vnni.512b.dp2a.s32s16s16.L1
    ret

avx512_vnni_256b_dp4a_s32u8s8:
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
.avx512.vnni.256b.dp4a.s32u8s8.L1:
    vpdpbusd %ymm0, %ymm0, %ymm0
    vpdpbusd %ymm1, %ymm1, %ymm1
    vpdpbusd %ymm2, %ymm2, %ymm2
    vpdpbusd %ymm3, %ymm3, %ymm3
    vpdpbusd %ymm4, %ymm4, %ymm4
    vpdpbusd %ymm5, %ymm5, %ymm5
    vpdpbusd %ymm6, %ymm6, %ymm6
    vpdpbusd %ymm7, %ymm7, %ymm7
    vpdpbusd %ymm8, %ymm8, %ymm8
    vpdpbusd %ymm9, %ymm9, %ymm9
    vpdpbusd %ymm10, %ymm10, %ymm10
    vpdpbusd %ymm11, %ymm11, %ymm11
    vpdpbusd %ymm12, %ymm12, %ymm12
    vpdpbusd %ymm13, %ymm13, %ymm13
    vpdpbusd %ymm14, %ymm14, %ymm14
    vpdpbusd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx512.vnni.256b.dp4a.s32u8s8.L1
    ret

avx512_vnni_256b_dp2a_s32s16s16:
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
.avx512.vnni.256b.dp2a.s32s16s16.L1:
    vpdpwssd %ymm0, %ymm0, %ymm0
    vpdpwssd %ymm1, %ymm1, %ymm1
    vpdpwssd %ymm2, %ymm2, %ymm2
    vpdpwssd %ymm3, %ymm3, %ymm3
    vpdpwssd %ymm4, %ymm4, %ymm4
    vpdpwssd %ymm5, %ymm5, %ymm5
    vpdpwssd %ymm6, %ymm6, %ymm6
    vpdpwssd %ymm7, %ymm7, %ymm7
    vpdpwssd %ymm8, %ymm8, %ymm8
    vpdpwssd %ymm9, %ymm9, %ymm9
    vpdpwssd %ymm10, %ymm10, %ymm10
    vpdpwssd %ymm11, %ymm11, %ymm11
    vpdpwssd %ymm12, %ymm12, %ymm12
    vpdpwssd %ymm13, %ymm13, %ymm13
    vpdpwssd %ymm14, %ymm14, %ymm14
    vpdpwssd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx512.vnni.256b.dp2a.s32s16s16.L1
    ret

avx512_vnni_128b_dp4a_s32u8s8:
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
.avx512.vnni.128b.dp4a.s32u8s8.L1:
    vpdpbusd %xmm0, %xmm0, %xmm0
    vpdpbusd %xmm1, %xmm1, %xmm1
    vpdpbusd %xmm2, %xmm2, %xmm2
    vpdpbusd %xmm3, %xmm3, %xmm3
    vpdpbusd %xmm4, %xmm4, %xmm4
    vpdpbusd %xmm5, %xmm5, %xmm5
    vpdpbusd %xmm6, %xmm6, %xmm6
    vpdpbusd %xmm7, %xmm7, %xmm7
    vpdpbusd %xmm8, %xmm8, %xmm8
    vpdpbusd %xmm9, %xmm9, %xmm9
    vpdpbusd %xmm10, %xmm10, %xmm10
    vpdpbusd %xmm11, %xmm11, %xmm11
    vpdpbusd %xmm12, %xmm12, %xmm12
    vpdpbusd %xmm13, %xmm13, %xmm13
    vpdpbusd %xmm14, %xmm14, %xmm14
    vpdpbusd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx512.vnni.128b.dp4a.s32u8s8.L1
    ret

avx512_vnni_128b_dp2a_s32s16s16:
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
.avx512.vnni.128b.dp2a.s32s16s16.L1:
    vpdpwssd %xmm0, %xmm0, %xmm0
    vpdpwssd %xmm1, %xmm1, %xmm1
    vpdpwssd %xmm2, %xmm2, %xmm2
    vpdpwssd %xmm3, %xmm3, %xmm3
    vpdpwssd %xmm4, %xmm4, %xmm4
    vpdpwssd %xmm5, %xmm5, %xmm5
    vpdpwssd %xmm6, %xmm6, %xmm6
    vpdpwssd %xmm7, %xmm7, %xmm7
    vpdpwssd %xmm8, %xmm8, %xmm8
    vpdpwssd %xmm9, %xmm9, %xmm9
    vpdpwssd %xmm10, %xmm10, %xmm10
    vpdpwssd %xmm11, %xmm11, %xmm11
    vpdpwssd %xmm12, %xmm12, %xmm12
    vpdpwssd %xmm13, %xmm13, %xmm13
    vpdpwssd %xmm14, %xmm14, %xmm14
    vpdpwssd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx512.vnni.128b.dp2a.s32s16s16.L1
    ret

