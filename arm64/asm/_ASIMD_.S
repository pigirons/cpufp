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

#ifdef __APPLE__
.globl _asimd_fmla_vs_f32f32f32
_asimd_fmla_vs_f32f32f32:
#else
.globl asimd_fmla_vs_f32f32f32
asimd_fmla_vs_f32f32f32:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
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
    eor v20.16b, v20.16b, v20.16b
    eor v21.16b, v21.16b, v21.16b
    eor v22.16b, v22.16b, v22.16b
    eor v23.16b, v23.16b, v23.16b
    eor v24.16b, v24.16b, v24.16b
    eor v25.16b, v25.16b, v25.16b
    eor v26.16b, v26.16b, v26.16b
    eor v27.16b, v27.16b, v27.16b
    eor v28.16b, v28.16b, v28.16b
    eor v29.16b, v29.16b, v29.16b
    eor v30.16b, v30.16b, v30.16b
    eor v31.16b, v31.16b, v31.16b
.asimd.fmla.vs.f32f32f32.L1:
    fmla v8.4s, v8.4s, v8.s[0]
    fmla v9.4s, v9.4s, v9.s[0]
    fmla v10.4s, v10.4s, v10.s[0]
    fmla v11.4s, v11.4s, v11.s[0]
    fmla v12.4s, v12.4s, v12.s[0]
    fmla v13.4s, v13.4s, v13.s[0]
    fmla v14.4s, v14.4s, v14.s[0]
    fmla v15.4s, v15.4s, v15.s[0]
    fmla v16.4s, v16.4s, v16.s[0]
    fmla v17.4s, v17.4s, v17.s[0]
    fmla v18.4s, v18.4s, v18.s[0]
    fmla v19.4s, v19.4s, v19.s[0]
    subs x0, x0, #1
    fmla v20.4s, v20.4s, v20.s[0]
    fmla v21.4s, v21.4s, v21.s[0]
    fmla v22.4s, v22.4s, v22.s[0]
    fmla v23.4s, v23.4s, v23.s[0]
    fmla v24.4s, v24.4s, v24.s[0]
    fmla v25.4s, v25.4s, v25.s[0]
    fmla v26.4s, v26.4s, v26.s[0]
    fmla v27.4s, v27.4s, v27.s[0]
    fmla v28.4s, v28.4s, v28.s[0]
    fmla v29.4s, v29.4s, v29.s[0]
    fmla v30.4s, v30.4s, v30.s[0]
    fmla v31.4s, v31.4s, v31.s[0]
    bne .asimd.fmla.vs.f32f32f32.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_fmla_vv_f32f32f32
_asimd_fmla_vv_f32f32f32:
#else
.globl asimd_fmla_vv_f32f32f32
asimd_fmla_vv_f32f32f32:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
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
    eor v20.16b, v20.16b, v20.16b
    eor v21.16b, v21.16b, v21.16b
    eor v22.16b, v22.16b, v22.16b
    eor v23.16b, v23.16b, v23.16b
    eor v24.16b, v24.16b, v24.16b
    eor v25.16b, v25.16b, v25.16b
    eor v26.16b, v26.16b, v26.16b
    eor v27.16b, v27.16b, v27.16b
    eor v28.16b, v28.16b, v28.16b
    eor v29.16b, v29.16b, v29.16b
    eor v30.16b, v30.16b, v30.16b
    eor v31.16b, v31.16b, v31.16b
.asimd.fmla.vv.f32f32f32.L1:
    fmla v8.4s, v8.4s, v8.4s
    fmla v9.4s, v9.4s, v9.4s
    fmla v10.4s, v10.4s, v10.4s
    fmla v11.4s, v11.4s, v11.4s
    fmla v12.4s, v12.4s, v12.4s
    fmla v13.4s, v13.4s, v13.4s
    fmla v14.4s, v14.4s, v14.4s
    fmla v15.4s, v15.4s, v15.4s
    fmla v16.4s, v16.4s, v16.4s
    fmla v17.4s, v17.4s, v17.4s
    fmla v18.4s, v18.4s, v18.4s
    fmla v19.4s, v19.4s, v19.4s
    subs x0, x0, #1
    fmla v20.4s, v20.4s, v20.4s
    fmla v21.4s, v21.4s, v21.4s
    fmla v22.4s, v22.4s, v22.4s
    fmla v23.4s, v23.4s, v23.4s
    fmla v24.4s, v24.4s, v24.4s
    fmla v25.4s, v25.4s, v25.4s
    fmla v26.4s, v26.4s, v26.4s
    fmla v27.4s, v27.4s, v27.4s
    fmla v28.4s, v28.4s, v28.4s
    fmla v29.4s, v29.4s, v29.4s
    fmla v30.4s, v30.4s, v30.4s
    fmla v31.4s, v31.4s, v31.4s
    bne .asimd.fmla.vv.f32f32f32.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_fmla_vs_f64f64f64
