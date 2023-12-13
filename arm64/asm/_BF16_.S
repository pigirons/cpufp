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
    mmla v8.4s, v0.8h, v1.8h
    mmla v9.4s, v0.8h, v1.8h
    mmla v10.4s, v0.8h, v1.8h
    mmla v11.4s, v0.8h, v1.8h
    mmla v12.4s, v0.8h, v1.8h
    mmla v13.4s, v0.8h, v1.8h
    mmla v14.4s, v0.8h, v1.8h
    mmla v15.4s, v0.8h, v1.8h
    mmla v16.4s, v0.8h, v1.8h
    mmla v17.4s, v0.8h, v1.8h
    mmla v18.4s, v0.8h, v1.8h
    mmla v19.4s, v0.8h, v1.8h
    subs x0, x0, #1
    mmla v20.4s, v0.8h, v1.8h
    mmla v21.4s, v0.8h, v1.8h
    mmla v22.4s, v0.8h, v1.8h
    mmla v23.4s, v0.8h, v1.8h
    mmla v24.4s, v0.8h, v1.8h
    mmla v25.4s, v0.8h, v1.8h
    mmla v26.4s, v0.8h, v1.8h
    mmla v27.4s, v0.8h, v1.8h
    mmla v28.4s, v0.8h, v1.8h
    mmla v29.4s, v0.8h, v1.8h
    mmla v30.4s, v0.8h, v1.8h
    mmla v31.4s, v0.8h, v1.8h
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
    mmla v8.4s, v0.8h, v1.2h[0]
    mmla v9.4s, v0.8h, v1.2h[0]
    mmla v10.4s, v0.8h, v1.2h[0]
    mmla v11.4s, v0.8h, v1.2h[0]
    mmla v12.4s, v0.8h, v1.2h[0]
    mmla v13.4s, v0.8h, v1.2h[0]
    mmla v14.4s, v0.8h, v1.2h[0]
    mmla v15.4s, v0.8h, v1.2h[0]
    mmla v16.4s, v0.8h, v1.2h[0]
    mmla v17.4s, v0.8h, v1.2h[0]
    mmla v18.4s, v0.8h, v1.2h[0]
    mmla v19.4s, v0.8h, v1.2h[0]
    subs x0, x0, #1
    mmla v20.4s, v0.8h, v1.2h[0]
    mmla v21.4s, v0.8h, v1.2h[0]
    mmla v22.4s, v0.8h, v1.2h[0]
    mmla v23.4s, v0.8h, v1.2h[0]
    mmla v24.4s, v0.8h, v1.2h[0]
    mmla v25.4s, v0.8h, v1.2h[0]
    mmla v26.4s, v0.8h, v1.2h[0]
    mmla v27.4s, v0.8h, v1.2h[0]
    mmla v28.4s, v0.8h, v1.2h[0]
    mmla v29.4s, v0.8h, v1.2h[0]
    mmla v30.4s, v0.8h, v1.2h[0]
    mmla v31.4s, v0.8h, v1.2h[0]
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
    mmla v8.4s, v0.8h, v1.8h
    mmla v9.4s, v0.8h, v1.8h
    mmla v10.4s, v0.8h, v1.8h
    mmla v11.4s, v0.8h, v1.8h
    mmla v12.4s, v0.8h, v1.8h
    mmla v13.4s, v0.8h, v1.8h
    mmla v14.4s, v0.8h, v1.8h
    mmla v15.4s, v0.8h, v1.8h
    mmla v16.4s, v0.8h, v1.8h
    mmla v17.4s, v0.8h, v1.8h
    mmla v18.4s, v0.8h, v1.8h
    mmla v19.4s, v0.8h, v1.8h
    subs x0, x0, #1
    mmla v20.4s, v0.8h, v1.8h
    mmla v21.4s, v0.8h, v1.8h
    mmla v22.4s, v0.8h, v1.8h
    mmla v23.4s, v0.8h, v1.8h
    mmla v24.4s, v0.8h, v1.8h
    mmla v25.4s, v0.8h, v1.8h
    mmla v26.4s, v0.8h, v1.8h
    mmla v27.4s, v0.8h, v1.8h
    mmla v28.4s, v0.8h, v1.8h
    mmla v29.4s, v0.8h, v1.8h
    mmla v30.4s, v0.8h, v1.8h
    mmla v31.4s, v0.8h, v1.8h
    bne .asimd.dp2a.vv.fp32bf16bf16.L1
    restore_caller_vec
    ret

