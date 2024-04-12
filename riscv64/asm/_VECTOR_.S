.align 4

.macro preserve_caller_vec
    csrr x5, vtype
    csrr x6, vl
    vsetvli x7, x0, e8, m8
    sub sp, sp, x7
    vse8.v v0, (sp)
    sub sp, sp, x7
    vse8.v v8, (sp)
    sub sp, sp, x7
    vse8.v v16, (sp)
    sub sp, sp, x7
    vse8.v v24, (sp)
.endm

.macro restore_caller_vec
    vsetvli x7, x0, e8, m8
    vle8.v v24, (sp)
    add sp, sp, x7
    vle8.v v16, (sp)
    add sp, sp, x7
    vle8.v v8, (sp)
    add sp, sp, x7
    vle8.v v0, (sp)
    add sp, sp, x7
    vsetvl x7, x6, x5
.endm

#ifdef __APPLE__
.globl _vector_vfmacc_vf_f16f16f16
_vector_vfmacc_vf_f16f16f16:
#else
.globl vector_vfmacc_vf_f16f16f16
vector_vfmacc_vf_f16f16f16:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.vector.vfmacc.vf.f16f16f16.L1:
    vsetvli x7, x0, e16, m1
    vfmacc.vf v9, f0, v1
    vfmacc.vf v10, f0, v1
    vfmacc.vf v11, f0, v1
    vfmacc.vf v12, f0, v1
    vfmacc.vf v13, f0, v1
    vfmacc.vf v14, f0, v1
    vfmacc.vf v15, f0, v1
    vfmacc.vf v16, f0, v1
    vfmacc.vf v17, f0, v1
    vfmacc.vf v18, f0, v1
    vfmacc.vf v19, f0, v1
    addi a0, a0, -1
    vfmacc.vf v20, f0, v1
    vfmacc.vf v21, f0, v1
    vfmacc.vf v22, f0, v1
    vfmacc.vf v23, f0, v1
    vfmacc.vf v24, f0, v1
    vfmacc.vf v25, f0, v1
    vfmacc.vf v26, f0, v1
    vfmacc.vf v27, f0, v1
    vfmacc.vf v28, f0, v1
    vfmacc.vf v29, f0, v1
    vfmacc.vf v30, f0, v1
    vfmacc.vf v31, f0, v1
    bnez a0, .vector.vfmacc.vf.f16f16f16.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _vector_vfmacc_vv_f16f16f16
_vector_vfmacc_vv_f16f16f16:
#else
.globl vector_vfmacc_vv_f16f16f16
vector_vfmacc_vv_f16f16f16:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.vector.vfmacc.vv.f16f16f16.L1:
    vsetvli x7, x0, e16, m1
    vfmacc.vv v8, v0, v1
    vfmacc.vv v9, v0, v1
    vfmacc.vv v10, v0, v1
    vfmacc.vv v11, v0, v1
    vfmacc.vv v12, v0, v1
    vfmacc.vv v13, v0, v1
    vfmacc.vv v14, v0, v1
    vfmacc.vv v15, v0, v1
    vfmacc.vv v16, v0, v1
    vfmacc.vv v17, v0, v1
    vfmacc.vv v18, v0, v1
    vfmacc.vv v19, v0, v1
    addi a0, a0, -1
    vfmacc.vv v20, v0, v1
    vfmacc.vv v21, v0, v1
    vfmacc.vv v22, v0, v1
    vfmacc.vv v23, v0, v1
    vfmacc.vv v24, v0, v1
    vfmacc.vv v25, v0, v1
    vfmacc.vv v26, v0, v1
    vfmacc.vv v27, v0, v1
    vfmacc.vv v28, v0, v1
    vfmacc.vv v29, v0, v1
    vfmacc.vv v30, v0, v1
    vfmacc.vv v31, v0, v1
    bnez a0, .vector.vfmacc.vv.f16f16f16.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _vector_vfmacc_vf_f32f32f32
_vector_vfmacc_vf_f32f32f32:
#else
.globl vector_vfmacc_vf_f32f32f32
vector_vfmacc_vf_f32f32f32:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.vector.vfmacc.vf.f32f32f32.L1:
    vsetvli x7, x0, e32, m1
    vfmacc.vf v9, f0, v1
    vfmacc.vf v10, f0, v1
    vfmacc.vf v11, f0, v1
    vfmacc.vf v12, f0, v1
    vfmacc.vf v13, f0, v1
    vfmacc.vf v14, f0, v1
    vfmacc.vf v15, f0, v1
    vfmacc.vf v16, f0, v1
    vfmacc.vf v17, f0, v1
    vfmacc.vf v18, f0, v1
    vfmacc.vf v19, f0, v1
    addi a0, a0, -1
    vfmacc.vf v20, f0, v1
    vfmacc.vf v21, f0, v1
    vfmacc.vf v22, f0, v1
    vfmacc.vf v23, f0, v1
    vfmacc.vf v24, f0, v1
    vfmacc.vf v25, f0, v1
    vfmacc.vf v26, f0, v1
    vfmacc.vf v27, f0, v1
    vfmacc.vf v28, f0, v1
    vfmacc.vf v29, f0, v1
    vfmacc.vf v30, f0, v1
    vfmacc.vf v31, f0, v1
    bnez a0, .vector.vfmacc.vf.f32f32f32.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _vector_vfmacc_vv_f32f32f32
