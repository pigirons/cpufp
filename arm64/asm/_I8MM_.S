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
.globl _asimd_mmla_s32s8s8
_asimd_mmla_s32s8s8:
#else
.globl asimd_mmla_s32s8s8
asimd_mmla_s32s8s8:
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
.asimd.mmla.s32s8s8.L1:
    smmla v8.4s, v0.16b, v1.16b
    smmla v9.4s, v0.16b, v1.16b
    smmla v10.4s, v0.16b, v1.16b
    smmla v11.4s, v0.16b, v1.16b
    smmla v12.4s, v0.16b, v1.16b
    smmla v13.4s, v0.16b, v1.16b
    smmla v14.4s, v0.16b, v1.16b
    smmla v15.4s, v0.16b, v1.16b
    smmla v16.4s, v0.16b, v1.16b
    smmla v17.4s, v0.16b, v1.16b
    smmla v18.4s, v0.16b, v1.16b
    smmla v19.4s, v0.16b, v1.16b
    subs x0, x0, #1
    smmla v20.4s, v0.16b, v1.16b
    smmla v21.4s, v0.16b, v1.16b
    smmla v22.4s, v0.16b, v1.16b
    smmla v23.4s, v0.16b, v1.16b
    smmla v24.4s, v0.16b, v1.16b
    smmla v25.4s, v0.16b, v1.16b
    smmla v26.4s, v0.16b, v1.16b
    smmla v27.4s, v0.16b, v1.16b
    smmla v28.4s, v0.16b, v1.16b
    smmla v29.4s, v0.16b, v1.16b
    smmla v30.4s, v0.16b, v1.16b
    smmla v31.4s, v0.16b, v1.16b
    bne .asimd.mmla.s32s8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_mmla_u32u8u8
_asimd_mmla_u32u8u8:
#else
.globl asimd_mmla_u32u8u8
asimd_mmla_u32u8u8:
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
.asimd.mmla.u32u8u8.L1:
    ummla v8.4s, v0.16b, v1.16b
    ummla v9.4s, v0.16b, v1.16b
    ummla v10.4s, v0.16b, v1.16b
    ummla v11.4s, v0.16b, v1.16b
    ummla v12.4s, v0.16b, v1.16b
    ummla v13.4s, v0.16b, v1.16b
    ummla v14.4s, v0.16b, v1.16b
    ummla v15.4s, v0.16b, v1.16b
    ummla v16.4s, v0.16b, v1.16b
    ummla v17.4s, v0.16b, v1.16b
    ummla v18.4s, v0.16b, v1.16b
    ummla v19.4s, v0.16b, v1.16b
    subs x0, x0, #1
    ummla v20.4s, v0.16b, v1.16b
    ummla v21.4s, v0.16b, v1.16b
    ummla v22.4s, v0.16b, v1.16b
    ummla v23.4s, v0.16b, v1.16b
    ummla v24.4s, v0.16b, v1.16b
    ummla v25.4s, v0.16b, v1.16b
    ummla v26.4s, v0.16b, v1.16b
    ummla v27.4s, v0.16b, v1.16b
    ummla v28.4s, v0.16b, v1.16b
    ummla v29.4s, v0.16b, v1.16b
    ummla v30.4s, v0.16b, v1.16b
    ummla v31.4s, v0.16b, v1.16b
    bne .asimd.mmla.u32u8u8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_mmla_s32u8s8
_asimd_mmla_s32u8s8:
#else
.globl asimd_mmla_s32u8s8
asimd_mmla_s32u8s8:
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
.asimd.mmla.s32u8s8.L1:
    usmmla v8.4s, v0.16b, v1.16b
    usmmla v9.4s, v0.16b, v1.16b
    usmmla v10.4s, v0.16b, v1.16b
    usmmla v11.4s, v0.16b, v1.16b
    usmmla v12.4s, v0.16b, v1.16b
    usmmla v13.4s, v0.16b, v1.16b
    usmmla v14.4s, v0.16b, v1.16b
    usmmla v15.4s, v0.16b, v1.16b
    usmmla v16.4s, v0.16b, v1.16b
    usmmla v17.4s, v0.16b, v1.16b
    usmmla v18.4s, v0.16b, v1.16b
    usmmla v19.4s, v0.16b, v1.16b
    subs x0, x0, #1
    usmmla v20.4s, v0.16b, v1.16b
    usmmla v21.4s, v0.16b, v1.16b
    usmmla v22.4s, v0.16b, v1.16b
    usmmla v23.4s, v0.16b, v1.16b
    usmmla v24.4s, v0.16b, v1.16b
    usmmla v25.4s, v0.16b, v1.16b
    usmmla v26.4s, v0.16b, v1.16b
    usmmla v27.4s, v0.16b, v1.16b
    usmmla v28.4s, v0.16b, v1.16b
    usmmla v29.4s, v0.16b, v1.16b
    usmmla v30.4s, v0.16b, v1.16b
    usmmla v31.4s, v0.16b, v1.16b
    bne .asimd.mmla.s32u8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp4a_vs_s32s8u8
