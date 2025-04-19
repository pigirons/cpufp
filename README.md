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

| x86-64 |
|:-------|
|[AMD Ryzen7 9700X](benchmark_result/x64/AMD_Ryzen7_9700X.md)|
|[AMD Ryzen7 8845HS](benchmark_result/x64/AMD_Ryzen7_8845HS.md)|
|[AMD Ryzen9 6900HX](benchmark_result/x64/AMD_Ryzen7_6900HX.md)|
|[Intel Xeon Gold 6455B](benchmark_result/x64/Intel_Xeon_Gold_6455B.md)|
|[Intel Xeon W9-3495X](benchmark_result/x64/Intel_Xeon_W9_3495X.md)|
|[Intel Core i5 1340P](benchmark_result/x64/Intel_Core_i5_1340P.md)|
|[Intel N100](benchmark_result/x64/Intel_N100.md)|

| arm64 |
|:------|
|[Apple Silicon M4 Max](benchmark_result/arm64/Apple_Silicon_M4_Max.md)|
|[Apple Silicon M2 Max](benchmark_result/arm64/Apple_Silicon_M2_Max.md)|
|[AWS Graviton 3E](benchmark_result/arm64/AWS_Graviton_3E.md)|
|[Broadcom BCM2712](benchmark_result/arm64/Broadcom_BCM2712.md)|
|[Broadcom BCM2711](benchmark_result/arm64/Broadcom_BCM2711.md)|
|[HUAWEI Kunpeng 920 7260](benchmark_result/arm64/HUAWEI_Kunpeng_920_7260.md)|
|[Phytium D2000/8](benchmark_result/arm64/Phytium_D2000.md)|
|[Qualcomm Snapdragon X Elite X1E80100](benchmark_result/arm64/Qualcomm_Snapdragon_X_Elite_X1E80100.md)|
|[RockChip RK3588](benchmark_result/arm64/RockChip_RK3588.md)|
|[RockChip RK3399](benchmark_result/arm64/RockChip_RK3399.md)|

| riscv64 |
|:--------|
|[SpacemiT K1](benchmark_result/riscv64/SpacemiT_K1.md)|
|[Kendryte K230](benchmark_result/riscv64/Kendryte_K230.md)|

| loongarch64 |
|:------------|
|[Loongson 3A6000](benchmark_result/loongarch64/Loongson_3A6000.md)|
|[Loongson 3C5000](benchmark_result/loongarch64/Loongson_3C5000.md)|
|[Loongson 3A5000M](benchmark_result/loongarch64/Loongson_3A5000M.md)|

| e2k |
|:------------|
|[Elbrus 8C2](benchmark_result/e2k/Elbrus_8C2.md)|
|[Elbrus 8C](benchmark_result/e2k/Elbrus_8C.md)|
|[Elbrus 4C](benchmark_result/e2k/Elbrus_4C.md)|

## Todo list

Add armv9(SVE, SVE2 & SME) Supports.
