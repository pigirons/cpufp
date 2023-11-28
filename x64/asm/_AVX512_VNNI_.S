.globl avx512_vnni_dp4a_s32u8s8
.globl avx512_vnni_dp2a_s32s16s16

avx512_vnni_dp4a_s32u8s8:
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
.avx512.vnni.dp4a.s32u8s8.L1:
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
    jne .avx512.vnni.dp4a.s32u8s8.L1
    ret

avx512_vnni_dp2a_s32s16s16:
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
.avx512.vnni.dp2a.s32s16s16.L1:
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
    jne .avx512.vnni.dp2a.s32s16s16.L1
    ret

