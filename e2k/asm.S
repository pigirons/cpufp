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

    // NOTE: `{,p,qp}fmul_add{s,d}` has latency 8 cycles thus we need at least
    // 8 registers for each channel.
    //
    // Example for ALC0:
    // I:   read (b0)   write (b20)
    // 0:   r8          r28     # use r28 as dst
    // 1:   r10         r30
    // 2:   r12         r32
    // 3:   r16         r34
    // 4:   r18         r36     # r28 is ready if fmuld (4)
    // 5:   r20         r38     # r28 is ready if fmad (5)
    // 6:   r22         r40
    // 7:   r24         r42
    // 8:   r26         r44     # r28 is ready if fmul_addd (8)
    // 9:   r28         r46     # read from r28 (+1 just in case)
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
        // NOTE: v1-v3 does not support fops in ALC2/ALC5
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

#if __iset__ >= 5
    impl_bench bench_qpfmul_adds, qpfmul_adds
    impl_bench bench_qpfmul_addd, qpfmul_addd
#endif

#if __iset__ >= 6
    impl_bench bench_qpfmas, qpfmas
    impl_bench bench_qpfmad, qpfmad
#endif

    impl_bench bench_pfmul_adds, pfmul_adds
    impl_bench bench_fmul_addd, fmul_addd
