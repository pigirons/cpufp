#include "scalable.inc"

.globl SYMBOL(sve_vector_bytes)
SYMBOL(sve_vector_bytes):
    cntb x0
    ret

.p2align 4
.globl SYMBOL(sve_fmla_f16)
SYMBOL(sve_fmla_f16):
    save_vectors
    ptrue p0.h
    fdup z0.h, #1.0
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().h, #0
    .endr
    cmp x0, #0
    ble L_sve_fmla_f16_store
L_sve_fmla_f16_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        fmla z\reg\().h, p0/m, z0.h, z1.h
    .endr
    subs x0, x0, #1
    bne L_sve_fmla_f16_loop
L_sve_fmla_f16_store:
    cbz x1, L_sve_fmla_f16_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1h {z\reg\().h}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve_fmla_f16_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve_fmla_f32)
SYMBOL(sve_fmla_f32):
    save_vectors
    ptrue p0.s
    fdup z0.s, #1.0
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().s, #0
    .endr
    cmp x0, #0
    ble L_sve_fmla_f32_store
L_sve_fmla_f32_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        fmla z\reg\().s, p0/m, z0.s, z1.s
    .endr
    subs x0, x0, #1
    bne L_sve_fmla_f32_loop
L_sve_fmla_f32_store:
    cbz x1, L_sve_fmla_f32_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1w {z\reg\().s}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve_fmla_f32_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve_fmla_f64)
SYMBOL(sve_fmla_f64):
    save_vectors
    ptrue p0.d
    fdup z0.d, #1.0
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().d, #0
    .endr
    cmp x0, #0
    ble L_sve_fmla_f64_store
L_sve_fmla_f64_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        fmla z\reg\().d, p0/m, z0.d, z1.d
    .endr
    subs x0, x0, #1
    bne L_sve_fmla_f64_loop
L_sve_fmla_f64_store:
    cbz x1, L_sve_fmla_f64_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1d {z\reg\().d}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve_fmla_f64_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve_sdot_s8)
SYMBOL(sve_sdot_s8):
    save_vectors
    ptrue p0.s
    dup z0.b, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().s, #0
    .endr
    cmp x0, #0
    ble L_sve_sdot_s8_store
L_sve_sdot_s8_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        sdot z\reg\().s, z0.b, z1.b
    .endr
    subs x0, x0, #1
    bne L_sve_sdot_s8_loop
L_sve_sdot_s8_store:
    cbz x1, L_sve_sdot_s8_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1w {z\reg\().s}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve_sdot_s8_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve_udot_u8)
SYMBOL(sve_udot_u8):
    save_vectors
    ptrue p0.s
    dup z0.b, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().s, #0
    .endr
    cmp x0, #0
    ble L_sve_udot_u8_store
L_sve_udot_u8_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        udot z\reg\().s, z0.b, z1.b
    .endr
    subs x0, x0, #1
    bne L_sve_udot_u8_loop
L_sve_udot_u8_store:
    cbz x1, L_sve_udot_u8_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1w {z\reg\().s}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve_udot_u8_done:
    restore_vectors
    ret

#ifndef __APPLE__
.section .note.GNU-stack,"",%progbits
#endif