_vector_vfmacc_vv_f32f32f32:
#else
.globl vector_vfmacc_vv_f32f32f32
vector_vfmacc_vv_f32f32f32:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.vector.vfmacc.vv.f32f32f32.L1:
    vsetvli x7, x0, e32, m1
    vfmacc.vv v8, v0, v1
    vfmacc.vv v9, v0, v1
    vfmacc.vv v10, v0, v1
    vfmacc.vv v11, v0, v1
    vfmacc.vv v12, v0, v1
    vfmacc.vv v13, v0, v1
    vfmacc.vv v14, v0, v1
    vfmacc.vv v15, v0, v1
    vfmacc.vv v16, v0, v1
    vfmacc.vv v17, v0, v1
    vfmacc.vv v18, v0, v1
    vfmacc.vv v19, v0, v1
    addi a0, a0, -1
    vfmacc.vv v20, v0, v1
    vfmacc.vv v21, v0, v1
    vfmacc.vv v22, v0, v1
    vfmacc.vv v23, v0, v1
    vfmacc.vv v24, v0, v1
    vfmacc.vv v25, v0, v1
    vfmacc.vv v26, v0, v1
    vfmacc.vv v27, v0, v1
    vfmacc.vv v28, v0, v1
    vfmacc.vv v29, v0, v1
    vfmacc.vv v30, v0, v1
    vfmacc.vv v31, v0, v1
    bnez a0, .vector.vfmacc.vv.f32f32f32.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _vector_vfmacc_vf_f64f64f64
_vector_vfmacc_vf_f64f64f64:
#else
.globl vector_vfmacc_vf_f64f64f64
vector_vfmacc_vf_f64f64f64:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.vector.vfmacc.vf.f64f64f64.L1:
    vsetvli x7, x0, e64, m1
    vfmacc.vf v9, f0, v1
    vfmacc.vf v10, f0, v1
    vfmacc.vf v11, f0, v1
    vfmacc.vf v12, f0, v1
    vfmacc.vf v13, f0, v1
    vfmacc.vf v14, f0, v1
    vfmacc.vf v15, f0, v1
    vfmacc.vf v16, f0, v1
    vfmacc.vf v17, f0, v1
    vfmacc.vf v18, f0, v1
    vfmacc.vf v19, f0, v1
    addi a0, a0, -1
    vfmacc.vf v20, f0, v1
    vfmacc.vf v21, f0, v1
    vfmacc.vf v22, f0, v1
    vfmacc.vf v23, f0, v1
    vfmacc.vf v24, f0, v1
    vfmacc.vf v25, f0, v1
    vfmacc.vf v26, f0, v1
    vfmacc.vf v27, f0, v1
    vfmacc.vf v28, f0, v1
    vfmacc.vf v29, f0, v1
    vfmacc.vf v30, f0, v1
    vfmacc.vf v31, f0, v1
    bnez a0, .vector.vfmacc.vf.f64f64f64.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _vector_vfmacc_vv_f64f64f64
_vector_vfmacc_vv_f64f64f64:
#else
.globl vector_vfmacc_vv_f64f64f64
vector_vfmacc_vv_f64f64f64:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.vector.vfmacc.vv.f64f64f64.L1:
    vsetvli x7, x0, e64, m1
    vfmacc.vv v8, v0, v1
    vfmacc.vv v9, v0, v1
    vfmacc.vv v10, v0, v1
    vfmacc.vv v11, v0, v1
    vfmacc.vv v12, v0, v1
    vfmacc.vv v13, v0, v1
    vfmacc.vv v14, v0, v1
    vfmacc.vv v15, v0, v1
    vfmacc.vv v16, v0, v1
    vfmacc.vv v17, v0, v1
    vfmacc.vv v18, v0, v1
    vfmacc.vv v19, v0, v1
    addi a0, a0, -1
    vfmacc.vv v20, v0, v1
    vfmacc.vv v21, v0, v1
    vfmacc.vv v22, v0, v1
    vfmacc.vv v23, v0, v1
    vfmacc.vv v24, v0, v1
    vfmacc.vv v25, v0, v1
    vfmacc.vv v26, v0, v1
    vfmacc.vv v27, v0, v1
    vfmacc.vv v28, v0, v1
    vfmacc.vv v29, v0, v1
    vfmacc.vv v30, v0, v1
    vfmacc.vv v31, v0, v1
    bnez a0, .vector.vfmacc.vv.f64f64f64.L1
    restore_caller_vec
    ret
