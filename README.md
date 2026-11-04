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
|SIMD|AVX_VNNI_INT8|Vector|int8|From Intel Lunar Lake|
|SIMD|AVX_VNNI_INT16|Vector|int16|From Intel Lunar Lake|
|DSA|AMX_INT8|Matrix|int8|From Intel Sapphire Rapids|
|DSA|AMX_BF16|Matrix|bf16|From Intel Sapphire Rapids|
|DSA|AMX_FP16|Matrix|fp16|From Intel Granite Rapids|

## Support arm64 SIMD and matrix ISA

|Arch|ISA|Feature|Data Type|Description|
| ------------ | ------------ | ------------ | ------------ | ------------ |
|SIMD|asimd|Vector|fp32/fp64|From Cortex-A57/A53|
|SIMD|asimd_hp|Vector|fp16|From Cortex-A75/A55|
|SIMD|asimd_dp|Vector|int8|From Cortex-A75/A55|
|SIMD|bf16|Matrix|bf16|From Cortex-X2/A710/A510|
|SIMD|i8mm|Matrix|int8|From Cortex-X2/A710/A510|
|SIMD|SVE (SVE1)|Scalable vector|fp16/fp32/fp64, int8|FMLA, SDOT, UDOT|
|SIMD|SVE2|Scalable vector|int8/int16/int32|SMLALB and SMLALT, widening accumulation|
|Matrix|SME (SME1)|ZA outer product|fp32, fp16/bf16 to fp32, int8 to int32|FMOPA, BFMOPA, SMOPA, UMOPA|
|Matrix|SME2|ZA multi-vector (VGx4)|fp32, fp16/bf16 to fp32, int8 to int32|FMLA, FDOT, BFDOT, SDOT, UDOT|


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

<table>
<tr>
<td>Arch</td>
<td>Benchmark</td>
</tr>
<tr>
<td rowspan="13">x86-64</td>
<td><a href="benchmark_result/x64/AMD_Ryzen7_9700X.md">AMD Ryzen7 9700X</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/AMD_Ryzen7_8845HS.md">AMD Ryzen7 8845HS</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/AMD_Ryzen9_6900HX.md">AMD Ryzen9 6900HX</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/AMD_Ryzen7_5825U.md">AMD Ryzen7 5825U</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Xeon_Gold_6455B.md">Intel Xeon Gold 6455B</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Xeon_W9_3495X.md">Intel Xeon W9-3495X</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Ultra7_255H.md">Intel Ultra7 255H</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Core_i5_1340P.md">Intel Core i5-1340P</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Core_i5_1135G7.md">Intel Core i5-1135G7</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Core_i7_8809G.md">Intel Core i7-8809G</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_Core_i3_8121U.md">Intel Core i3-8121U</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/Intel_N150.md">Intel N150</a></td>
</tr>
<tr>
<td><a href="benchmark_result/x64/ZHAOXIN_KX_6640MA.md">ZHAOXIN KX-6640MA</a></td>
</tr>
<tr>
<td rowspan="14">arm64</td>
<td><a href="benchmark_result/arm64/Apple_Silicon_M4.md">Apple Silicon M4 (SME/SME2)</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Apple_Silicon_M4_Max.md">Apple Silicon M4 Max</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Apple_Silicon_M2_Max.md">Apple Silicon M2 Max</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Qualcomm_Snapdragon_8_Gen5.md">Qualcomm Snapdragon 8 Gen5</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Qualcomm_Snapdragon_X_Elite_X1E80100.md">Qualcomm Snapdragon X Elite X1E80100</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/AWS_Graviton_3E.md">AWS Graviton 3E</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Broadcom_BCM2712.md">Broadcom BCM2712</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Broadcom_BCM2711.md">Broadcom BCM2711</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/CIX_P1_CD8180.md">CIX P1 CD8180</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/HUAWEI_Kunpeng_920_7260.md">HUAWEI Kunpeng 920 7260</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/HUAWEI_Kunpeng_D920_2249K.md">HUAWEI Kunpeng D920 2249K</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/Phytium_D2000.md">Phytium D2000/8</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/RockChip_RK3588.md">RockChip RK3588</a></td>
</tr>
<tr>
<td><a href="benchmark_result/arm64/RockChip_RK3399.md">RockChip RK3399</a></td>
</tr>
<tr>
<td rowspan="3">riscv64</td>
<td><a href="benchmark_result/riscv64/SpacemiT_K3.md">SpacemiT K3</a></td>
</tr>
<tr>
<td><a href="benchmark_result/riscv64/SpacemiT_K1.md">SpacemiT K1</a></td>
</tr>
<tr>
<td><a href="benchmark_result/riscv64/Kendryte_K230.md">Kendryte K230</a></td>
</tr>
<tr>
<td rowspan="3">loongarch64</td>
<td><a href="benchmark_result/loongarch64/Loongson_3A6000.md">Loongson 3A6000</a></td>
</tr>
<tr>
<td><a href="benchmark_result/loongarch64/Loongson_3C5000.md">Loongson 3C5000</a></td>
</tr>
<tr>
<td><a href="benchmark_result/loongarch64/Loongson_3A5000M.md">Loongson 3A5000M</a></td>
</tr>
<tr>
<td rowspan="3">e2k</td>
<td><a href="benchmark_result/e2k/Elbrus_8C2.md">Elbrus 8C2</a></td>
</tr>
<tr>
<td><a href="benchmark_result/e2k/Elbrus_8C.md">Elbrus 8C</a></td>
</tr>
<tr>
<td><a href="benchmark_result/e2k/Elbrus_4C.md">Elbrus 4C</a></td>
</tr>
</table>

