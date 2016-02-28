.globl cpufp_x86_fma_fp32
.globl cpufp_x86_fma_fp64

cpufp_x86_fma_fp32:
    mov $0x80000000, %rax
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
.cpufp.x86.fma.fp32.L1:
    vfmadd132ps %ymm0, %ymm0, %ymm0
    vfmadd132ps %ymm1, %ymm1, %ymm1
    vfmadd132ps %ymm2, %ymm2, %ymm2
    vfmadd132ps %ymm3, %ymm3, %ymm3
    vfmadd132ps %ymm4, %ymm4, %ymm4
    vfmadd132ps %ymm5, %ymm5, %ymm5
    vfmadd132ps %ymm6, %ymm6, %ymm6
    vfmadd132ps %ymm7, %ymm7, %ymm7
    vfmadd132ps %ymm8, %ymm8, %ymm8
    vfmadd132ps %ymm9, %ymm9, %ymm9
    sub $0x1, %rax
    jne .cpufp.x86.fma.fp32.L1
    ret

cpufp_x86_fma_fp64:
    mov $0x80000000, %rax
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
.cpufp.x86.fma.fp64.L1:
    vfmadd132pd %ymm0, %ymm0, %ymm0
    vfmadd132pd %ymm1, %ymm1, %ymm1
    vfmadd132pd %ymm2, %ymm2, %ymm2
    vfmadd132pd %ymm3, %ymm3, %ymm3
    vfmadd132pd %ymm4, %ymm4, %ymm4
    vfmadd132pd %ymm5, %ymm5, %ymm5
    vfmadd132pd %ymm6, %ymm6, %ymm6
    vfmadd132pd %ymm7, %ymm7, %ymm7
    vfmadd132pd %ymm8, %ymm8, %ymm8
    vfmadd132pd %ymm9, %ymm9, %ymm9
    sub $0x1, %rax
    jne .cpufp.x86.fma.fp64.L1
    ret

