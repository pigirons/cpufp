.align 4

.macro preserve_caller_vec
	stp d8, d9, [sp, #-16]!
	stp d10, d11, [sp, #-16]!
	stp d12, d13, [sp, #-16]!
	stp d14, d15, [sp, #-16]!
.endm

.macro restore_caller_vec
	ldp d14, d15, [sp], #16
	ldp d12, d13, [sp], #16
	ldp d10, d11, [sp], #16
	ldp d8, d9, [sp], #16
.endm

#ifdef __APPLE_
.globl _asimd_fmla_vs_f32f32f32
_asimd_fmla_vs_f32f32f32:
#else
.globl asimd_fmla_vs_f32f32f32
asimd_fmla_vs_f32f32f32:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
    eor v4.16b, v4.16b, v4.16b
    eor v5.16b, v5.16b, v5.16b
    eor v6.16b, v6.16b, v6.16b
    eor v7.16b, v7.16b, v7.16b
    eor v8.16b, v8.16b, v8.16b
    eor v9.16b, v9.16b, v9.16b
    eor v10.16b, v10.16b, v10.16b
    eor v11.16b, v11.16b, v11.16b
    eor v12.16b, v12.16b, v12.16b
    eor v13.16b, v13.16b, v13.16b
    eor v14.16b, v14.16b, v14.16b
    eor v15.16b, v15.16b, v15.16b
    eor v16.16b, v16.16b, v16.16b
    eor v17.16b, v17.16b, v17.16b
    eor v18.16b, v18.16b, v18.16b
    eor v19.16b, v19.16b, v19.16b
.asimd.fmla.vs.f32f32f32.L1:
    fmla v4.4s, v0.4s, v1.s[0]
    fmla v5.4s, v0.4s, v1.s[0]
    fmla v6.4s, v0.4s, v1.s[0]
    fmla v7.4s, v0.4s, v1.s[0]
    fmla v8.4s, v0.4s, v1.s[0]
    fmla v9.4s, v0.4s, v1.s[0]
    fmla v10.4s, v0.4s, v1.s[0]
    fmla v11.4s, v0.4s, v1.s[0]
    subs x0, x0, #1
    fmla v12.4s, v0.4s, v1.s[0]
    fmla v13.4s, v0.4s, v1.s[0]
    fmla v14.4s, v0.4s, v1.s[0]
    fmla v15.4s, v0.4s, v1.s[0]
    fmla v16.4s, v0.4s, v1.s[0]
    fmla v17.4s, v0.4s, v1.s[0]
    fmla v18.4s, v0.4s, v1.s[0]
    fmla v19.4s, v0.4s, v1.s[0]
    bne .asimd.fmla.vs.f32f32f32.L1
    restore_caller_vec
    ret

#ifdef __APPLE_
.globl _asimd_fmla_vv_f32f32f32
_asimd_fmla_vv_f32f32f32:
#else
.globl asimd_fmla_vv_f32f32f32
asimd_fmla_vv_f32f32f32:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
    eor v4.16b, v4.16b, v4.16b
    eor v5.16b, v5.16b, v5.16b
    eor v6.16b, v6.16b, v6.16b
    eor v7.16b, v7.16b, v7.16b
    eor v8.16b, v8.16b, v8.16b
    eor v9.16b, v9.16b, v9.16b
    eor v10.16b, v10.16b, v10.16b
    eor v11.16b, v11.16b, v11.16b
    eor v12.16b, v12.16b, v12.16b
    eor v13.16b, v13.16b, v13.16b
    eor v14.16b, v14.16b, v14.16b
    eor v15.16b, v15.16b, v15.16b
    eor v16.16b, v16.16b, v16.16b
    eor v17.16b, v17.16b, v17.16b
    eor v18.16b, v18.16b, v18.16b
    eor v19.16b, v19.16b, v19.16b
.asimd.fmla.vv.f32f32f32.L1:
    fmla v4.4s, v0.4s, v1.4s
    fmla v5.4s, v0.4s, v1.4s
    fmla v6.4s, v0.4s, v1.4s
    fmla v7.4s, v0.4s, v1.4s
    fmla v8.4s, v0.4s, v1.4s
    fmla v9.4s, v0.4s, v1.4s
    fmla v10.4s, v0.4s, v1.4s
    fmla v11.4s, v0.4s, v1.4s
    subs x0, x0, #1
    fmla v12.4s, v0.4s, v1.4s
    fmla v13.4s, v0.4s, v1.4s
    fmla v14.4s, v0.4s, v1.4s
    fmla v15.4s, v0.4s, v1.4s
    fmla v16.4s, v0.4s, v1.4s
    fmla v17.4s, v0.4s, v1.4s
    fmla v18.4s, v0.4s, v1.4s
    fmla v19.4s, v0.4s, v1.4s
    bne .asimd.fmla.vv.f32f32f32.L1
    restore_caller_vec
    ret

#ifdef __APPLE_
.globl _asimd_fmla_vs_f64f64f64
_asimd_fmla_vs_f64f64f64:
#else
.globl asimd_fmla_vs_f64f64f64
asimd_fmla_vs_f64f64f64:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
    eor v4.16b, v4.16b, v4.16b
    eor v5.16b, v5.16b, v5.16b
    eor v6.16b, v6.16b, v6.16b
    eor v7.16b, v7.16b, v7.16b
    eor v8.16b, v8.16b, v8.16b
    eor v9.16b, v9.16b, v9.16b
    eor v10.16b, v10.16b, v10.16b
    eor v11.16b, v11.16b, v11.16b
    eor v12.16b, v12.16b, v12.16b
    eor v13.16b, v13.16b, v13.16b
    eor v14.16b, v14.16b, v14.16b
    eor v15.16b, v15.16b, v15.16b
    eor v16.16b, v16.16b, v16.16b
    eor v17.16b, v17.16b, v17.16b
    eor v18.16b, v18.16b, v18.16b
    eor v19.16b, v19.16b, v19.16b
.asimd.fmla.vs.f64f64f64.L1:
    fmla v4.2d, v0.2d, v1.d[0]
    fmla v5.2d, v0.2d, v1.d[0]
    fmla v6.2d, v0.2d, v1.d[0]
    fmla v7.2d, v0.2d, v1.d[0]
    fmla v8.2d, v0.2d, v1.d[0]
    fmla v9.2d, v0.2d, v1.d[0]
    fmla v10.2d, v0.2d, v1.d[0]
    fmla v11.2d, v0.2d, v1.d[0]
    subs x0, x0, #1
    fmla v12.2d, v0.2d, v1.d[0]
    fmla v13.2d, v0.2d, v1.d[0]
    fmla v14.2d, v0.2d, v1.d[0]
    fmla v15.2d, v0.2d, v1.d[0]
    fmla v16.2d, v0.2d, v1.d[0]
    fmla v17.2d, v0.2d, v1.d[0]
    fmla v18.2d, v0.2d, v1.d[0]
    fmla v19.2d, v0.2d, v1.d[0]
    bne .asimd.fmla.vs.f64f64f64.L1
    restore_caller_vec
    ret

#ifdef __APPLE_
.globl _asimd_fmla_vv_f64f64f64
_asimd_fmla_vv_f64f64f64:
#else
.globl asimd_fmla_vv_f64f64f64
asimd_fmla_vv_f64f64f64:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
    eor v4.16b, v4.16b, v4.16b
    eor v5.16b, v5.16b, v5.16b
    eor v6.16b, v6.16b, v6.16b
    eor v7.16b, v7.16b, v7.16b
    eor v8.16b, v8.16b, v8.16b
    eor v9.16b, v9.16b, v9.16b
    eor v10.16b, v10.16b, v10.16b
    eor v11.16b, v11.16b, v11.16b
    eor v12.16b, v12.16b, v12.16b
    eor v13.16b, v13.16b, v13.16b
    eor v14.16b, v14.16b, v14.16b
    eor v15.16b, v15.16b, v15.16b
    eor v16.16b, v16.16b, v16.16b
    eor v17.16b, v17.16b, v17.16b
    eor v18.16b, v18.16b, v18.16b
    eor v19.16b, v19.16b, v19.16b
.asimd.fmla.vv.f64f64f64.L1:
    fmla v4.2d, v0.2d, v1.2d
    fmla v5.2d, v0.2d, v1.2d
    fmla v6.2d, v0.2d, v1.2d
    fmla v7.2d, v0.2d, v1.2d
    fmla v8.2d, v0.2d, v1.2d
    fmla v9.2d, v0.2d, v1.2d
    fmla v10.2d, v0.2d, v1.2d
    fmla v11.2d, v0.2d, v1.2d
    subs x0, x0, #1
    fmla v12.2d, v0.2d, v1.2d
    fmla v13.2d, v0.2d, v1.2d
    fmla v14.2d, v0.2d, v1.2d
    fmla v15.2d, v0.2d, v1.2d
    fmla v16.2d, v0.2d, v1.2d
    fmla v17.2d, v0.2d, v1.2d
    fmla v18.2d, v0.2d, v1.2d
    fmla v19.2d, v0.2d, v1.2d
    bne .asimd.fmla.vv.f64f64f64.L1
    restore_caller_vec
    ret

