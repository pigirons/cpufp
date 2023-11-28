.globl sse2_add_mul_f64f64_f64

sse2_add_mul_f64f64_f64:
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
.sse2.add.mul.f64f64.f64.L1:
    mulpd %xmm0, %xmm0
    addpd %xmm1, %xmm1
    mulpd %xmm2, %xmm2
    addpd %xmm3, %xmm3
    mulpd %xmm4, %xmm4
    addpd %xmm5, %xmm5
    mulpd %xmm6, %xmm6
    addpd %xmm7, %xmm7
    sub $0x1, %rdi
    mulpd %xmm8, %xmm8
    addpd %xmm9, %xmm9
    mulpd %xmm10, %xmm10
    addpd %xmm11, %xmm11
    mulpd %xmm12, %xmm12
    addpd %xmm13, %xmm13
    mulpd %xmm14, %xmm14
    addpd %xmm15, %xmm15
    jne .sse2.add.mul.f64f64.f64.L1
    ret

