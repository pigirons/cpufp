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
	movgr2fr.w $f17, $r0
	movgr2fr.w $f18, $r0
	movgr2fr.w $f19, $r0
	movgr2fr.w $f20, $r0
	movgr2fr.w $f21, $r0
	movgr2fr.w $f22, $r0
	movgr2fr.w $f23, $r0
	movgr2fr.w $f24, $r0
.fp32.fmadd.f32f32f32:
    fmadd.s $f0, $f24, $f24, $f0
    fmadd.s $f1, $f24, $f24, $f1
    fadd.s  $f2, $f24, $f24
    fadd.s  $f3, $f24, $f24
    fmadd.s $f4, $f24, $f24, $f4
    fmadd.s $f5, $f24, $f24, $f5
    fadd.s  $f6, $f24, $f24
    fadd.s  $f7, $f24, $f24
    fmadd.s $f8, $f24, $f24, $f8
    fmadd.s $f9, $f24, $f24, $f9
    fadd.s  $f10, $f24, $f24
    fadd.s  $f11, $f24, $f24
    fmadd.s $f12, $f24, $f24, $f12
    fmadd.s $f13, $f24, $f24, $f13
    fadd.s  $f14, $f24, $f24
    fadd.s  $f15, $f24, $f24
    fmadd.s $f16, $f24, $f24, $f16
    fmadd.s $f17, $f24, $f24, $f17
    fadd.s  $f18, $f24, $f24
    fadd.s  $f19, $f24, $f24
    fmadd.s $f20, $f24, $f24, $f20
    fmadd.s $f21, $f24, $f24, $f21
    fadd.s  $f22, $f24, $f24
    fadd.s  $f23, $f24, $f24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .fp32.fmadd.f32f32f32
	jr $r1

