.globl fma_f32f32f32
.globl fma_f64f64f64

fma_f32f32f32:
    vxorps %ymm0, %ymm0, %ymm0
    vxorps %ymm1, %ymm1, %ymm1
    vxorps %ymm2, %ymm2, %ymm2
    vxorps %ymm3, %ymm3, %ymm3
    vxorps %ymm4, %ymm4, %ymm4
    vxorps %ymm5, %ymm5, %ymm5
    vxorps %ymm6, %ymm6, %ymm6
    vxorps %ymm7, %ymm7, %ymm7
    vxorps %ymm8, %ymm8, %ymm8
    vxorps %ymm9, %ymm9, %ymm9
    vxorps %ymm10, %ymm10, %ymm10
    vxorps %ymm11, %ymm11, %ymm11
    vxorps %ymm12, %ymm12, %ymm12
    vxorps %ymm13, %ymm13, %ymm13
    vxorps %ymm14, %ymm14, %ymm14
    vxorps %ymm15, %ymm15, %ymm15
.fma.f32f32f32.L1:
    vfmadd231ps %ymm0, %ymm0, %ymm0
    vfmadd231ps %ymm1, %ymm1, %ymm1
    vfmadd231ps %ymm2, %ymm2, %ymm2
    vfmadd231ps %ymm3, %ymm3, %ymm3
    vfmadd231ps %ymm4, %ymm4, %ymm4
    vfmadd231ps %ymm5, %ymm5, %ymm5
    vfmadd231ps %ymm6, %ymm6, %ymm6
    vfmadd231ps %ymm7, %ymm7, %ymm7
    vfmadd231ps %ymm8, %ymm8, %ymm8
    vfmadd231ps %ymm9, %ymm9, %ymm9
    vfmadd231ps %ymm10, %ymm10, %ymm10
    vfmadd231ps %ymm11, %ymm11, %ymm11
    vfmadd231ps %ymm12, %ymm12, %ymm12
    vfmadd231ps %ymm13, %ymm13, %ymm13
    vfmadd231ps %ymm14, %ymm14, %ymm14
    vfmadd231ps %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .fma.f32f32f32.L1
    ret

fma_f64f64f64:
    vxorpd %ymm0, %ymm0, %ymm0
    vxorpd %ymm1, %ymm1, %ymm1
    vxorpd %ymm2, %ymm2, %ymm2
    vxorpd %ymm3, %ymm3, %ymm3
    vxorpd %ymm4, %ymm4, %ymm4
    vxorpd %ymm5, %ymm5, %ymm5
    vxorpd %ymm6, %ymm6, %ymm6
    vxorpd %ymm7, %ymm7, %ymm7
    vxorpd %ymm8, %ymm8, %ymm8
    vxorpd %ymm9, %ymm9, %ymm9
    vxorpd %ymm10, %ymm10, %ymm10
    vxorpd %ymm11, %ymm11, %ymm11
    vxorpd %ymm12, %ymm12, %ymm12
    vxorpd %ymm13, %ymm13, %ymm13
    vxorpd %ymm14, %ymm14, %ymm14
    vxorpd %ymm15, %ymm15, %ymm15
.fma.f64f64f64.L1:
    vfmadd231pd %ymm0, %ymm0, %ymm0
    vfmadd231pd %ymm1, %ymm1, %ymm1
    vfmadd231pd %ymm2, %ymm2, %ymm2
    vfmadd231pd %ymm3, %ymm3, %ymm3
    vfmadd231pd %ymm4, %ymm4, %ymm4
    vfmadd231pd %ymm5, %ymm5, %ymm5
    vfmadd231pd %ymm6, %ymm6, %ymm6
    vfmadd231pd %ymm7, %ymm7, %ymm7
    vfmadd231pd %ymm8, %ymm8, %ymm8
    vfmadd231pd %ymm9, %ymm9, %ymm9
    vfmadd231pd %ymm10, %ymm10, %ymm10
    vfmadd231pd %ymm11, %ymm11, %ymm11
    vfmadd231pd %ymm12, %ymm12, %ymm12
    vfmadd231pd %ymm13, %ymm13, %ymm13
    vfmadd231pd %ymm14, %ymm14, %ymm14
    vfmadd231pd %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .fma.f64f64f64.L1
    ret

