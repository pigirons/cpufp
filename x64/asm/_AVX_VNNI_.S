.globl avx_vnni_256b_dp4a_s32u8s8
.globl avx_vnni_256b_dp2a_s32s16s16
.globl avx_vnni_128b_dp4a_s32u8s8
.globl avx_vnni_128b_dp2a_s32s16s16

avx_vnni_256b_dp4a_s32u8s8:
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
.avx.vnni.256b.dp4a.s32u8s8.L1:
    {vex} vpdpbusd %ymm0, %ymm0, %ymm0
    {vex} vpdpbusd %ymm1, %ymm1, %ymm1
    {vex} vpdpbusd %ymm2, %ymm2, %ymm2
    {vex} vpdpbusd %ymm3, %ymm3, %ymm3
    {vex} vpdpbusd %ymm4, %ymm4, %ymm4
    {vex} vpdpbusd %ymm5, %ymm5, %ymm5
    {vex} vpdpbusd %ymm6, %ymm6, %ymm6
    {vex} vpdpbusd %ymm7, %ymm7, %ymm7
    {vex} vpdpbusd %ymm8, %ymm8, %ymm8
    {vex} vpdpbusd %ymm9, %ymm9, %ymm9
    {vex} vpdpbusd %ymm10, %ymm10, %ymm10
    {vex} vpdpbusd %ymm11, %ymm11, %ymm11
    {vex} vpdpbusd %ymm12, %ymm12, %ymm12
    {vex} vpdpbusd %ymm13, %ymm13, %ymm13
    {vex} vpdpbusd %ymm14, %ymm14, %ymm14
    {vex} vpdpbusd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.256b.dp4a.s32u8s8.L1
    ret

avx_vnni_256b_dp2a_s32s16s16:
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
.avx.vnni.256b.dp2a.s32s16s16.L1:
    {vex} vpdpwssd %ymm0, %ymm0, %ymm0
    {vex} vpdpwssd %ymm1, %ymm1, %ymm1
    {vex} vpdpwssd %ymm2, %ymm2, %ymm2
    {vex} vpdpwssd %ymm3, %ymm3, %ymm3
    {vex} vpdpwssd %ymm4, %ymm4, %ymm4
    {vex} vpdpwssd %ymm5, %ymm5, %ymm5
    {vex} vpdpwssd %ymm6, %ymm6, %ymm6
    {vex} vpdpwssd %ymm7, %ymm7, %ymm7
    {vex} vpdpwssd %ymm8, %ymm8, %ymm8
    {vex} vpdpwssd %ymm9, %ymm9, %ymm9
    {vex} vpdpwssd %ymm10, %ymm10, %ymm10
    {vex} vpdpwssd %ymm11, %ymm11, %ymm11
    {vex} vpdpwssd %ymm12, %ymm12, %ymm12
    {vex} vpdpwssd %ymm13, %ymm13, %ymm13
    {vex} vpdpwssd %ymm14, %ymm14, %ymm14
    {vex} vpdpwssd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx.vnni.256b.dp2a.s32s16s16.L1
    ret

avx_vnni_128b_dp4a_s32u8s8:
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
.avx.vnni.128b.dp4a.s32u8s8.L1:
    {vex} vpdpbusd %xmm0, %xmm0, %xmm0
    {vex} vpdpbusd %xmm1, %xmm1, %xmm1
    {vex} vpdpbusd %xmm2, %xmm2, %xmm2
    {vex} vpdpbusd %xmm3, %xmm3, %xmm3
    {vex} vpdpbusd %xmm4, %xmm4, %xmm4
    {vex} vpdpbusd %xmm5, %xmm5, %xmm5
    {vex} vpdpbusd %xmm6, %xmm6, %xmm6
    {vex} vpdpbusd %xmm7, %xmm7, %xmm7
    {vex} vpdpbusd %xmm8, %xmm8, %xmm8
    {vex} vpdpbusd %xmm9, %xmm9, %xmm9
    {vex} vpdpbusd %xmm10, %xmm10, %xmm10
    {vex} vpdpbusd %xmm11, %xmm11, %xmm11
    {vex} vpdpbusd %xmm12, %xmm12, %xmm12
    {vex} vpdpbusd %xmm13, %xmm13, %xmm13
    {vex} vpdpbusd %xmm14, %xmm14, %xmm14
    {vex} vpdpbusd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.128b.dp4a.s32u8s8.L1
    ret

avx_vnni_128b_dp2a_s32s16s16:
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
.avx.vnni.128b.dp2a.s32s16s16.L1:
    {vex} vpdpwssd %xmm0, %xmm0, %xmm0
    {vex} vpdpwssd %xmm1, %xmm1, %xmm1
    {vex} vpdpwssd %xmm2, %xmm2, %xmm2
    {vex} vpdpwssd %xmm3, %xmm3, %xmm3
    {vex} vpdpwssd %xmm4, %xmm4, %xmm4
    {vex} vpdpwssd %xmm5, %xmm5, %xmm5
    {vex} vpdpwssd %xmm6, %xmm6, %xmm6
    {vex} vpdpwssd %xmm7, %xmm7, %xmm7
    {vex} vpdpwssd %xmm8, %xmm8, %xmm8
    {vex} vpdpwssd %xmm9, %xmm9, %xmm9
    {vex} vpdpwssd %xmm10, %xmm10, %xmm10
    {vex} vpdpwssd %xmm11, %xmm11, %xmm11
    {vex} vpdpwssd %xmm12, %xmm12, %xmm12
    {vex} vpdpwssd %xmm13, %xmm13, %xmm13
    {vex} vpdpwssd %xmm14, %xmm14, %xmm14
    {vex} vpdpwssd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx.vnni.128b.dp2a.s32s16s16.L1
    ret

