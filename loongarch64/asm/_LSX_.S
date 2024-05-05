.globl lsx_fp32_fmadd_f32f32f32
.globl lsx_fp64_fmadd_f64f64f64

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
    addi.d $a0, $a0, -1
    vfmadd.s $vr8, $vr16, $vr16, $vr8
    vfmadd.s $vr9, $vr16, $vr16, $vr9
    vfmadd.s $vr10, $vr16, $vr16, $vr10
    vfmadd.s $vr11, $vr16, $vr16, $vr11
    vfmadd.s $vr12, $vr16, $vr16, $vr12
    vfmadd.s $vr13, $vr16, $vr16, $vr13
    vfmadd.s $vr14, $vr16, $vr16, $vr14
    vfmadd.s $vr15, $vr16, $vr16, $vr15
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
    addi.d $a0, $a0, -1
    vfmadd.d $vr8, $vr16, $vr16, $vr8
    vfmadd.d $vr9, $vr16, $vr16, $vr9
    vfmadd.d $vr10, $vr16, $vr16, $vr10
    vfmadd.d $vr11, $vr16, $vr16, $vr11
    vfmadd.d $vr12, $vr16, $vr16, $vr12
    vfmadd.d $vr13, $vr16, $vr16, $vr13
    vfmadd.d $vr14, $vr16, $vr16, $vr14
    vfmadd.d $vr15, $vr16, $vr16, $vr15
    bne $a0, $r0, .lsx.fp64.fmadd.f64f64f64
	jr $r1

