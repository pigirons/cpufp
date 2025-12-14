.globl fma_256b_fma_f32f32f32
.globl fma_256b_fma_f64f64f64
.globl fma_128b_fma_f32f32f32
.globl fma_128b_fma_f64f64f64

fma_256b_fma_f32f32f32:
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
.fma.256b.fma.f32f32f32.L1:
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
    jne .fma.256b.fma.f32f32f32.L1
    ret

fma_256b_fma_f64f64f64:
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
.fma.256b.fma.f64f64f64.L1:
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
    jne .fma.256b.fma.f64f64f64.L1
    ret

fma_128b_fma_f32f32f32:
    xorps %xmm0, %xmm0
    xorps %xmm1, %xmm1
    xorps %xmm2, %xmm2
    xorps %xmm3, %xmm3
    xorps %xmm4, %xmm4
    xorps %xmm5, %xmm5
    xorps %xmm6, %xmm6
    xorps %xmm7, %xmm7
    xorps %xmm8, %xmm8
    xorps %xmm9, %xmm9
    xorps %xmm10, %xmm10
    xorps %xmm11, %xmm11
    xorps %xmm12, %xmm12
    xorps %xmm13, %xmm13
    xorps %xmm14, %xmm14
    xorps %xmm15, %xmm15
.fma.128b.fma.f32f32f32.L1:
    vfmadd231ps %xmm0, %xmm0, %xmm0
    vfmadd231ps %xmm1, %xmm1, %xmm1
    vfmadd231ps %xmm2, %xmm2, %xmm2
    vfmadd231ps %xmm3, %xmm3, %xmm3
    vfmadd231ps %xmm4, %xmm4, %xmm4
    vfmadd231ps %xmm5, %xmm5, %xmm5
    vfmadd231ps %xmm6, %xmm6, %xmm6
    vfmadd231ps %xmm7, %xmm7, %xmm7
    vfmadd231ps %xmm8, %xmm8, %xmm8
    vfmadd231ps %xmm9, %xmm9, %xmm9
    vfmadd231ps %xmm10, %xmm10, %xmm10
    vfmadd231ps %xmm11, %xmm11, %xmm11
    vfmadd231ps %xmm12, %xmm12, %xmm12
    vfmadd231ps %xmm13, %xmm13, %xmm13
    vfmadd231ps %xmm14, %xmm14, %xmm14
    vfmadd231ps %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .fma.128b.fma.f32f32f32.L1
    ret

fma_128b_fma_f64f64f64:
    xorpd %xmm0, %xmm0
    xorpd %xmm1, %xmm1
    xorpd %xmm2, %xmm2
    xorpd %xmm3, %xmm3
    xorpd %xmm4, %xmm4
    xorpd %xmm5, %xmm5
    xorpd %xmm6, %xmm6
    xorpd %xmm7, %xmm7
    xorpd %xmm8, %xmm8
    xorpd %xmm9, %xmm9
    xorpd %xmm10, %xmm10
    xorpd %xmm11, %xmm11
    xorpd %xmm12, %xmm12
    xorpd %xmm13, %xmm13
    xorpd %xmm14, %xmm14
    xorpd %xmm15, %xmm15
.fma.128b.fma.f64f64f64.L1:
    vfmadd231pd %xmm0, %xmm0, %xmm0
    vfmadd231pd %xmm1, %xmm1, %xmm1
    vfmadd231pd %xmm2, %xmm2, %xmm2
    vfmadd231pd %xmm3, %xmm3, %xmm3
    vfmadd231pd %xmm4, %xmm4, %xmm4
    vfmadd231pd %xmm5, %xmm5, %xmm5
    vfmadd231pd %xmm6, %xmm6, %xmm6
    vfmadd231pd %xmm7, %xmm7, %xmm7
    vfmadd231pd %xmm8, %xmm8, %xmm8
    vfmadd231pd %xmm9, %xmm9, %xmm9
    vfmadd231pd %xmm10, %xmm10, %xmm10
    vfmadd231pd %xmm11, %xmm11, %xmm11
    vfmadd231pd %xmm12, %xmm12, %xmm12
    vfmadd231pd %xmm13, %xmm13, %xmm13
    vfmadd231pd %xmm14, %xmm14, %xmm14
    vfmadd231pd %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .fma.128b.fma.f64f64f64.L1
    ret

