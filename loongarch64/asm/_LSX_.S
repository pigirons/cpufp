.globl lsx_fp32_fmadd_f32f32f32
.globl lsx_fp64_fmadd_f64f64f64
.globl lsx_fp32_add_mul_f32f32_f32
.globl lsx_fp64_add_mul_f64f64_f64

lsx_fp32_fmadd_f32f32f32:
    vxor.v $vr0, $vr0, $vr0
    vxor.v $vr1, $vr1, $vr1
    vxor.v $vr2, $vr2, $vr2
    vxor.v $vr3, $vr3, $vr3
    vxor.v $vr4, $vr4, $vr4
    vxor.v $vr5, $vr5, $vr5
    vxor.v $vr6, $vr6, $vr6
    vxor.v $vr7, $vr7, $vr7
    vxor.v $vr8, $vr8, $vr8
    vxor.v $vr9, $vr9, $vr9
    vxor.v $vr10, $vr10, $vr10
    vxor.v $vr11, $vr11, $vr11
    vxor.v $vr12, $vr12, $vr12
    vxor.v $vr13, $vr13, $vr13
    vxor.v $vr14, $vr14, $vr14
    vxor.v $vr15, $vr15, $vr15
    vxor.v $vr16, $vr16, $vr16
.lsx.fp32.fmadd.f32f32f32:
    vfmadd.s $vr0, $vr16, $vr16, $vr0
    vfmadd.s $vr1, $vr16, $vr16, $vr1
    vfmadd.s $vr2, $vr16, $vr16, $vr2
    vfmadd.s $vr3, $vr16, $vr16, $vr3
    vfmadd.s $vr4, $vr16, $vr16, $vr4
    vfmadd.s $vr5, $vr16, $vr16, $vr5
    vfmadd.s $vr6, $vr16, $vr16, $vr6
    vfmadd.s $vr7, $vr16, $vr16, $vr7
    vfmadd.s $vr8, $vr16, $vr16, $vr8
    vfmadd.s $vr9, $vr16, $vr16, $vr9
    vfmadd.s $vr10, $vr16, $vr16, $vr10
    vfmadd.s $vr11, $vr16, $vr16, $vr11
    vfmadd.s $vr12, $vr16, $vr16, $vr12
    vfmadd.s $vr13, $vr16, $vr16, $vr13
    vfmadd.s $vr14, $vr16, $vr16, $vr14
    vfmadd.s $vr15, $vr16, $vr16, $vr15
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lsx.fp32.fmadd.f32f32f32
	jr $r1

lsx_fp64_fmadd_f64f64f64:
    vxor.v $vr0, $vr0, $vr0
    vxor.v $vr1, $vr1, $vr1
    vxor.v $vr2, $vr2, $vr2
    vxor.v $vr3, $vr3, $vr3
    vxor.v $vr4, $vr4, $vr4
    vxor.v $vr5, $vr5, $vr5
    vxor.v $vr6, $vr6, $vr6
    vxor.v $vr7, $vr7, $vr7
    vxor.v $vr8, $vr8, $vr8
    vxor.v $vr9, $vr9, $vr9
    vxor.v $vr10, $vr10, $vr10
    vxor.v $vr11, $vr11, $vr11
    vxor.v $vr12, $vr12, $vr12
    vxor.v $vr13, $vr13, $vr13
    vxor.v $vr14, $vr14, $vr14
    vxor.v $vr15, $vr15, $vr15
    vxor.v $vr16, $vr16, $vr16
.lsx.fp64.fmadd.f64f64f64:
    vfmadd.d $vr0, $vr16, $vr16, $vr0
    vfmadd.d $vr1, $vr16, $vr16, $vr1
    vfmadd.d $vr2, $vr16, $vr16, $vr2
    vfmadd.d $vr3, $vr16, $vr16, $vr3
    vfmadd.d $vr4, $vr16, $vr16, $vr4
    vfmadd.d $vr5, $vr16, $vr16, $vr5
    vfmadd.d $vr6, $vr16, $vr16, $vr6
    vfmadd.d $vr7, $vr16, $vr16, $vr7
    vfmadd.d $vr8, $vr16, $vr16, $vr8
    vfmadd.d $vr9, $vr16, $vr16, $vr9
    vfmadd.d $vr10, $vr16, $vr16, $vr10
    vfmadd.d $vr11, $vr16, $vr16, $vr11
    vfmadd.d $vr12, $vr16, $vr16, $vr12
    vfmadd.d $vr13, $vr16, $vr16, $vr13
    vfmadd.d $vr14, $vr16, $vr16, $vr14
    vfmadd.d $vr15, $vr16, $vr16, $vr15
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lsx.fp64.fmadd.f64f64f64
	jr $r1

