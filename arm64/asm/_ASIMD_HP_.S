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
.globl _asimd_fmla_vs_fp16fp16fp16
_asimd_fmla_vs_fp16fp16fp16:
#else
.globl asimd_fmla_vs_fp16fp16fp16
asimd_fmla_vs_fp16fp16fp16:
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
.asimd.fmla.vs.fp16fp16fp16.L1:
    fmla v8.8h, v0.8h, v1.h[0]
    fmla v9.8h, v0.8h, v1.h[0]
    fmla v10.8h, v0.8h, v1.h[0]
    fmla v11.8h, v0.8h, v1.h[0]
    fmla v12.8h, v0.8h, v1.h[0]
    fmla v13.8h, v0.8h, v1.h[0]
    fmla v14.8h, v0.8h, v1.h[0]
    fmla v15.8h, v0.8h, v1.h[0]
    fmla v16.8h, v0.8h, v1.h[0]
    fmla v17.8h, v0.8h, v1.h[0]
    fmla v18.8h, v0.8h, v1.h[0]
    fmla v19.8h, v0.8h, v1.h[0]
    subs x0, x0, #1
    fmla v20.8h, v0.8h, v1.h[0]
    fmla v21.8h, v0.8h, v1.h[0]
    fmla v22.8h, v0.8h, v1.h[0]
    fmla v23.8h, v0.8h, v1.h[0]
    fmla v24.8h, v0.8h, v1.h[0]
    fmla v25.8h, v0.8h, v1.h[0]
    fmla v26.8h, v0.8h, v1.h[0]
    fmla v27.8h, v0.8h, v1.h[0]
    fmla v28.8h, v0.8h, v1.h[0]
    fmla v29.8h, v0.8h, v1.h[0]
    fmla v30.8h, v0.8h, v1.h[0]
    fmla v31.8h, v0.8h, v1.h[0]
    bne .asimd.fmla.vs.fp16fp16fp16.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_fmla_vv_fp16fp16fp16
_asimd_fmla_vv_fp16fp16fp16:
#else
.globl asimd_fmla_vv_fp16fp16fp16
asimd_fmla_vv_fp16fp16fp16:
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
.asimd.fmla.vv.fp16fp16fp16.L1:
    fmla v8.8h, v0.8h, v1.8h
    fmla v9.8h, v0.8h, v1.8h
    fmla v10.8h, v0.8h, v1.8h
    fmla v11.8h, v0.8h, v1.8h
    fmla v12.8h, v0.8h, v1.8h
    fmla v13.8h, v0.8h, v1.8h
    fmla v14.8h, v0.8h, v1.8h
    fmla v15.8h, v0.8h, v1.8h
    fmla v16.8h, v0.8h, v1.8h
    fmla v17.8h, v0.8h, v1.8h
    fmla v18.8h, v0.8h, v1.8h
    fmla v19.8h, v0.8h, v1.8h
    subs x0, x0, #1
    fmla v20.8h, v0.8h, v1.8h
    fmla v21.8h, v0.8h, v1.8h
    fmla v22.8h, v0.8h, v1.8h
    fmla v23.8h, v0.8h, v1.8h
    fmla v24.8h, v0.8h, v1.8h
    fmla v25.8h, v0.8h, v1.8h
    fmla v26.8h, v0.8h, v1.8h
    fmla v27.8h, v0.8h, v1.8h
    fmla v28.8h, v0.8h, v1.8h
    fmla v29.8h, v0.8h, v1.8h
    fmla v30.8h, v0.8h, v1.8h
    fmla v31.8h, v0.8h, v1.8h
    bne .asimd.fmla.vv.fp16fp16fp16.L1
    restore_caller_vec
    ret

