#include "scalable.inc"

.p2align 4
.globl SYMBOL(sve2_smlalb_s8)
SYMBOL(sve2_smlalb_s8):
    save_vectors
    ptrue p0.h
    dup z0.b, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().h, #0
    .endr
    cmp x0, #0
    ble L_sve2_smlalb_s8_store
L_sve2_smlalb_s8_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        smlalb z\reg\().h, z0.b, z1.b
    .endr
    subs x0, x0, #1
    bne L_sve2_smlalb_s8_loop
L_sve2_smlalb_s8_store:
    cbz x1, L_sve2_smlalb_s8_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1h {z\reg\().h}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve2_smlalb_s8_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve2_smlalt_s8)
SYMBOL(sve2_smlalt_s8):
    save_vectors
    ptrue p0.h
    dup z0.b, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().h, #0
    .endr
    cmp x0, #0
    ble L_sve2_smlalt_s8_store
L_sve2_smlalt_s8_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        smlalt z\reg\().h, z0.b, z1.b
    .endr
    subs x0, x0, #1
    bne L_sve2_smlalt_s8_loop
L_sve2_smlalt_s8_store:
    cbz x1, L_sve2_smlalt_s8_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1h {z\reg\().h}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve2_smlalt_s8_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve2_smlalb_s16)
SYMBOL(sve2_smlalb_s16):
    save_vectors
    ptrue p0.s
    dup z0.h, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().s, #0
    .endr
    cmp x0, #0
    ble L_sve2_smlalb_s16_store
L_sve2_smlalb_s16_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        smlalb z\reg\().s, z0.h, z1.h
    .endr
    subs x0, x0, #1
    bne L_sve2_smlalb_s16_loop
L_sve2_smlalb_s16_store:
    cbz x1, L_sve2_smlalb_s16_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1w {z\reg\().s}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve2_smlalb_s16_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve2_smlalt_s16)
SYMBOL(sve2_smlalt_s16):
    save_vectors
    ptrue p0.s
    dup z0.h, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().s, #0
    .endr
    cmp x0, #0
    ble L_sve2_smlalt_s16_store
L_sve2_smlalt_s16_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        smlalt z\reg\().s, z0.h, z1.h
    .endr
    subs x0, x0, #1
    bne L_sve2_smlalt_s16_loop
L_sve2_smlalt_s16_store:
    cbz x1, L_sve2_smlalt_s16_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1w {z\reg\().s}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve2_smlalt_s16_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve2_smlalb_s32)
SYMBOL(sve2_smlalb_s32):
    save_vectors
    ptrue p0.d
    dup z0.s, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().d, #0
    .endr
    cmp x0, #0
    ble L_sve2_smlalb_s32_store
L_sve2_smlalb_s32_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        smlalb z\reg\().d, z0.s, z1.s
    .endr
    subs x0, x0, #1
    bne L_sve2_smlalb_s32_loop
L_sve2_smlalb_s32_store:
    cbz x1, L_sve2_smlalb_s32_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1d {z\reg\().d}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve2_smlalb_s32_done:
    restore_vectors
    ret

.p2align 4
.globl SYMBOL(sve2_smlalt_s32)
SYMBOL(sve2_smlalt_s32):
    save_vectors
    ptrue p0.d
    dup z0.s, #1
    mov z1.d, z0.d
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        dup z\reg\().d, #0
    .endr
    cmp x0, #0
    ble L_sve2_smlalt_s32_store
L_sve2_smlalt_s32_loop:
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        smlalt z\reg\().d, z0.s, z1.s
    .endr
    subs x0, x0, #1
    bne L_sve2_smlalt_s32_loop
L_sve2_smlalt_s32_store:
    cbz x1, L_sve2_smlalt_s32_done
    .irp reg, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
        st1d {z\reg\().d}, p0, [x1]
        addvl x1, x1, #1
    .endr
L_sve2_smlalt_s32_done:
    restore_vectors
    ret

#ifndef __APPLE__
.section .note.GNU-stack,"",%progbits
#endif
