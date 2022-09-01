.globl cpufp_kernel_x86_avx512_vnni_int8
.globl cpufp_kernel_x86_avx512_vnni_int16

cpufp_kernel_x86_avx512_vnni_int8:
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
.cpufp.x86.avx512.vnni.int8.L1:
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
    sub $0x1, %rdi
    jne .cpufp.x86.avx512.vnni.int8.L1
    ret

cpufp_kernel_x86_avx512_vnni_int16:
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
.cpufp.x86.avx512.vnni.int16.L1:
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
    sub $0x1, %rdi
    jne .cpufp.x86.avx512.vnni.int16.L1
    ret

