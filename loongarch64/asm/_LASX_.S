.globl lasx_fp32_fmadd_f32f32f32
.globl lasx_fp64_fmadd_f64f64f64
.globl lasx_fp32_add_mul_f32f32_f32
.globl lasx_fp64_add_mul_f64f64_f64

lasx_fp32_fmadd_f32f32f32:
    xvxor.v $xr0, $xr0, $xr0
    xvxor.v $xr1, $xr1, $xr1
    xvxor.v $xr2, $xr2, $xr2
    xvxor.v $xr3, $xr3, $xr3
    xvxor.v $xr4, $xr4, $xr4
    xvxor.v $xr5, $xr5, $xr5
    xvxor.v $xr6, $xr6, $xr6
    xvxor.v $xr7, $xr7, $xr7
    xvxor.v $xr8, $xr8, $xr8
    xvxor.v $xr9, $xr9, $xr9
    xvxor.v $xr10, $xr10, $xr10
    xvxor.v $xr11, $xr11, $xr11
    xvxor.v $xr12, $xr12, $xr12
    xvxor.v $xr13, $xr13, $xr13
    xvxor.v $xr14, $xr14, $xr14
    xvxor.v $xr15, $xr15, $xr15
    xvxor.v $xr16, $xr16, $xr16
.lasx.fp32.fmadd.f32f32f32:
    xvfmadd.s $xr0, $xr16, $xr16, $xr0
    xvfmadd.s $xr1, $xr16, $xr16, $xr1
    xvfmadd.s $xr2, $xr16, $xr16, $xr2
    xvfmadd.s $xr3, $xr16, $xr16, $xr3
    xvfmadd.s $xr4, $xr16, $xr16, $xr4
    xvfmadd.s $xr5, $xr16, $xr16, $xr5
    xvfmadd.s $xr6, $xr16, $xr16, $xr6
    xvfmadd.s $xr7, $xr16, $xr16, $xr7
    xvfmadd.s $xr8, $xr16, $xr16, $xr8
    xvfmadd.s $xr9, $xr16, $xr16, $xr9
    xvfmadd.s $xr10, $xr16, $xr16, $xr10
    xvfmadd.s $xr11, $xr16, $xr16, $xr11
    xvfmadd.s $xr12, $xr16, $xr16, $xr12
    xvfmadd.s $xr13, $xr16, $xr16, $xr13
    xvfmadd.s $xr14, $xr16, $xr16, $xr14
    xvfmadd.s $xr15, $xr16, $xr16, $xr15
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lasx.fp32.fmadd.f32f32f32
	jr $r1

lasx_fp64_fmadd_f64f64f64:
    xvxor.v $xr0, $xr0, $xr0
    xvxor.v $xr1, $xr1, $xr1
    xvxor.v $xr2, $xr2, $xr2
    xvxor.v $xr3, $xr3, $xr3
    xvxor.v $xr4, $xr4, $xr4
    xvxor.v $xr5, $xr5, $xr5
    xvxor.v $xr6, $xr6, $xr6
    xvxor.v $xr7, $xr7, $xr7
    xvxor.v $xr8, $xr8, $xr8
    xvxor.v $xr9, $xr9, $xr9
    xvxor.v $xr10, $xr10, $xr10
    xvxor.v $xr11, $xr11, $xr11
    xvxor.v $xr12, $xr12, $xr12
    xvxor.v $xr13, $xr13, $xr13
    xvxor.v $xr14, $xr14, $xr14
    xvxor.v $xr15, $xr15, $xr15
    xvxor.v $xr16, $xr16, $xr16
.lasx.fp64.fmadd.f64f64f64:
    xvfmadd.d $xr0, $xr16, $xr16, $xr0
    xvfmadd.d $xr1, $xr16, $xr16, $xr1
    xvfmadd.d $xr2, $xr16, $xr16, $xr2
    xvfmadd.d $xr3, $xr16, $xr16, $xr3
    xvfmadd.d $xr4, $xr16, $xr16, $xr4
    xvfmadd.d $xr5, $xr16, $xr16, $xr5
    xvfmadd.d $xr6, $xr16, $xr16, $xr6
    xvfmadd.d $xr7, $xr16, $xr16, $xr7
    xvfmadd.d $xr8, $xr16, $xr16, $xr8
    xvfmadd.d $xr9, $xr16, $xr16, $xr9
    xvfmadd.d $xr10, $xr16, $xr16, $xr10
    xvfmadd.d $xr11, $xr16, $xr16, $xr11
    xvfmadd.d $xr12, $xr16, $xr16, $xr12
    xvfmadd.d $xr13, $xr16, $xr16, $xr13
    xvfmadd.d $xr14, $xr16, $xr16, $xr14
    xvfmadd.d $xr15, $xr16, $xr16, $xr15
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lasx.fp64.fmadd.f64f64f64
	jr $r1