## Todo list

Extend coverage of optional Arm extensions (for example SME FP64, INT16-to-INT64 and non-widening FP16/BF16).

## Arm scalable benchmarks

Build natively with `./build_arm64.sh`. `CC` and `CXX` select the C/C++ compilers.
SVE/SVE2 require a supporting assembler; SME/SME2 additionally require
`<arm_sme.h>` and ACLE `__arm_locally_streaming` / `__arm_new("za")` support.
Verified with Apple Clang 21 and upstream Clang 20. A compiler that cannot build
one of the new extensions reports a warning and saves its diagnostic in
`build_dir/_<ISA>_.log`; other supported tests remain available.

On Linux, the compiler runtime must also provide the SME ABI helpers. With
Clang and an older libgcc, the build retries with the matching AArch64
compiler-rt. Install that runtime if the retry reports missing libraries.
It can also be selected explicitly with
`LDFLAGS="--rtlib=compiler-rt --unwindlib=libgcc" CC=clang CXX=clang++ ./build_arm64.sh`.
An explicit runtime archive can instead be supplied through `LDLIBS`.
Do not substitute dummy SME ABI functions: they preserve live caller state.

```sh
./build_arm64.sh
./cpufp --list
./cpufp --thread_pool='[0]' --isa=sme,sme2
./cpufp --thread_pool='[0-3]' --isa=sve,sve2 --iterations=16777216
./tests/test_arm64.sh
python3 tests/test_features.py
```

The Arm executable accepts `--isa=` (comma-separated names), `--list`, and
`--iterations=N`, in addition to the existing thread-pool and idle-time options.
`sve1` and `sme1` are accepted aliases for `sve` and `sme`.
`--iterations` sets the loop count per worker; each new loop executes 24
arithmetic instructions. Short runs are useful for smoke tests, but include
thread dispatch and mode-transition overhead and should not be used as peak
performance results.

Both build-time selection and runtime dispatch check OS-advertised capabilities:
Linux uses `AT_HWCAP` / `AT_HWCAP2`, and macOS uses `sysctlbyname`. Optional
Linux SME arithmetic types are gated separately. Unsupported tests are never
called. Build-time feature detection is native by default; advanced cross builds
can set `CPUFP_ARM_ISAS` to a space-separated list such as
`"_ASIMD_ _SVE_ _SVE2_ _SME_ _SME2_"`. Include `_SVE_` with `_SVE2_` and `_SME_`
with `_SME2_`. This selects objects to compile and does **not** override runtime
CPU/OS detection.

SVE uses the non-streaming vector length (VL). SME/SME2 use the independent
streaming vector length (SVL). `--list` shows the main thread's VL/SVL and the
operation count per loop. Timed execution obtains VL/SVL in each worker and
sums its actual operations; no 128/512-bit width is assumed. Multiply plus add
counts as two FLOPs/OPS. For a vector with `L` accumulator lanes:

| Test | Operations per arithmetic instruction |
| --- | --- |
| SVE FMLA / SVE2 SMLALB/SMLALT | `2 * L` |
| SVE INT8 SDOT/UDOT | `2 * 4 * L` |
| SME FP32 outer product | `2 * L * L` |
| SME FP16/BF16 outer product | `2 * 2 * L * L` |
| SME INT8 outer product | `2 * 4 * L * L` |
| SME2 FP32 VGx4 FMLA | `2 * 4 * L` |
| SME2 FP16/BF16 VGx4 dot product | `2 * 2 * 4 * L` |
| SME2 INT8 VGx4 dot product | `2 * 4 * 4 * L` |

These measure register arithmetic throughput, with no matrix packing or data
loads in the inner loop. SME2 rows execute SME2-specific multi-vector
instructions, rather than reusing the SME1 outer-product loop. They measure
different instruction families and are not interchangeable GEMM baselines.

On Apple Silicon, SME support does **not** imply ordinary SVE/SVE2 support.
Apple M4 runs the SME/SME2 rows and skips non-streaming SVE/SVE2. macOS does not
provide Linux-style CPU affinity: the thread-pool list selects the number of
workers and labels them, while user-interactive QoS requests fast scheduling.
The OS chooses their actual cores. Multiple threads can share SME hardware;
throughput is measured for the whole worker pool, not multiplied from a
single-thread result.

The numerical test covers zero/one/three iterations, all stored accumulator
lanes, output guards, the no-store benchmark path, and a newly created worker.
SME tests also check SM/ZA return state and preservation of a live caller ZA
matrix. On Linux, `CPUFP_TEST_VL_BYTES` / `CPUFP_TEST_SVL_BYTES` optionally change
the test thread's VL/SVL through `prctl`; they do not change benchmark defaults.
`CPUFP_RUNNER` can prefix the test executable with QEMU for functional checks.
Emulator timings are not hardware performance measurements.

Architecture and ABI references:
[Arm ACLE](https://arm-software.github.io/acle/main/acle.html),
[Linux SME userspace support](https://www.kernel.org/doc/html/latest/arch/arm64/sme.html),
[Apple XNU SME state management](https://github.com/apple-oss-distributions/xnu/blob/main/doc/arm/sme.md).
