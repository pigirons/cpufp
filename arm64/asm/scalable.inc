#ifdef __APPLE__
#define SYMBOL(name) _##name
#else
#define SYMBOL(name) name
#endif

.text
.p2align 4
.macro save_vectors
    stp d8, d9, [sp, #-16]!
    stp d10, d11, [sp, #-16]!
    stp d12, d13, [sp, #-16]!
    stp d14, d15, [sp, #-16]!
.endm
.macro restore_vectors
    ldp d14, d15, [sp], #16
    ldp d12, d13, [sp], #16
    ldp d10, d11, [sp], #16
    ldp d8, d9, [sp], #16
.endm
