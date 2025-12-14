.globl avx512f_512b_fma_f32f32f32
.globl avx512f_512b_fma_f64f64f64
.globl avx512f_512b_add_mul_f32f32_f32
.globl avx512f_512b_add_mul_f64f64_f64

avx512f_512b_fma_f32f32f32:
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
.avx512f.512b.fma.f32f32f32.L1:
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
    jne .avx512f.512b.fma.f32f32f32.L1
    ret

avx512f_512b_fma_f64f64f64:
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
.avx512f.512b.fma.f64f64f64.L1:
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
    jne .avx512f.512b.fma.f64f64f64.L1
    ret

avx512f_512b_add_mul_f32f32_f32:
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
.avx512f.512b.add.mul.f32f32.f32.L1:
    vmulps %zmm0, %zmm0, %zmm0
    vaddps %zmm1, %zmm1, %zmm1
    vmulps %zmm2, %zmm2, %zmm2
    vaddps %zmm3, %zmm3, %zmm3
    vmulps %zmm4, %zmm4, %zmm4
    vaddps %zmm5, %zmm5, %zmm5
    vmulps %zmm6, %zmm6, %zmm6
    vaddps %zmm7, %zmm7, %zmm7
    vmulps %zmm8, %zmm8, %zmm8
    vaddps %zmm9, %zmm9, %zmm9
    vmulps %zmm10, %zmm10, %zmm10
    vaddps %zmm11, %zmm11, %zmm11
    vmulps %zmm12, %zmm12, %zmm12
    vaddps %zmm13, %zmm13, %zmm13
    vmulps %zmm14, %zmm14, %zmm14
    vaddps %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512f.512b.add.mul.f32f32.f32.L1
    ret

avx512f_512b_add_mul_f64f64_f64:
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
.avx512f.512b.add.mul.f64f64.f64.L1:
    vmulpd %zmm0, %zmm0, %zmm0
    vaddpd %zmm1, %zmm1, %zmm1
    vmulpd %zmm2, %zmm2, %zmm2
    vaddpd %zmm3, %zmm3, %zmm3
    vmulpd %zmm4, %zmm4, %zmm4
    vaddpd %zmm5, %zmm5, %zmm5
    vmulpd %zmm6, %zmm6, %zmm6
    vaddpd %zmm7, %zmm7, %zmm7
    vmulpd %zmm8, %zmm8, %zmm8
    vaddpd %zmm9, %zmm9, %zmm9
    vmulpd %zmm10, %zmm10, %zmm10
    vaddpd %zmm11, %zmm11, %zmm11
    vmulpd %zmm12, %zmm12, %zmm12
    vaddpd %zmm13, %zmm13, %zmm13
    vmulpd %zmm14, %zmm14, %zmm14
    vaddpd %zmm15, %zmm15, %zmm15
    sub $0x1, %rdi
    jne .avx512f.512b.add.mul.f64f64.f64.L1
    ret