lsx_fp32_add_mul_f32f32_f32:
    vxor.v $vr0, $vr0, $vr0
    vxor.v $vr1, $vr1, $vr1
    vxor.v $vr2, $vr2, $vr2
    vxor.v $vr3, $vr3, $vr3
    vxor.v $vr4, $vr4, $vr4
    vxor.v $vr5, $vr5, $vr5
    vxor.v $vr6, $vr6, $vr6
    vxor.v $vr7, $vr7, $vr7
    vxor.v $vr8, $vr8, $vr8
    vxor.v $vr9, $vr9, $vr9
    vxor.v $vr10, $vr10, $vr10
    vxor.v $vr11, $vr11, $vr11
    vxor.v $vr12, $vr12, $vr12
    vxor.v $vr13, $vr13, $vr13
    vxor.v $vr14, $vr14, $vr14
    vxor.v $vr15, $vr15, $vr15
    vxor.v $vr16, $vr16, $vr16
    vxor.v $vr17, $vr17, $vr17
    vxor.v $vr18, $vr18, $vr18
    vxor.v $vr19, $vr19, $vr19
    vxor.v $vr20, $vr20, $vr20
    vxor.v $vr21, $vr21, $vr21
    vxor.v $vr22, $vr22, $vr22
    vxor.v $vr23, $vr23, $vr23
    vxor.v $vr24, $vr24, $vr24
.lsx.fp32.add.mul.f32f32.f32:
    vfmul.s $vr0, $vr24, $vr24
    vfadd.s $vr1, $vr24, $vr24
    vfmul.s $vr2, $vr24, $vr24
    vfadd.s $vr3, $vr24, $vr24
    vfmul.s $vr4, $vr24, $vr24
    vfadd.s $vr5, $vr24, $vr24
    vfmul.s $vr6, $vr24, $vr24
    vfadd.s $vr7, $vr24, $vr24
    vfmul.s $vr8, $vr24, $vr24
    vfadd.s $vr9, $vr24, $vr24
    vfmul.s $vr10, $vr24, $vr24
    vfadd.s $vr11, $vr24, $vr24
    vfmul.s $vr12, $vr24, $vr24
    vfadd.s $vr13, $vr24, $vr24
    vfmul.s $vr14, $vr24, $vr24
    vfadd.s $vr15, $vr24, $vr24
    vfmul.s $vr16, $vr24, $vr24
    vfadd.s $vr17, $vr24, $vr24
    vfmul.s $vr18, $vr24, $vr24
    vfadd.s $vr19, $vr24, $vr24
    vfmul.s $vr20, $vr24, $vr24
    vfadd.s $vr21, $vr24, $vr24
    vfmul.s $vr22, $vr24, $vr24
    vfadd.s $vr23, $vr24, $vr24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lsx.fp32.add.mul.f32f32.f32
	jr $r1

lsx_fp64_add_mul_f64f64_f64:
    vxor.v $vr0, $vr0, $vr0
    vxor.v $vr1, $vr1, $vr1
    vxor.v $vr2, $vr2, $vr2
    vxor.v $vr3, $vr3, $vr3
    vxor.v $vr4, $vr4, $vr4
    vxor.v $vr5, $vr5, $vr5
    vxor.v $vr6, $vr6, $vr6
    vxor.v $vr7, $vr7, $vr7
    vxor.v $vr8, $vr8, $vr8
    vxor.v $vr9, $vr9, $vr9
    vxor.v $vr10, $vr10, $vr10
    vxor.v $vr11, $vr11, $vr11
    vxor.v $vr12, $vr12, $vr12
    vxor.v $vr13, $vr13, $vr13
    vxor.v $vr14, $vr14, $vr14
    vxor.v $vr15, $vr15, $vr15
    vxor.v $vr16, $vr16, $vr16
    vxor.v $vr17, $vr17, $vr17
    vxor.v $vr18, $vr18, $vr18
    vxor.v $vr19, $vr19, $vr19
    vxor.v $vr20, $vr20, $vr20
    vxor.v $vr21, $vr21, $vr21
    vxor.v $vr22, $vr22, $vr22
    vxor.v $vr23, $vr23, $vr23
    vxor.v $vr24, $vr24, $vr24
.lsx.fp64.add.mul.f64f64.f64:
    vfmul.d $vr0, $vr24, $vr24
    vfadd.d $vr1, $vr24, $vr24
    vfmul.d $vr2, $vr24, $vr24
    vfadd.d $vr3, $vr24, $vr24
    vfmul.d $vr4, $vr24, $vr24
    vfadd.d $vr5, $vr24, $vr24
    vfmul.d $vr6, $vr24, $vr24
    vfadd.d $vr7, $vr24, $vr24
    vfmul.d $vr8, $vr24, $vr24
    vfadd.d $vr9, $vr24, $vr24
    vfmul.d $vr10, $vr24, $vr24
    vfadd.d $vr11, $vr24, $vr24
    vfmul.d $vr12, $vr24, $vr24
    vfadd.d $vr13, $vr24, $vr24
    vfmul.d $vr14, $vr24, $vr24
    vfadd.d $vr15, $vr24, $vr24
    vfmul.d $vr16, $vr24, $vr24
    vfadd.d $vr17, $vr24, $vr24
    vfmul.d $vr18, $vr24, $vr24
    vfadd.d $vr19, $vr24, $vr24
    vfmul.d $vr20, $vr24, $vr24
    vfadd.d $vr21, $vr24, $vr24
    vfmul.d $vr22, $vr24, $vr24
    vfadd.d $vr23, $vr24, $vr24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lsx.fp64.add.mul.f64f64.f64
	jr $r1

