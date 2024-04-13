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
.globl _ime_vmadot_s32s8s8
_ime_vmadot_s32s8s8:
#else
.globl ime_vmadot_s32s8s8
ime_vmadot_s32s8s8:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.ime.vmadot.s32s8s8.L1:
    vsetvli x7, x0, e8, m1
    vmadot v4, v0, v1
    vmadot v6, v0, v1
    vmadot v8, v0, v1
    vmadot v10, v0, v1
    vmadot v12, v0, v1
    vmadot v14, v0, v1
    vmadot v16, v0, v1
    addi a0, a0, -1
    vmadot v18, v0, v1
    vmadot v20, v0, v1
    vmadot v22, v0, v1
    vmadot v24, v0, v1
    vmadot v26, v0, v1
    vmadot v28, v0, v1
    vmadot v30, v0, v1
    bnez a0, .ime.vmadot.s32s8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _ime_vmadotu_u32u8u8
_ime_vmadotu_u32u8u8:
#else
.globl ime_vmadotu_u32u8u8
ime_vmadotu_u32u8u8:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.ime.vmadotu.u32u8u8.L1:
    vsetvli x7, x0, e8, m1
    vmadotu v4, v0, v1
    vmadotu v6, v0, v1
    vmadotu v8, v0, v1
    vmadotu v10, v0, v1
    vmadotu v12, v0, v1
    vmadotu v14, v0, v1
    vmadotu v16, v0, v1
    addi a0, a0, -1
    vmadotu v18, v0, v1
    vmadotu v20, v0, v1
    vmadotu v22, v0, v1
    vmadotu v24, v0, v1
    vmadotu v26, v0, v1
    vmadotu v28, v0, v1
    vmadotu v30, v0, v1
    bnez a0, .ime.vmadotu.u32u8u8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _ime_vmadotus_s32u8s8
_ime_vmadotus_s32u8s8:
#else
.globl ime_vmadotus_s32u8s8
ime_vmadotus_s32u8s8:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.ime.vmadotus.s32u8s8.L1:
    vsetvli x7, x0, e8, m1
    vmadotus v4, v0, v1
    vmadotus v6, v0, v1
    vmadotus v8, v0, v1
    vmadotus v10, v0, v1
    vmadotus v12, v0, v1
    vmadotus v14, v0, v1
    vmadotus v16, v0, v1
    addi a0, a0, -1
    vmadotus v18, v0, v1
    vmadotus v20, v0, v1
    vmadotus v22, v0, v1
    vmadotus v24, v0, v1
    vmadotus v26, v0, v1
    vmadotus v28, v0, v1
    vmadotus v30, v0, v1
    bnez a0, .ime.vmadotus.s32u8s8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _ime_vmadotsu_s32s8u8
_ime_vmadotsu_s32s8u8:
#else
.globl ime_vmadotsu_s32s8u8
ime_vmadotsu_s32s8u8:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.ime.vmadotsu.s32s8u8.L1:
    vsetvli x7, x0, e8, m1
    vmadotsu v4, v0, v1
    vmadotsu v6, v0, v1
    vmadotsu v8, v0, v1
    vmadotsu v10, v0, v1
    vmadotsu v12, v0, v1
    vmadotsu v14, v0, v1
    vmadotsu v16, v0, v1
    addi a0, a0, -1
    vmadotsu v18, v0, v1
    vmadotsu v20, v0, v1
    vmadotsu v22, v0, v1
    vmadotsu v24, v0, v1
    vmadotsu v26, v0, v1
    vmadotsu v28, v0, v1
    vmadotsu v30, v0, v1
    bnez a0, .ime.vmadotsu.s32s8u8.L1
    restore_caller_vec
    ret

#ifdef __APPLE__
.globl _ime_vmadotslide_s32s8s8
_ime_vmadotslide_s32s8s8:
#else
.globl ime_vmadotslide_s32s8s8
ime_vmadotslide_s32s8s8:
#endif
    preserve_caller_vec
    vsetvli x7, x0, e8, m8
    vxor.vv v0, v0, v0
    vxor.vv v8, v8, v8
    vxor.vv v16, v16, v16
    vxor.vv v24, v24, v24
.ime.vmadotslide.s32s8s8.L1:
    vsetvli x7, x0, e8, m1
    vmadot v4, v0, v2
    vmadot1 v6, v0, v2
    vmadot2 v8, v0, v2
    vmadot3 v10, v0, v2
    vmadot v12, v0, v2
    vmadot1 v14, v0, v2
    vmadot2 v16, v0, v2
    vmadot3 v18, v0, v2
    addi a0, a0, -1
    vmadot v20, v0, v2
    vmadot1 v22, v0, v2
    vmadot2 v24, v0, v2
    vmadot3 v26, v0, v2
    bnez a0, .ime.vmadotslide.s32s8s8.L1
    restore_caller_vec
    ret