lasx_fp32_add_mul_f32f32_f32:
    xvxor.v $xr0, $xr0, $xr0
    xvxor.v $xr1, $xr1, $xr1
    xvxor.v $xr2, $xr2, $xr2
    xvxor.v $xr3, $xr3, $xr3
    xvxor.v $xr4, $xr4, $xr4
    xvxor.v $xr5, $xr5, $xr5
    xvxor.v $xr6, $xr6, $xr6
    xvxor.v $xr7, $xr7, $xr7
    xvxor.v $xr8, $xr8, $xr8
    xvxor.v $xr9, $xr9, $xr9
    xvxor.v $xr10, $xr10, $xr10
    xvxor.v $xr11, $xr11, $xr11
    xvxor.v $xr12, $xr12, $xr12
    xvxor.v $xr13, $xr13, $xr13
    xvxor.v $xr14, $xr14, $xr14
    xvxor.v $xr15, $xr15, $xr15
    xvxor.v $xr16, $xr16, $xr16
    xvxor.v $xr17, $xr17, $xr17
    xvxor.v $xr18, $xr18, $xr18
    xvxor.v $xr19, $xr19, $xr19
    xvxor.v $xr20, $xr20, $xr20
    xvxor.v $xr21, $xr21, $xr21
    xvxor.v $xr22, $xr22, $xr22
    xvxor.v $xr23, $xr23, $xr23
    xvxor.v $xr24, $xr24, $xr24
.lasx.fp32.add.mul.f32f32.f32:
    xvfmul.s $xr0, $xr24, $xr24
    xvfadd.s $xr1, $xr24, $xr24
    xvfmul.s $xr2, $xr24, $xr24
    xvfadd.s $xr3, $xr24, $xr24
    xvfmul.s $xr4, $xr24, $xr24
    xvfadd.s $xr5, $xr24, $xr24
    xvfmul.s $xr6, $xr24, $xr24
    xvfadd.s $xr7, $xr24, $xr24
    xvfmul.s $xr8, $xr24, $xr24
    xvfadd.s $xr9, $xr24, $xr24
    xvfmul.s $xr10, $xr24, $xr24
    xvfadd.s $xr11, $xr24, $xr24
    xvfmul.s $xr12, $xr24, $xr24
    xvfadd.s $xr13, $xr24, $xr24
    xvfmul.s $xr14, $xr24, $xr24
    xvfadd.s $xr15, $xr24, $xr24
    xvfmul.s $xr16, $xr24, $xr24
    xvfadd.s $xr17, $xr24, $xr24
    xvfmul.s $xr18, $xr24, $xr24
    xvfadd.s $xr19, $xr24, $xr24
    xvfmul.s $xr20, $xr24, $xr24
    xvfadd.s $xr21, $xr24, $xr24
    xvfmul.s $xr22, $xr24, $xr24
    xvfadd.s $xr23, $xr24, $xr24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lasx.fp32.add.mul.f32f32.f32
	jr $r1

lasx_fp64_add_mul_f64f64_f64:
    xvxor.v $xr0, $xr0, $xr0
    xvxor.v $xr1, $xr1, $xr1
    xvxor.v $xr2, $xr2, $xr2
    xvxor.v $xr3, $xr3, $xr3
    xvxor.v $xr4, $xr4, $xr4
    xvxor.v $xr5, $xr5, $xr5
    xvxor.v $xr6, $xr6, $xr6
    xvxor.v $xr7, $xr7, $xr7
    xvxor.v $xr8, $xr8, $xr8
    xvxor.v $xr9, $xr9, $xr9
    xvxor.v $xr10, $xr10, $xr10
    xvxor.v $xr11, $xr11, $xr11
    xvxor.v $xr12, $xr12, $xr12
    xvxor.v $xr13, $xr13, $xr13
    xvxor.v $xr14, $xr14, $xr14
    xvxor.v $xr15, $xr15, $xr15
    xvxor.v $xr16, $xr16, $xr16
    xvxor.v $xr17, $xr17, $xr17
    xvxor.v $xr18, $xr18, $xr18
    xvxor.v $xr19, $xr19, $xr19
    xvxor.v $xr20, $xr20, $xr20
    xvxor.v $xr21, $xr21, $xr21
    xvxor.v $xr22, $xr22, $xr22
    xvxor.v $xr23, $xr23, $xr23
    xvxor.v $xr24, $xr24, $xr24
.lasx.fp64.add.mul.f64f64.f64:
    xvfmul.d $xr0, $xr24, $xr24
    xvfadd.d $xr1, $xr24, $xr24
    xvfmul.d $xr2, $xr24, $xr24
    xvfadd.d $xr3, $xr24, $xr24
    xvfmul.d $xr4, $xr24, $xr24
    xvfadd.d $xr5, $xr24, $xr24
    xvfmul.d $xr6, $xr24, $xr24
    xvfadd.d $xr7, $xr24, $xr24
    xvfmul.d $xr8, $xr24, $xr24
    xvfadd.d $xr9, $xr24, $xr24
    xvfmul.d $xr10, $xr24, $xr24
    xvfadd.d $xr11, $xr24, $xr24
    xvfmul.d $xr12, $xr24, $xr24
    xvfadd.d $xr13, $xr24, $xr24
    xvfmul.d $xr14, $xr24, $xr24
    xvfadd.d $xr15, $xr24, $xr24
    xvfmul.d $xr16, $xr24, $xr24
    xvfadd.d $xr17, $xr24, $xr24
    xvfmul.d $xr18, $xr24, $xr24
    xvfadd.d $xr19, $xr24, $xr24
    xvfmul.d $xr20, $xr24, $xr24
    xvfadd.d $xr21, $xr24, $xr24
    xvfmul.d $xr22, $xr24, $xr24
    xvfadd.d $xr23, $xr24, $xr24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lasx.fp64.add.mul.f64f64.f64
	jr $r1

