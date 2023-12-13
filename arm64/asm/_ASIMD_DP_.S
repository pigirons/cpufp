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
.globl _asimd_dp4a_vs_s32s8s8
_asimd_dp4a_vs_s32s8s8:
#else
.globl asimd_dp4a_vs_s32s8s8
asimd_dp4a_vs_s32s8s8:
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
.asimd.dp4a.vs.s32s8s8.L1:
    sdot v8.4s, v0.16b, v1.4b[0]
    sdot v9.4s, v0.16b, v1.4b[0]
    sdot v10.4s, v0.16b, v1.4b[0]
    sdot v11.4s, v0.16b, v1.4b[0]
    sdot v12.4s, v0.16b, v1.4b[0]
    sdot v13.4s, v0.16b, v1.4b[0]
    sdot v14.4s, v0.16b, v1.4b[0]
    sdot v15.4s, v0.16b, v1.4b[0]
    sdot v16.4s, v0.16b, v1.4b[0]
    sdot v17.4s, v0.16b, v1.4b[0]
    sdot v18.4s, v0.16b, v1.4b[0]
    sdot v19.4s, v0.16b, v1.4b[0]
    subs x0, x0, #1
    sdot v20.4s, v0.16b, v1.4b[0]
    sdot v21.4s, v0.16b, v1.4b[0]
    sdot v22.4s, v0.16b, v1.4b[0]
    sdot v23.4s, v0.16b, v1.4b[0]
    sdot v24.4s, v0.16b, v1.4b[0]
    sdot v25.4s, v0.16b, v1.4b[0]
    sdot v26.4s, v0.16b, v1.4b[0]
    sdot v27.4s, v0.16b, v1.4b[0]
    sdot v28.4s, v0.16b, v1.4b[0]
    sdot v29.4s, v0.16b, v1.4b[0]
    sdot v30.4s, v0.16b, v1.4b[0]
    sdot v31.4s, v0.16b, v1.4b[0]
    bne .asimd.dp4a.vs.s32s8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp4a_vv_s32s8s8
_asimd_dp4a_vv_s32s8s8:
#else
.globl asimd_dp4a_vv_s32s8s8
asimd_dp4a_vv_s32s8s8:
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
.asimd.dp4a.vv.s32s8s8.L1:
    sdot v8.4s, v0.16b, v1.16b
    sdot v9.4s, v0.16b, v1.16b
    sdot v10.4s, v0.16b, v1.16b
    sdot v11.4s, v0.16b, v1.16b
    sdot v12.4s, v0.16b, v1.16b
    sdot v13.4s, v0.16b, v1.16b
    sdot v14.4s, v0.16b, v1.16b
    sdot v15.4s, v0.16b, v1.16b
    sdot v16.4s, v0.16b, v1.16b
    sdot v17.4s, v0.16b, v1.16b
    sdot v18.4s, v0.16b, v1.16b
    sdot v19.4s, v0.16b, v1.16b
    subs x0, x0, #1
    sdot v20.4s, v0.16b, v1.16b
    sdot v21.4s, v0.16b, v1.16b
    sdot v22.4s, v0.16b, v1.16b
    sdot v23.4s, v0.16b, v1.16b
    sdot v24.4s, v0.16b, v1.16b
    sdot v25.4s, v0.16b, v1.16b
    sdot v26.4s, v0.16b, v1.16b
    sdot v27.4s, v0.16b, v1.16b
    sdot v28.4s, v0.16b, v1.16b
    sdot v29.4s, v0.16b, v1.16b
    sdot v30.4s, v0.16b, v1.16b
    sdot v31.4s, v0.16b, v1.16b
    bne .asimd.dp4a.vv.s32s8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp4a_vs_u32u8u8
_asimd_dp4a_vs_u32u8u8:
#else
.globl asimd_dp4a_vs_u32u8u8
asimd_dp4a_vs_u32u8u8:
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
.asimd.dp4a.vs.u32u8u8.L1:
    udot v8.4s, v0.16b, v1.4b[0]
    udot v9.4s, v0.16b, v1.4b[0]
    udot v10.4s, v0.16b, v1.4b[0]
    udot v11.4s, v0.16b, v1.4b[0]
    udot v12.4s, v0.16b, v1.4b[0]
    udot v13.4s, v0.16b, v1.4b[0]
    udot v14.4s, v0.16b, v1.4b[0]
    udot v15.4s, v0.16b, v1.4b[0]
    udot v16.4s, v0.16b, v1.4b[0]
    udot v17.4s, v0.16b, v1.4b[0]
    udot v18.4s, v0.16b, v1.4b[0]
    udot v19.4s, v0.16b, v1.4b[0]
    subs x0, x0, #1
    udot v20.4s, v0.16b, v1.4b[0]
    udot v21.4s, v0.16b, v1.4b[0]
    udot v22.4s, v0.16b, v1.4b[0]
    udot v23.4s, v0.16b, v1.4b[0]
    udot v24.4s, v0.16b, v1.4b[0]
    udot v25.4s, v0.16b, v1.4b[0]
    udot v26.4s, v0.16b, v1.4b[0]
    udot v27.4s, v0.16b, v1.4b[0]
    udot v28.4s, v0.16b, v1.4b[0]
    udot v29.4s, v0.16b, v1.4b[0]
    udot v30.4s, v0.16b, v1.4b[0]
    udot v31.4s, v0.16b, v1.4b[0]
    bne .asimd.dp4a.vs.u32u8u8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp4a_vv_u32u8u8
_asimd_dp4a_vv_u32u8u8:
#else
.globl asimd_dp4a_vv_u32u8u8
asimd_dp4a_vv_u32u8u8:
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
.asimd.dp4a.vv.u32u8u8.L1:
    udot v8.4s, v0.16b, v1.16b
    udot v9.4s, v0.16b, v1.16b
    udot v10.4s, v0.16b, v1.16b
    udot v11.4s, v0.16b, v1.16b
    udot v12.4s, v0.16b, v1.16b
    udot v13.4s, v0.16b, v1.16b
    udot v14.4s, v0.16b, v1.16b
    udot v15.4s, v0.16b, v1.16b
    udot v16.4s, v0.16b, v1.16b
    udot v17.4s, v0.16b, v1.16b
    udot v18.4s, v0.16b, v1.16b
    udot v19.4s, v0.16b, v1.16b
    subs x0, x0, #1
    udot v20.4s, v0.16b, v1.16b
    udot v21.4s, v0.16b, v1.16b
    udot v22.4s, v0.16b, v1.16b
    udot v23.4s, v0.16b, v1.16b
    udot v24.4s, v0.16b, v1.16b
    udot v25.4s, v0.16b, v1.16b
    udot v26.4s, v0.16b, v1.16b
    udot v27.4s, v0.16b, v1.16b
    udot v28.4s, v0.16b, v1.16b
    udot v29.4s, v0.16b, v1.16b
    udot v30.4s, v0.16b, v1.16b
    udot v31.4s, v0.16b, v1.16b
    bne .asimd.dp4a.vv.u32u8u8.L1
    restore_caller_vec
    ret

