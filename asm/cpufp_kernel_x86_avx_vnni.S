.globl cpufp_kernel_x86_avx_vnni_int8
.globl cpufp_kernel_x86_avx_vnni_int16

cpufp_kernel_x86_avx_vnni_int8:
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
.cpufp.x86.avx.vnni.int8.L1:
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
    sub $0x1, %rdi
    jne .cpufp.x86.avx.vnni.int8.L1
    ret

cpufp_kernel_x86_avx_vnni_int16:
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
.cpufp.x86.avx.vnni.int16.L1:
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
    sub $0x1, %rdi
    jne .cpufp.x86.avx.vnni.int16.L1
    ret

