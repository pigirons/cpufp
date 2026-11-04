# Apple M4 (Mac mini), SME/SME2 — 2026-11-04

macOS 26.5.1, Apple Clang 21.0.0, 32 GiB RAM, 4 performance + 6 efficiency
cores. Streaming vector length: 512 bits. Ordinary SVE/SVE2 are unavailable.
One warmup followed by one timed run of 16,777,216 loops per worker, with
24 arithmetic instructions per loop. These are instruction-throughput results,
not GEMM application benchmarks. The machine was not reserved exclusively.

```sh
./build_arm64.sh
./cpufp --thread_pool='[0]' --isa=sme,sme2 --iterations=16777216
./cpufp --thread_pool='[0-3]' --isa=sme,sme2 --iterations=16777216
```

macOS schedules the workers using user-interactive QoS; the labels are not
physical CPU affinity. Each column is measured aggregate throughput. Shared SME
resources mean that four workers need not outperform one.

| Instruction | Input → accumulator | 1 worker | 4 workers |
| --- | --- | --- | --- |
| SME fmopa | f32 → f32 | 2.0114 TFLOPS | 1.9832 TFLOPS |
| SME fmopa | f16 → f32 | 2.013 TFLOPS | 1.9836 TFLOPS |
| SME bfmopa | bf16 → f32 | 2.012 TFLOPS | 1.9836 TFLOPS |
| SME smopa | s8 → s32 | 4.0253 TOPS | 3.9673 TOPS |
| SME umopa | u8 → u32 | 4.0274 TOPS | 3.968 TOPS |
| SME2 fmla.vg4 | f32 → f32 | 251.69 GFLOPS | 247.93 GFLOPS |
| SME2 fdot.vg4 | f16 → f32 | 503.35 GFLOPS | 495.88 GFLOPS |
| SME2 bfdot.vg4 | bf16 → f32 | 503.29 GFLOPS | 495.85 GFLOPS |
| SME2 sdot.vg4 | s8 → s32 | 1.0061 TOPS | 997.16 GOPS |
| SME2 udot.vg4 | u8 → u32 | 1.0072 TOPS | 994.73 GOPS |

Functional validation: all 10 SME/SME2 cases passed numerical output checks,
output guards, zero/one/three iterations, the no-store path, SM/ZA return state,
and preservation of a live caller ZA matrix, on both the main and a new thread.
A build containing all four new ISAs safely skipped the 11 unsupported
non-streaming SVE/SVE2 cases (20 passes, 22 skips, zero failures).

Linux Clang 20 cross-build and QEMU 8.2.2 checks passed SVE/SVE2 with actual
VL values 128/384/512/2048 bits, and SME1 with SVL 128/256 bits. SME2 is not
implemented by this emulator and was skipped; SME2 execution was validated on
M4 hardware. Cortex-A57 and a model with SVE/SME disabled safely skipped all
21 new tests. Linux capability-bank and old-header regression tests passed.
Emulator throughput is deliberately not reported.
