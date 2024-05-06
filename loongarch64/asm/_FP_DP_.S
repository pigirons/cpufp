.globl fp64_fmadd_f64f64f64
fp64_fmadd_f64f64f64:
	movgr2fr.d $f0, $r0
	movgr2fr.d $f1, $r0
	movgr2fr.d $f2, $r0
	movgr2fr.d $f3, $r0
	movgr2fr.d $f4, $r0
	movgr2fr.d $f5, $r0
	movgr2fr.d $f6, $r0
	movgr2fr.d $f7, $r0
	movgr2fr.d $f8, $r0
	movgr2fr.d $f9, $r0
	movgr2fr.d $f10, $r0
	movgr2fr.d $f11, $r0
	movgr2fr.d $f12, $r0
	movgr2fr.d $f13, $r0
	movgr2fr.d $f14, $r0
	movgr2fr.d $f15, $r0
	movgr2fr.d $f16, $r0
	movgr2fr.d $f17, $r0
	movgr2fr.d $f18, $r0
	movgr2fr.d $f19, $r0
	movgr2fr.d $f20, $r0
	movgr2fr.d $f21, $r0
	movgr2fr.d $f22, $r0
	movgr2fr.d $f23, $r0
	movgr2fr.d $f24, $r0
.fp64.fmadd.f64f64f64:
    fmadd.d $f0, $f24, $f24, $f0
    fmadd.d $f1, $f24, $f24, $f1
    fadd.d  $f2, $f24, $f24
    fadd.d  $f3, $f24, $f24
    fmadd.d $f4, $f24, $f24, $f4
    fmadd.d $f5, $f24, $f24, $f5
    fadd.d  $f6, $f24, $f24
    fadd.d  $f7, $f24, $f24
    fmadd.d $f8, $f24, $f24, $f8
    fmadd.d $f9, $f24, $f24, $f9
    fadd.d  $f10, $f24, $f24
    fadd.d  $f11, $f24, $f24
    fmadd.d $f12, $f24, $f24, $f12
    fmadd.d $f13, $f24, $f24, $f13
    fadd.d  $f14, $f24, $f24
    fadd.d  $f15, $f24, $f24
    fmadd.d $f16, $f24, $f24, $f16
    fmadd.d $f17, $f24, $f24, $f17
    fadd.d  $f18, $f24, $f24
    fadd.d  $f19, $f24, $f24
    fmadd.d $f20, $f24, $f24, $f20
    fmadd.d $f21, $f24, $f24, $f21
    fadd.d  $f22, $f24, $f24
    fadd.d  $f23, $f24, $f24
    addi.d $a0, $a0, -1
    bne $a0, $r0, .fp64.fmadd.f64f64f64
	jr $r1

