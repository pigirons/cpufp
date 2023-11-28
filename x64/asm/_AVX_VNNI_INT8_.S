.globl avx_vnni_int8_dp4a_s32s8s8
.globl avx_vnni_int8_dp4a_s32s8u8
.globl avx_vnni_int8_dp4a_s32u8u8

avx_vnni_int8_dp4a_s32s8s8:
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
.avx.vnni.int8.dp4a.s32s8s8.L1:
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
    jne .avx.vnni.int8.dp4a.s32s8s8.L1
    ret

avx_vnni_int8_dp4a_s32s8u8:
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
.avx.vnni.int8.dp4a.s32s8u8.L1:
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
    jne .avx.vnni.int8.dp4a.s32s8u8.L1
    ret

avx_vnni_int8_dp4a_s32u8u8:
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
.avx.vnni.int8.dp4a.s32u8u8.L1:
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
    jne .avx.vnni.int8.dp4a.s32u8u8.L1
    ret

