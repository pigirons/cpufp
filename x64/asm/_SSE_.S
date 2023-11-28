.globl sse_add_mul_f32f32_f32

sse_add_mul_f32f32_f32:
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
.sse.add.mul.f32f32_f32.L1:
    mulps %xmm0, %xmm0
    addps %xmm1, %xmm1
    mulps %xmm2, %xmm2
    addps %xmm3, %xmm3
    mulps %xmm4, %xmm4
    addps %xmm5, %xmm5
    mulps %xmm6, %xmm6
    addps %xmm7, %xmm7
    sub $0x1, %rdi
    mulps %xmm8, %xmm8
    addps %xmm9, %xmm9
    mulps %xmm10, %xmm10
    addps %xmm11, %xmm11
    mulps %xmm12, %xmm12
    addps %xmm13, %xmm13
    mulps %xmm14, %xmm14
    addps %xmm15, %xmm15
    jne .sse.add.mul.f32f32_f32.L1
    ret

