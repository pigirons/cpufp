.globl avx512_fp16_fma_f16f16f16

avx512_fp16_fma_f16f16f16:
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
.avx512.fp16.fma.f16f16f16.L1:
    vfmadd231ph %zmm0, %zmm0, %zmm0
    vfmadd231ph %zmm1, %zmm1, %zmm1
    vfmadd231ph %zmm2, %zmm2, %zmm2
    vfmadd231ph %zmm3, %zmm3, %zmm3
    vfmadd231ph %zmm4, %zmm4, %zmm4
    vfmadd231ph %zmm5, %zmm5, %zmm5
    vfmadd231ph %zmm6, %zmm6, %zmm6
    vfmadd231ph %zmm7, %zmm7, %zmm7
    vfmadd231ph %zmm8, %zmm8, %zmm8
    vfmadd231ph %zmm9, %zmm9, %zmm9
    vfmadd231ph %zmm10, %zmm10, %zmm10
    vfmadd231ph %zmm11, %zmm11, %zmm11
    vfmadd231ph %zmm12, %zmm12, %zmm12
    vfmadd231ph %zmm13, %zmm13, %zmm13
    vfmadd231ph %zmm14, %zmm14, %zmm14
    vfmadd231ph %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512.fp16.fma.f16f16f16.L1
    ret

