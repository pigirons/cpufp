#if __iset__ < 5
# define CLEAR addd
#else
# define CLEAR qppackdl
#endif

.macro impl_bench name, op
    .global \name
    .type   \name, #function
    .align 8
\name:
    {
        setwd wsz=34, nfx=0
        setbn rsz=29, rbs=4, rcur=0
        rwd,0 (1ULL << 37) | 15, %lsr
        disp %ctpr1, 0f
    }
    {
        getfd,0 %r0, (32 << 6), %g16
        disp %ctpr2, 1f
    }
    {
        ord,0 %g16, (1ULL << 37), %g16
        return %ctpr3
        nop 2
    }
0:
    {
        loop_mode
        alc alcf=1, alct=1
        abn abnf=1, abnt=1
        CLEAR,0 0, 0, %b[0]
        CLEAR,1 0, 0, %b[1]
        CLEAR,3 0, 0, %b[30]
        CLEAR,4 0, 0, %b[31]
        ct %ctpr1 ? #NOT_LOOP_END
    }
    {
        rwd,0 %g16, %lsr
        nop 3 // NOTE: low delay may lead to undefined behaviour
    }
1:
    {
        loop_mode
        alc alcf=1, alct=1
        abn abnf=1, abnt=1
        \op,0 %b[0],  %b[0],  %b[0],  %b[20]
        \op,1 %b[20], %b[20], %b[20], %b[40]
        \op,3 %b[1],  %b[1],  %b[1],  %b[21]
        \op,4 %b[21], %b[21], %b[21], %b[41]
#if __iset__ >= 4
        \op,2 %b[40], %b[40], %b[40], %b[0]
        \op,5 %b[41], %b[41], %b[41], %b[1]
#endif
        ct %ctpr2 ? #NOT_LOOP_END
    }
    {
        ct %ctpr3
    }
    .size \name, . - \name
.endm

    .text

    impl_bench pfmul_adds, pfmul_adds
    impl_bench fmul_addd, fmul_addd

#if __iset__ >= 5
    impl_bench qpfmul_adds, qpfmul_adds
    impl_bench qpfmul_addd, qpfmul_addd
#endif

#if __iset__ >= 6
    impl_bench qpfmas, qpfmas
    impl_bench qpfmad, qpfmad
#endif
