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
.globl _asimd_mmla_fp32bf16bf16
_asimd_mmla_fp32bf16bf16:
#else
.globl asimd_mmla_fp32bf16bf16
asimd_mmla_fp32bf16bf16:
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
.asimd.mmla.fp32bf16bf16.L1:
    bfmmla v8.4s, v8.8h, v8.8h
    bfmmla v9.4s, v9.8h, v9.8h
    bfmmla v10.4s, v10.8h, v10.8h
    bfmmla v11.4s, v11.8h, v11.8h
    bfmmla v12.4s, v12.8h, v12.8h
    bfmmla v13.4s, v13.8h, v13.8h
    bfmmla v14.4s, v14.8h, v14.8h
    bfmmla v15.4s, v15.8h, v15.8h
    bfmmla v16.4s, v16.8h, v16.8h
    bfmmla v17.4s, v17.8h, v17.8h
    bfmmla v18.4s, v18.8h, v18.8h
    bfmmla v19.4s, v19.8h, v19.8h
    subs x0, x0, #1
    bfmmla v20.4s, v20.8h, v20.8h
    bfmmla v21.4s, v21.8h, v21.8h
    bfmmla v22.4s, v22.8h, v22.8h
    bfmmla v23.4s, v23.8h, v23.8h
    bfmmla v24.4s, v24.8h, v24.8h
    bfmmla v25.4s, v25.8h, v25.8h
    bfmmla v26.4s, v26.8h, v26.8h
    bfmmla v27.4s, v27.8h, v27.8h
    bfmmla v28.4s, v28.8h, v28.8h
    bfmmla v29.4s, v29.8h, v29.8h
    bfmmla v30.4s, v30.8h, v30.8h
    bfmmla v31.4s, v31.8h, v31.8h
    bne .asimd.mmla.fp32bf16bf16.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp2a_vs_fp32bf16bf16
_asimd_dp2a_vs_fp32bf16bf16:
#else
.globl asimd_dp2a_vs_fp32bf16bf16
asimd_dp2a_vs_fp32bf16bf16:
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
.asimd.dp2a.vs.fp32bf16bf16.L1:
    bfdot v8.4s, v8.8h, v8.2h[0]
    bfdot v9.4s, v9.8h, v9.2h[0]
    bfdot v10.4s, v10.8h, v10.2h[0]
    bfdot v11.4s, v11.8h, v11.2h[0]
    bfdot v12.4s, v12.8h, v12.2h[0]
    bfdot v13.4s, v13.8h, v13.2h[0]
    bfdot v14.4s, v14.8h, v14.2h[0]
    bfdot v15.4s, v15.8h, v15.2h[0]
    bfdot v16.4s, v16.8h, v16.2h[0]
    bfdot v17.4s, v17.8h, v17.2h[0]
    bfdot v18.4s, v18.8h, v18.2h[0]
    bfdot v19.4s, v19.8h, v19.2h[0]
    subs x0, x0, #1
    bfdot v20.4s, v20.8h, v20.2h[0]
    bfdot v21.4s, v21.8h, v21.2h[0]
    bfdot v22.4s, v22.8h, v22.2h[0]
    bfdot v23.4s, v23.8h, v23.2h[0]
    bfdot v24.4s, v24.8h, v24.2h[0]
    bfdot v25.4s, v25.8h, v25.2h[0]
    bfdot v26.4s, v26.8h, v26.2h[0]
    bfdot v27.4s, v27.8h, v27.2h[0]
    bfdot v28.4s, v28.8h, v28.2h[0]
    bfdot v29.4s, v29.8h, v29.2h[0]
    bfdot v30.4s, v30.8h, v30.2h[0]
    bfdot v31.4s, v31.8h, v31.2h[0]
    bne .asimd.dp2a.vs.fp32bf16bf16.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp2a_vv_fp32bf16bf16
_asimd_dp2a_vv_fp32bf16bf16:
#else
.globl asimd_dp2a_vv_fp32bf16bf16
asimd_dp2a_vv_fp32bf16bf16:
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
.asimd.dp2a.vv.fp32bf16bf16.L1:
    bfdot v8.4s, v8.8h, v8.8h
    bfdot v9.4s, v9.8h, v9.8h
    bfdot v10.4s, v10.8h, v10.8h
    bfdot v11.4s, v11.8h, v11.8h
    bfdot v12.4s, v12.8h, v12.8h
    bfdot v13.4s, v13.8h, v13.8h
    bfdot v14.4s, v14.8h, v14.8h
    bfdot v15.4s, v15.8h, v15.8h
    bfdot v16.4s, v16.8h, v16.8h
    bfdot v17.4s, v17.8h, v17.8h
    bfdot v18.4s, v18.8h, v18.8h
    bfdot v19.4s, v19.8h, v19.8h
    subs x0, x0, #1
    bfdot v20.4s, v20.8h, v20.8h
    bfdot v21.4s, v21.8h, v21.8h
    bfdot v22.4s, v22.8h, v22.8h
    bfdot v23.4s, v23.8h, v23.8h
    bfdot v24.4s, v24.8h, v24.8h
    bfdot v25.4s, v25.8h, v25.8h
    bfdot v26.4s, v26.8h, v26.8h
    bfdot v27.4s, v27.8h, v27.8h
    bfdot v28.4s, v28.8h, v28.8h
    bfdot v29.4s, v29.8h, v29.8h
    bfdot v30.4s, v30.8h, v30.8h
    bfdot v31.4s, v31.8h, v31.8h
    bne .asimd.dp2a.vv.fp32bf16bf16.L1
    restore_caller_vec
    ret

