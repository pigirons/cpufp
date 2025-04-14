# cpufp

This is a cpu tool for benchmarking the peak performance of floating-points and AI ISAs.

It can automatically sense the local SIMD|DSA ISAs while compiling.

## Support OS and ISA

| Arch          |Linux| MacOS| Windows|
|:--------------|:---:|:----:|:------:|
| arm64         | yes |  yes |   no   |
| e2k           | yes |  no  |   no   |
| loongarch64   | yes |  no  |   no   |
| riscv64       | yes |  no  |   no   |
| x86-64        | yes |  no  |   no   |

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
|SIMD|V|Vector|fp16/fp32/fp64|From RISC-V "V" vector extension. Version 1.0|
|DSA|ime|Matrix|int8|From SpacemiT-X60|

NOTE: ime is a SpacemiT custom vendor extension.

## Support loongarch64 ISA
|Arch|ISA|Feature|Data Type|Description|
| ------------ | ------------ | ------------ | ------------ | ------------ |
|SIMD|LASX|Vector|fp32/fp64|From Loongson 3A5000|
|SIMD|LSX|Vector|fp32/fp64|From Loongson 3A5000|
|Scalar|FP|Scalar|fp32/fp64|From Loongson 3A5000|

## Support e2k ISA

| Arch |  ISA  |Feature| Vector Width | Data Type |Description
|:-----|:------|:-----:|:------------:|----------:|:----------
| SIMD | v6    | Vector|          128 | fp32/fp64 | FMA
| SIMD | v5    | Vector|          128 | fp32/fp64 | Combined operations
|Scalar| v1-v4 | Scalar|              |      fp64 | Combined operations
| SIMD | v1-v4 | Vector|           64 |      fp32 | Combined operations

### Combined operations

E2K has support for instructions that perform two independant operations.
It is like FMA, but with additional rounding as these operations is independant.

#### Example `fmul_addd`

```
fmul_addd src1, src2, src3, dst
```

##### Description

Multiply double-precision (64-bit) floating-point values from `src1` and `src2`,
and add the intermediate result to value from `src3`. Store the result in `dst`.

##### Operation

```
dst[63:0] := src3[63:0] + src1[63:0] * src2[63:0]
```

##### Latency and Throughput

| Architecture  | Latency | Throughput (CPI) | ALC
|:--------------|:-------:|:----------------:|:---:
| elbrus-v4     |    8    |       0.16       | `012345`
| elbrus-v1     |    8    |       0.25       | `01-34-`

* ALC (Arithmetic Logic Complex/Channel) is an execution port for RISC-like instructions

## How to build

build x64 version:

`./build_x64.sh`

build arm64 version:

`./build_arm64.sh`

build riscv64 version:

`./build_riscv64.sh`

build loongarch64 version:

`./build_loongarch64.sh`

build e2k version:

`./build_e2k.sh`

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

[loongarch64 cpufp benchmark results](benchmark_result/loongarch64.md)

[e2k cpufp benchmark results](benchmark_result/e2k.md)

## Todo list

Add armv9(SVE, SVE2 & SME) Supports.

