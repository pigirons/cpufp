.globl lasx_fp32_fmadd_f32f32f32
.globl lasx_fp64_fmadd_f64f64f64

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
    xvfmadd.s $xr2, $xr16, $xr16, $xr1
    xvfmadd.s $xr3, $xr16, $xr16, $xr3
    xvfmadd.s $xr4, $xr16, $xr16, $xr4
    xvfmadd.s $xr5, $xr16, $xr16, $xr5
    xvfmadd.s $xr6, $xr16, $xr16, $xr6
    xvfmadd.s $xr7, $xr16, $xr16, $xr7
    addi.d $a0, $a0, -1
    xvfmadd.s $xr8, $xr16, $xr16, $xr8
    xvfmadd.s $xr9, $xr16, $xr16, $xr9
    xvfmadd.s $xr10, $xr16, $xr16, $xr10
    xvfmadd.s $xr11, $xr16, $xr16, $xr11
    xvfmadd.s $xr12, $xr16, $xr16, $xr12
    xvfmadd.s $xr13, $xr16, $xr16, $xr13
    xvfmadd.s $xr14, $xr16, $xr16, $xr14
    xvfmadd.s $xr15, $xr16, $xr16, $xr15
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
    xvfmadd.d $xr2, $xr16, $xr16, $xr1
    xvfmadd.d $xr3, $xr16, $xr16, $xr3
    xvfmadd.d $xr4, $xr16, $xr16, $xr4
    xvfmadd.d $xr5, $xr16, $xr16, $xr5
    xvfmadd.d $xr6, $xr16, $xr16, $xr6
    xvfmadd.d $xr7, $xr16, $xr16, $xr7
    addi.d $a0, $a0, -1
    xvfmadd.d $xr8, $xr16, $xr16, $xr8
    xvfmadd.d $xr9, $xr16, $xr16, $xr9
    xvfmadd.d $xr10, $xr16, $xr16, $xr10
    xvfmadd.d $xr11, $xr16, $xr16, $xr11
    xvfmadd.d $xr12, $xr16, $xr16, $xr12
    xvfmadd.d $xr13, $xr16, $xr16, $xr13
    xvfmadd.d $xr14, $xr16, $xr16, $xr14
    xvfmadd.d $xr15, $xr16, $xr16, $xr15
    bne $a0, $r0, .lasx.fp64.fmadd.f64f64f64
	jr $r1
