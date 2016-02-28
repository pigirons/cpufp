.globl cpufp_x86_avx_fp32
.globl cpufp_x86_avx_fp64

cpufp_x86_avx_fp32:
    mov $0x200000000, %rax
    vxorps %ymm1, %ymm1, %ymm1
    vxorps %ymm2, %ymm2, %ymm2
    vxorps %ymm3, %ymm3, %ymm3
    vxorps %ymm4, %ymm4, %ymm4
.cpufp.x86.avx.fp32.L1:
    vmulps %ymm2, %ymm2, %ymm1
    vaddps %ymm4, %ymm4, %ymm3
    sub $0x1, %rax
    jne .cpufp.x86.avx.fp32.L1
    ret

cpufp_x86_avx_fp64:
    mov $0x200000000, %rax
    vxorpd %ymm1, %ymm1, %ymm1
    vxorpd %ymm2, %ymm2, %ymm2
    vxorpd %ymm3, %ymm3, %ymm3
    vxorpd %ymm4, %ymm4, %ymm4
.cpufp.x86.avx.fp64.L1:
    vmulpd %ymm2, %ymm2, %ymm1
    vaddpd %ymm4, %ymm4, %ymm3
    sub $0x1, %rax
    jne .cpufp.x86.avx.fp64.L1
    ret

