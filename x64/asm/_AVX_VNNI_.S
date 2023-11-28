.globl avx_vnni_dp4a_s32u8s8
.globl avx_vnni_dp2a_s32s16s16

avx_vnni_dp4a_s32u8s8:
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
.avx.vnni.dp4a.s32u8s8.L1:
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
    jne .avx.vnni.dp4a.s32u8s8.L1
    ret

avx_vnni_dp2a_s32s16s16:
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
.avx.vnni.dp2a.s32s16s16.L1:
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
    jne .avx.vnni.dp2a.s32s16s16.L1
    ret

