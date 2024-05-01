# cpufp

This is a cpu tool for benchmarking the floating-points and AI peak performance.

It can automatically sense the local SIMD|DSA ISAs while compiling.

## Support OS and ISA

|OS|x86-64|arm64|riscv64|
| ------------ | ------------ | ------------ | ------------ |
|Linux|yes|yes|yes|
|MacOS|no|no|no|
|Windows|no|no|no|

## Support x86-64 SIMD|DSA ISA

|Arch|ISA|Feature|Data Type|Description|
| ------------ | ------------ | ------------ | ------------ | ------------ |
|SIMD|SSE|Vector|fp32|Before Sandy Bridge|
|SIMD|SSE2|Vector|fp64|Before Sandy Bridge|
|SIMD|AVX|Vector|fp32/fp64|From Sandy Bridge|
|SIMD|FMA|Vector|fp32/fp64|From Haswell/Zen|
|SIMD|AVX512f|Vector|fp32/fp64|From Skylake X/Zen4|
|SIMD|AVX512_VNNI|Vector|int8/int16|From IceLake|
|SIMD|AVX_VNNI|Vector|int8/int16|From Alder Lake|
|SIMD|AVX512_FP16|Vector|fp16|From Intel Sapphire Rapids|
|SIMD|AVX512_BF16|Vector|bf16|From AMD Zen4|
|SIMD|AVX_VNNI_INT8|Vector|int8|Unknown|
|DSA|AMX_INT8|Matrix|int8|From Intel Sapphire Rapids|
|DSA|AMX_BF16|Matrix|bf16|From Intel Sapphire Rapids|

## Support arm64 SIMD ISA

|Arch|ISA|Feature|Data Type|Description|
| ------------ | ------------ | ------------ | ------------ | ------------ |
|SIMD|asimd|Vector|fp32/fp64|From Cortex-A57/A53|
|SIMD|asimd_hp|Vector|fp16|From Cortex-A75/A55|
|SIMD|asimd_dp|Vector|int8|From Cortex-A75/A55|
|SIMD|bf16|Matrix|bf16|From Cortex-X2/A710/A510|
|SIMD|i8mm|Matrix|int8|From Cortex-X2/A710/A510|

## Support riscv64 VECTOR ISA

|Arch|ISA|Feature|Data Type|Description|
| ------------ | ------------ | ------------ | ------------ | ------------ |
|Vector|vector|Vector|fp16/fp32/fp64|From RISC-V "V" vector extension. Version 1.0|
|DSA|ime|Matrix|int8|From SpacemiT-X60|

## How to build

build x64 version:

`./build_x64.sh`

build arm64 version:

`./build_arm64.sh`

build riscv64 version:

`./build_riscv64.sh`

clean:

`./clean.sh`

## How to benchmark

`./cpufp --thread_pool=[xxx] --idle_time=yyy`

  --thread_pool: [xxx] is the list of cpu thread to benchmarking, from setting affinities. Please reference the result of lstopo command. For example, [0,3,5-8,13-15].

  --idle_time: the interval time(sec) between any two adjacent benchmarks, default is 0.

## Benchmark results

[x86-64 cpufp benchmark results](benchmark_result/x64.md)

[arm64 cpufp benchmark results](benchmark_result/arm64.md)

[riscv64 cpufp benchmark results](benchmark_result/riscv64.md)

## Todo list

[1] For arm64, add armv9(SVE, SVE2 & SME) Supports

[2] Add LoongArch64 Support.

