.globl avx512_fp16_512b_fma_f16f16f16
.globl avx512_fp16_256b_fma_f16f16f16
.globl avx512_fp16_128b_fma_f16f16f16

avx512_fp16_512b_fma_f16f16f16:
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
.avx512.fp16.512b.fma.f16f16f16.L1:
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
    jne .avx512.fp16.512b.fma.f16f16f16.L1
    ret

avx512_fp16_256b_fma_f16f16f16:
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
.avx512.fp16.256b.fma.f16f16f16.L1:
    vfmadd231ph %ymm0, %ymm0, %ymm0
    vfmadd231ph %ymm1, %ymm1, %ymm1
    vfmadd231ph %ymm2, %ymm2, %ymm2
    vfmadd231ph %ymm3, %ymm3, %ymm3
    vfmadd231ph %ymm4, %ymm4, %ymm4
    vfmadd231ph %ymm5, %ymm5, %ymm5
    vfmadd231ph %ymm6, %ymm6, %ymm6
    vfmadd231ph %ymm7, %ymm7, %ymm7
    vfmadd231ph %ymm8, %ymm8, %ymm8
    vfmadd231ph %ymm9, %ymm9, %ymm9
    vfmadd231ph %ymm10, %ymm10, %ymm10
    vfmadd231ph %ymm11, %ymm11, %ymm11
    vfmadd231ph %ymm12, %ymm12, %ymm12
    vfmadd231ph %ymm13, %ymm13, %ymm13
    vfmadd231ph %ymm14, %ymm14, %ymm14
    vfmadd231ph %ymm15, %ymm15, %ymm15
    sub $0x1, %rdi
    jne .avx512.fp16.256b.fma.f16f16f16.L1
    ret

avx512_fp16_128b_fma_f16f16f16:
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
.avx512.fp16.128b.fma.f16f16f16.L1:
    vfmadd231ph %xmm0, %xmm0, %xmm0
    vfmadd231ph %xmm1, %xmm1, %xmm1
    vfmadd231ph %xmm2, %xmm2, %xmm2
    vfmadd231ph %xmm3, %xmm3, %xmm3
    vfmadd231ph %xmm4, %xmm4, %xmm4
    vfmadd231ph %xmm5, %xmm5, %xmm5
    vfmadd231ph %xmm6, %xmm6, %xmm6
    vfmadd231ph %xmm7, %xmm7, %xmm7
    vfmadd231ph %xmm8, %xmm8, %xmm8
    vfmadd231ph %xmm9, %xmm9, %xmm9
    vfmadd231ph %xmm10, %xmm10, %xmm10
    vfmadd231ph %xmm11, %xmm11, %xmm11
    vfmadd231ph %xmm12, %xmm12, %xmm12
    vfmadd231ph %xmm13, %xmm13, %xmm13
    vfmadd231ph %xmm14, %xmm14, %xmm14
    vfmadd231ph %xmm15, %xmm15, %xmm15
    sub $0x1, %rdi
    jne .avx512.fp16.128b.fma.f16f16f16.L1
    ret

