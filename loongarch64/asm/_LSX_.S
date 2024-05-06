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
    vxor.v $vr17, $vr17, $vr17
    vxor.v $vr18, $vr18, $vr18
    vxor.v $vr19, $vr19, $vr19
    vxor.v $vr20, $vr20, $vr20
    vxor.v $vr21, $vr21, $vr21
    vxor.v $vr22, $vr22, $vr22
    vxor.v $vr23, $vr23, $vr23
    vxor.v $vr24, $vr24, $vr24
.lsx.fp32.fmadd.f32f32f32:
    vfmadd.s $vr0, $vr24, $vr24, $vr0
    vfmadd.s $vr1, $vr24, $vr24, $vr1
    vfadd.s  $vr2, $vr24, $vr24
    vfadd.s  $vr3, $vr24, $vr24
    vfmadd.s $vr4, $vr24, $vr24, $vr4
    vfmadd.s $vr5, $vr24, $vr24, $vr5
    vfadd.s  $vr6, $vr24, $vr24
    vfadd.s  $vr7, $vr24, $vr24
    vfmadd.s $vr8, $vr24, $vr24, $vr8
    vfmadd.s $vr9, $vr24, $vr24, $vr9
    vfadd.s  $vr10, $vr24, $vr24
    vfadd.s  $vr11, $vr24, $vr24
    vfmadd.s $vr12, $vr24, $vr24, $vr12
    vfmadd.s $vr13, $vr24, $vr24, $vr13
    vfadd.s  $vr14, $vr24, $vr24
    vfadd.s  $vr15, $vr24, $vr24
    vfmadd.s $vr16, $vr24, $vr24, $vr16
    vfmadd.s $vr17, $vr24, $vr24, $vr17
    vfadd.s  $vr18, $vr24, $vr24
    vfadd.s  $vr19, $vr24, $vr24
    vfmadd.s $vr20, $vr24, $vr24, $vr20
    vfmadd.s $vr21, $vr24, $vr24, $vr21
    vfadd.s  $vr22, $vr24, $vr24
    vfadd.s  $vr23, $vr24, $vr24
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
    vxor.v $vr17, $vr17, $vr17
    vxor.v $vr18, $vr18, $vr18
    vxor.v $vr19, $vr19, $vr19
    vxor.v $vr20, $vr20, $vr20
    vxor.v $vr21, $vr21, $vr21
    vxor.v $vr22, $vr22, $vr22
    vxor.v $vr23, $vr23, $vr23
    vxor.v $vr24, $vr24, $vr24
.lsx.fp64.fmadd.f64f64f64:
    vfmadd.d $vr0, $vr24, $vr24, $vr0
    vfmadd.d $vr1, $vr24, $vr24, $vr1
    vfadd.d  $vr2, $vr24, $vr24
    vfadd.d  $vr3, $vr24, $vr24
    vfmadd.d $vr4, $vr24, $vr24, $vr4
    vfmadd.d $vr5, $vr24, $vr24, $vr5
    vfadd.d  $vr6, $vr24, $vr24
    vfadd.d  $vr7, $vr24, $vr24
    vfmadd.d $vr8, $vr24, $vr24, $vr8
    vfmadd.d $vr9, $vr24, $vr24, $vr9
    vfadd.d  $vr10, $vr24, $vr24
    vfadd.d  $vr11, $vr24, $vr24
    vfmadd.d $vr12, $vr24, $vr24, $vr12
    vfmadd.d $vr13, $vr24, $vr24, $vr13
    vfadd.d  $vr14, $vr24, $vr24
    vfadd.d  $vr15, $vr24, $vr24
    vfmadd.d $vr16, $vr24, $vr24, $vr16
    vfmadd.d $vr17, $vr24, $vr24, $vr17
    vfadd.d  $vr18, $vr24, $vr24
    vfadd.d  $vr19, $vr24, $vr24
    vfmadd.d $vr20, $vr24, $vr24, $vr20
    vfmadd.d $vr21, $vr24, $vr24, $vr21
    vfadd.d  $vr22, $vr24, $vr24
    vfadd.d  $vr23, $vr24, $vr24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .lsx.fp64.fmadd.f64f64f64
	jr $r1

