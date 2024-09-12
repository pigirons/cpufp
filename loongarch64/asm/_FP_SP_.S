.globl fp32_fmadd_f32f32f32
fp32_fmadd_f32f32f32:
	movgr2fr.w $f0, $r0
	movgr2fr.w $f1, $r0
	movgr2fr.w $f2, $r0
	movgr2fr.w $f3, $r0
	movgr2fr.w $f4, $r0
	movgr2fr.w $f5, $r0
	movgr2fr.w $f6, $r0
	movgr2fr.w $f7, $r0
	movgr2fr.w $f8, $r0
	movgr2fr.w $f9, $r0
	movgr2fr.w $f10, $r0
	movgr2fr.w $f11, $r0
	movgr2fr.w $f12, $r0
	movgr2fr.w $f13, $r0
	movgr2fr.w $f14, $r0
	movgr2fr.w $f15, $r0
	movgr2fr.w $f16, $r0
.fp32.fmadd.f32f32f32:
    fmadd.s $f0, $f16, $f16, $f0
    fmadd.s $f1, $f16, $f16, $f1
    fmadd.s $f2, $f16, $f16, $f2
    fmadd.s $f3, $f16, $f16, $f3
    fmadd.s $f4, $f16, $f16, $f4
    fmadd.s $f5, $f16, $f16, $f5
    fmadd.s $f6, $f16, $f16, $f6
    fmadd.s $f7, $f16, $f16, $f7
    fmadd.s $f8, $f16, $f16, $f8
    fmadd.s $f9, $f16, $f16, $f9
    fmadd.s $f10, $f16, $f16, $f10
    fmadd.s $f11, $f16, $f16, $f11
    fmadd.s $f12, $f16, $f16, $f12
    fmadd.s $f13, $f16, $f16, $f13
    fmadd.s $f14, $f16, $f16, $f14
    fmadd.s $f15, $f16, $f16, $f15
    addi.d $a0, $a0, -1
    bne $a0, $r0, .fp32.fmadd.f32f32f32
	jr $r1

