.globl avx_vnni_int8_256b_dp4a_s32s8s8
.globl avx_vnni_int8_256b_dp4a_s32s8u8
.globl avx_vnni_int8_256b_dp4a_s32u8u8
.globl avx_vnni_int8_128b_dp4a_s32s8s8
.globl avx_vnni_int8_128b_dp4a_s32s8u8
.globl avx_vnni_int8_128b_dp4a_s32u8u8

avx_vnni_int8_256b_dp4a_s32s8s8:
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
.avx.vnni.int8.256b.dp4a.s32s8s8.L1:
    vpdpbssd %ymm0, %ymm0, %ymm0
    vpdpbssd %ymm1, %ymm1, %ymm1
    vpdpbssd %ymm2, %ymm2, %ymm2
    vpdpbssd %ymm3, %ymm3, %ymm3
    vpdpbssd %ymm4, %ymm4, %ymm4
    vpdpbssd %ymm5, %ymm5, %ymm5
    vpdpbssd %ymm6, %ymm6, %ymm6
    vpdpbssd %ymm7, %ymm7, %ymm7
    vpdpbssd %ymm8, %ymm8, %ymm8
    vpdpbssd %ymm9, %ymm9, %ymm9
    vpdpbssd %ymm10, %ymm10, %ymm10
    vpdpbssd %ymm11, %ymm11, %ymm11
    vpdpbssd %ymm12, %ymm12, %ymm12
    vpdpbssd %ymm13, %ymm13, %ymm13
    vpdpbssd %ymm14, %ymm14, %ymm14
    vpdpbssd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.int8.256b.dp4a.s32s8s8.L1
    ret

avx_vnni_int8_256b_dp4a_s32s8u8:
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
.avx.vnni.int8.256b.dp4a.s32s8u8.L1:
    vpdpbsud %ymm0, %ymm0, %ymm0
    vpdpbsud %ymm1, %ymm1, %ymm1
    vpdpbsud %ymm2, %ymm2, %ymm2
    vpdpbsud %ymm3, %ymm3, %ymm3
    vpdpbsud %ymm4, %ymm4, %ymm4
    vpdpbsud %ymm5, %ymm5, %ymm5
    vpdpbsud %ymm6, %ymm6, %ymm6
    vpdpbsud %ymm7, %ymm7, %ymm7
    vpdpbsud %ymm8, %ymm8, %ymm8
    vpdpbsud %ymm9, %ymm9, %ymm9
    vpdpbsud %ymm10, %ymm10, %ymm10
    vpdpbsud %ymm11, %ymm11, %ymm11
    vpdpbsud %ymm12, %ymm12, %ymm12
    vpdpbsud %ymm13, %ymm13, %ymm13
    vpdpbsud %ymm14, %ymm14, %ymm14
    vpdpbsud %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.int8.256b.dp4a.s32s8u8.L1
    ret

avx_vnni_int8_256b_dp4a_s32u8u8:
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
.avx.vnni.int8.256b.dp4a.s32u8u8.L1:
    vpdpbuud %ymm0, %ymm0, %ymm0
    vpdpbuud %ymm1, %ymm1, %ymm1
    vpdpbuud %ymm2, %ymm2, %ymm2
    vpdpbuud %ymm3, %ymm3, %ymm3
    vpdpbuud %ymm4, %ymm4, %ymm4
    vpdpbuud %ymm5, %ymm5, %ymm5
    vpdpbuud %ymm6, %ymm6, %ymm6
    vpdpbuud %ymm7, %ymm7, %ymm7
    vpdpbuud %ymm8, %ymm8, %ymm8
    vpdpbuud %ymm9, %ymm9, %ymm9
    vpdpbuud %ymm10, %ymm10, %ymm10
    vpdpbuud %ymm11, %ymm11, %ymm11
    vpdpbuud %ymm12, %ymm12, %ymm12
    vpdpbuud %ymm13, %ymm13, %ymm13
    vpdpbuud %ymm14, %ymm14, %ymm14
    vpdpbuud %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.int8.256b.dp4a.s32u8u8.L1
    ret

avx_vnni_int8_128b_dp4a_s32s8s8:
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
.avx.vnni.int8.128b.dp4a.s32s8s8.L1:
    vpdpbssd %xmm0, %xmm0, %xmm0
    vpdpbssd %xmm1, %xmm1, %xmm1
    vpdpbssd %xmm2, %xmm2, %xmm2
    vpdpbssd %xmm3, %xmm3, %xmm3
    vpdpbssd %xmm4, %xmm4, %xmm4
    vpdpbssd %xmm5, %xmm5, %xmm5
    vpdpbssd %xmm6, %xmm6, %xmm6
    vpdpbssd %xmm7, %xmm7, %xmm7
    vpdpbssd %xmm8, %xmm8, %xmm8
    vpdpbssd %xmm9, %xmm9, %xmm9
    vpdpbssd %xmm10, %xmm10, %xmm10
    vpdpbssd %xmm11, %xmm11, %xmm11
    vpdpbssd %xmm12, %xmm12, %xmm12
    vpdpbssd %xmm13, %xmm13, %xmm13
    vpdpbssd %xmm14, %xmm14, %xmm14
    vpdpbssd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.int8.128b.dp4a.s32s8s8.L1
    ret

avx_vnni_int8_128b_dp4a_s32s8u8:
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
.avx.vnni.int8.128b.dp4a.s32s8u8.L1:
    vpdpbsud %xmm0, %xmm0, %xmm0
    vpdpbsud %xmm1, %xmm1, %xmm1
    vpdpbsud %xmm2, %xmm2, %xmm2
    vpdpbsud %xmm3, %xmm3, %xmm3
    vpdpbsud %xmm4, %xmm4, %xmm4
    vpdpbsud %xmm5, %xmm5, %xmm5
    vpdpbsud %xmm6, %xmm6, %xmm6
    vpdpbsud %xmm7, %xmm7, %xmm7
    vpdpbsud %xmm8, %xmm8, %xmm8
    vpdpbsud %xmm9, %xmm9, %xmm9
    vpdpbsud %xmm10, %xmm10, %xmm10
    vpdpbsud %xmm11, %xmm11, %xmm11
    vpdpbsud %xmm12, %xmm12, %xmm12
    vpdpbsud %xmm13, %xmm13, %xmm13
    vpdpbsud %xmm14, %xmm14, %xmm14
    vpdpbsud %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.int8.128b.dp4a.s32s8u8.L1
    ret

avx_vnni_int8_128b_dp4a_s32u8u8:
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
.avx.vnni.int8.128b.dp4a.s32u8u8.L1:
    vpdpbuud %xmm0, %xmm0, %xmm0
    vpdpbuud %xmm1, %xmm1, %xmm1
    vpdpbuud %xmm2, %xmm2, %xmm2
    vpdpbuud %xmm3, %xmm3, %xmm3
    vpdpbuud %xmm4, %xmm4, %xmm4
    vpdpbuud %xmm5, %xmm5, %xmm5
    vpdpbuud %xmm6, %xmm6, %xmm6
    vpdpbuud %xmm7, %xmm7, %xmm7
    vpdpbuud %xmm8, %xmm8, %xmm8
    vpdpbuud %xmm9, %xmm9, %xmm9
    vpdpbuud %xmm10, %xmm10, %xmm10
    vpdpbuud %xmm11, %xmm11, %xmm11
    vpdpbuud %xmm12, %xmm12, %xmm12
    vpdpbuud %xmm13, %xmm13, %xmm13
    vpdpbuud %xmm14, %xmm14, %xmm14
    vpdpbuud %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.int8.128b.dp4a.s32u8u8.L1
    ret

