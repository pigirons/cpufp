.globl avx512f_fma_f32f32f32
.globl avx512f_fma_f64f64f64

avx512f_fma_f32f32f32:
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
.avx512f.fma.f32f32f32.L1:
    vfmadd231ps %zmm0, %zmm0, %zmm0
    vfmadd231ps %zmm1, %zmm1, %zmm1
    vfmadd231ps %zmm2, %zmm2, %zmm2
    vfmadd231ps %zmm3, %zmm3, %zmm3
    vfmadd231ps %zmm4, %zmm4, %zmm4
    vfmadd231ps %zmm5, %zmm5, %zmm5
    vfmadd231ps %zmm6, %zmm6, %zmm6
    vfmadd231ps %zmm7, %zmm7, %zmm7
    vfmadd231ps %zmm8, %zmm8, %zmm8
    vfmadd231ps %zmm9, %zmm9, %zmm9
    vfmadd231ps %zmm10, %zmm10, %zmm10
    vfmadd231ps %zmm11, %zmm11, %zmm11
    vfmadd231ps %zmm12, %zmm12, %zmm12
    vfmadd231ps %zmm13, %zmm13, %zmm13
    vfmadd231ps %zmm14, %zmm14, %zmm14
    vfmadd231ps %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512f.fma.f32f32f32.L1
    ret

avx512f_fma_f64f64f64:
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
.avx512f.fma.f64f64f64.L1:
    vfmadd231pd %zmm0, %zmm0, %zmm0
    vfmadd231pd %zmm1, %zmm1, %zmm1
    vfmadd231pd %zmm2, %zmm2, %zmm2
    vfmadd231pd %zmm3, %zmm3, %zmm3
    vfmadd231pd %zmm4, %zmm4, %zmm4
    vfmadd231pd %zmm5, %zmm5, %zmm5
    vfmadd231pd %zmm6, %zmm6, %zmm6
    vfmadd231pd %zmm7, %zmm7, %zmm7
    vfmadd231pd %zmm8, %zmm8, %zmm8
    vfmadd231pd %zmm9, %zmm9, %zmm9
    vfmadd231pd %zmm10, %zmm10, %zmm10
    vfmadd231pd %zmm11, %zmm11, %zmm11
    vfmadd231pd %zmm12, %zmm12, %zmm12
    vfmadd231pd %zmm13, %zmm13, %zmm13
    vfmadd231pd %zmm14, %zmm14, %zmm14
    vfmadd231pd %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512f.fma.f64f64f64.L1
    ret