_asimd_fmla_vs_f64f64f64:
#else
.globl asimd_fmla_vs_f64f64f64
asimd_fmla_vs_f64f64f64:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
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
    eor v20.16b, v20.16b, v20.16b
    eor v21.16b, v21.16b, v21.16b
    eor v22.16b, v22.16b, v22.16b
    eor v23.16b, v23.16b, v23.16b
    eor v24.16b, v24.16b, v24.16b
    eor v25.16b, v25.16b, v25.16b
    eor v26.16b, v26.16b, v26.16b
    eor v27.16b, v27.16b, v27.16b
    eor v28.16b, v28.16b, v28.16b
    eor v29.16b, v29.16b, v29.16b
    eor v30.16b, v30.16b, v30.16b
    eor v31.16b, v31.16b, v31.16b
.asimd.fmla.vs.f64f64f64.L1:
    fmla v8.2d, v8.2d, v8.d[0]
    fmla v9.2d, v9.2d, v9.d[0]
    fmla v10.2d, v10.2d, v10.d[0]
    fmla v11.2d, v11.2d, v11.d[0]
    fmla v12.2d, v12.2d, v12.d[0]
    fmla v13.2d, v13.2d, v13.d[0]
    fmla v14.2d, v14.2d, v14.d[0]
    fmla v15.2d, v15.2d, v15.d[0]
    fmla v16.2d, v16.2d, v16.d[0]
    fmla v17.2d, v17.2d, v17.d[0]
    fmla v18.2d, v18.2d, v18.d[0]
    fmla v19.2d, v19.2d, v19.d[0]
    subs x0, x0, #1
    fmla v20.2d, v20.2d, v20.d[0]
    fmla v21.2d, v21.2d, v21.d[0]
    fmla v22.2d, v22.2d, v22.d[0]
    fmla v23.2d, v23.2d, v23.d[0]
    fmla v24.2d, v24.2d, v24.d[0]
    fmla v25.2d, v25.2d, v25.d[0]
    fmla v26.2d, v26.2d, v26.d[0]
    fmla v27.2d, v27.2d, v27.d[0]
    fmla v28.2d, v28.2d, v28.d[0]
    fmla v29.2d, v29.2d, v29.d[0]
    fmla v30.2d, v30.2d, v30.d[0]
    fmla v31.2d, v31.2d, v31.d[0]
    bne .asimd.fmla.vs.f64f64f64.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_fmla_vv_f64f64f64
_asimd_fmla_vv_f64f64f64:
#else
.globl asimd_fmla_vv_f64f64f64
asimd_fmla_vv_f64f64f64:
#endif
    preserve_caller_vec
    eor v0.16b, v0.16b, v0.16b
    eor v1.16b, v1.16b, v1.16b
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
    eor v20.16b, v20.16b, v20.16b
    eor v21.16b, v21.16b, v21.16b
    eor v22.16b, v22.16b, v22.16b
    eor v23.16b, v23.16b, v23.16b
    eor v24.16b, v24.16b, v24.16b
    eor v25.16b, v25.16b, v25.16b
    eor v26.16b, v26.16b, v26.16b
    eor v27.16b, v27.16b, v27.16b
    eor v28.16b, v28.16b, v28.16b
    eor v29.16b, v29.16b, v29.16b
    eor v30.16b, v30.16b, v30.16b
    eor v31.16b, v31.16b, v31.16b
.asimd.fmla.vv.f64f64f64.L1:
    fmla v8.2d, v8.2d, v8.2d
    fmla v9.2d, v9.2d, v9.2d
    fmla v10.2d, v10.2d, v10.2d
    fmla v11.2d, v11.2d, v11.2d
    fmla v12.2d, v12.2d, v12.2d
    fmla v13.2d, v13.2d, v13.2d
    fmla v14.2d, v14.2d, v14.2d
    fmla v15.2d, v15.2d, v15.2d
    fmla v16.2d, v16.2d, v16.2d
    fmla v17.2d, v17.2d, v17.2d
    fmla v18.2d, v18.2d, v18.2d
    fmla v19.2d, v19.2d, v19.2d
    subs x0, x0, #1
    fmla v20.2d, v20.2d, v20.2d
    fmla v21.2d, v21.2d, v21.2d
    fmla v22.2d, v22.2d, v22.2d
    fmla v23.2d, v23.2d, v23.2d
    fmla v24.2d, v24.2d, v24.2d
    fmla v25.2d, v25.2d, v25.2d
    fmla v26.2d, v26.2d, v26.2d
    fmla v27.2d, v27.2d, v27.2d
    fmla v28.2d, v28.2d, v28.2d
    fmla v29.2d, v29.2d, v29.2d
    fmla v30.2d, v30.2d, v30.2d
    fmla v31.2d, v31.2d, v31.2d
    bne .asimd.fmla.vv.f64f64f64.L1
    restore_caller_vec
    ret

