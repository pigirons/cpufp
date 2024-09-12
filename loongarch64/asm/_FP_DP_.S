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
.fp64.fmadd.f64f64f64:
    fmadd.d $f0, $f16, $f16, $f0
    fmadd.d $f1, $f16, $f16, $f1
    fmadd.d $f2, $f16, $f16, $f2
    fmadd.d $f3, $f16, $f16, $f3
    fmadd.d $f4, $f16, $f16, $f4
    fmadd.d $f5, $f16, $f16, $f5
    fmadd.d $f6, $f16, $f16, $f6
    fmadd.d $f7, $f16, $f16, $f7
    fmadd.d $f8, $f16, $f16, $f8
    fmadd.d $f9, $f16, $f16, $f9
    fmadd.d $f10, $f16, $f16, $f10
    fmadd.d $f11, $f16, $f16, $f11
    fmadd.d $f12, $f16, $f16, $f12
    fmadd.d $f13, $f16, $f16, $f13
    fmadd.d $f14, $f16, $f16, $f14
    fmadd.d $f15, $f16, $f16, $f15
    addi.d $a0, $a0, -1
    bne $a0, $r0, .fp64.fmadd.f64f64f64
	jr $r1