_asimd_dp4a_vs_s32s8u8:
#else
.globl asimd_dp4a_vs_s32s8u8
asimd_dp4a_vs_s32s8u8:
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
.asimd.dp4a.vs.s32s8u8.L1:
    sudot v8.4s, v0.16b, v1.4b[0]
    sudot v9.4s, v0.16b, v1.4b[0]
    sudot v10.4s, v0.16b, v1.4b[0]
    sudot v11.4s, v0.16b, v1.4b[0]
    sudot v12.4s, v0.16b, v1.4b[0]
    sudot v13.4s, v0.16b, v1.4b[0]
    sudot v14.4s, v0.16b, v1.4b[0]
    sudot v15.4s, v0.16b, v1.4b[0]
    sudot v16.4s, v0.16b, v1.4b[0]
    sudot v17.4s, v0.16b, v1.4b[0]
    sudot v18.4s, v0.16b, v1.4b[0]
    sudot v19.4s, v0.16b, v1.4b[0]
    subs x0, x0, #1
    sudot v20.4s, v0.16b, v1.4b[0]
    sudot v21.4s, v0.16b, v1.4b[0]
    sudot v22.4s, v0.16b, v1.4b[0]
    sudot v23.4s, v0.16b, v1.4b[0]
    sudot v24.4s, v0.16b, v1.4b[0]
    sudot v25.4s, v0.16b, v1.4b[0]
    sudot v26.4s, v0.16b, v1.4b[0]
    sudot v27.4s, v0.16b, v1.4b[0]
    sudot v28.4s, v0.16b, v1.4b[0]
    sudot v29.4s, v0.16b, v1.4b[0]
    sudot v30.4s, v0.16b, v1.4b[0]
    sudot v31.4s, v0.16b, v1.4b[0]
    bne .asimd.dp4a.vs.s32s8u8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp4a_vs_s32u8s8
_asimd_dp4a_vs_s32u8s8:
#else
.globl asimd_dp4a_vs_s32u8s8
asimd_dp4a_vs_s32u8s8:
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
.asimd.dp4a.vs.s32u8s8.L1:
    usdot v8.4s, v0.16b, v1.4b[0]
    usdot v9.4s, v0.16b, v1.4b[0]
    usdot v10.4s, v0.16b, v1.4b[0]
    usdot v11.4s, v0.16b, v1.4b[0]
    usdot v12.4s, v0.16b, v1.4b[0]
    usdot v13.4s, v0.16b, v1.4b[0]
    usdot v14.4s, v0.16b, v1.4b[0]
    usdot v15.4s, v0.16b, v1.4b[0]
    usdot v16.4s, v0.16b, v1.4b[0]
    usdot v17.4s, v0.16b, v1.4b[0]
    usdot v18.4s, v0.16b, v1.4b[0]
    usdot v19.4s, v0.16b, v1.4b[0]
    subs x0, x0, #1
    usdot v20.4s, v0.16b, v1.4b[0]
    usdot v21.4s, v0.16b, v1.4b[0]
    usdot v22.4s, v0.16b, v1.4b[0]
    usdot v23.4s, v0.16b, v1.4b[0]
    usdot v24.4s, v0.16b, v1.4b[0]
    usdot v25.4s, v0.16b, v1.4b[0]
    usdot v26.4s, v0.16b, v1.4b[0]
    usdot v27.4s, v0.16b, v1.4b[0]
    usdot v28.4s, v0.16b, v1.4b[0]
    usdot v29.4s, v0.16b, v1.4b[0]
    usdot v30.4s, v0.16b, v1.4b[0]
    usdot v31.4s, v0.16b, v1.4b[0]
    bne .asimd.dp4a.vs.s32u8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _asimd_dp4a_vv_s32u8s8
_asimd_dp4a_vv_s32u8s8:
#else
.globl asimd_dp4a_vv_s32u8s8
asimd_dp4a_vv_s32u8s8:
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
.asimd.dp4a.vv.s32u8s8.L1:
    usdot v8.4s, v0.16b, v1.16b
    usdot v9.4s, v0.16b, v1.16b
    usdot v10.4s, v0.16b, v1.16b
    usdot v11.4s, v0.16b, v1.16b
    usdot v12.4s, v0.16b, v1.16b
    usdot v13.4s, v0.16b, v1.16b
    usdot v14.4s, v0.16b, v1.16b
    usdot v15.4s, v0.16b, v1.16b
    usdot v16.4s, v0.16b, v1.16b
    usdot v17.4s, v0.16b, v1.16b
    usdot v18.4s, v0.16b, v1.16b
    usdot v19.4s, v0.16b, v1.16b
    subs x0, x0, #1
    usdot v20.4s, v0.16b, v1.16b
    usdot v21.4s, v0.16b, v1.16b
    usdot v22.4s, v0.16b, v1.16b
    usdot v23.4s, v0.16b, v1.16b
    usdot v24.4s, v0.16b, v1.16b
    usdot v25.4s, v0.16b, v1.16b
    usdot v26.4s, v0.16b, v1.16b
    usdot v27.4s, v0.16b, v1.16b
    usdot v28.4s, v0.16b, v1.16b
    usdot v29.4s, v0.16b, v1.16b
    usdot v30.4s, v0.16b, v1.16b
    usdot v31.4s, v0.16b, v1.16b
    bne .asimd.dp4a.vv.s32u8s8.L1
    restore_caller_vec
    ret

