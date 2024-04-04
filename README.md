# cpufp

This is a cpu tool for benchmarking the floating-points peak performance. Now it supports linux and x86-64 platform. It can automatically sense the local SIMD ISAs while compiling.

## How to use

build x64 version:

`./build_x64.sh`

build arm64 version:

`./build_arm64.sh`

benchmark:

`./cpufp --thread_pool=[xxx] --idle_time=yyy`

clean:

`./clean.sh`

xxx indicates that all the cores defined by xxx will be used for benchmarking(by affinity setting). For example, [0,3,5-8,13-15].

idle_time is the interval time(sec) between two benchmarks, default 0.

## Support x86-64 SIMD ISA

|ISA|Data Type|Description|
| ------------ | ------------ | ------------ |
|SSE|fp32|Before Sandy Bridge|
|SSE2|fp64|Before Sandy Bridge|
|AVX|fp32/fp64|From Sandy Bridge|
|FMA|fp32/fp64|From Haswell/Zen|
|AVX512f|fp32/fp64|From Skylake X/Zen4|
|AVX512_VNNI|int8/int16|From IceLake|
|AVX_VNNI|int8/int16|From Alder Lake|
|AVX512_FP16|fp16|From Intel Sapphire Rapids|
|AVX512_BF16|bf16|From AMD Zen4|
|AVX_VNNI_INT8|int8|Unknown|
|AMX_INT8|int8|From Intel Sapphire Rapids|
|AMX_BF16|bf16|From Intel Sapphire Rapids|

## Support arm64 SIMD ISA

|ISA|Data Type|Description|
| ------------ | ------------ | ------------ |
|asimd|fp32/fp64|From Cortex-A57/A53|
|asimd_hp|fp16|From Cortex-A75/A55|
|asimd_dp|int8|From Cortex-A75/A55|
|bf16|bf16|From Cortex-X2/A710/A510|
|i8mm|int8|From Cortex-X2/A710/A510|

## Some x86-64 CPU benchmark results

### Intel Xeon Gold 6455B(2 x 32 x Sapphire Rapids)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AMX_INT8        | MM(s32,s8,s8)         | 6.3726 Tops      |
| AMX_INT8        | MM(s32,s8,u8)         | 7.5746 Tops      |
| AMX_INT8        | MM(s32,u8,s8)         | 7.5733 Tops      |
| AMX_INT8        | MM(s32,u8,u8)         | 7.5718 Tops      |
| AMX_BF16        | MM(f32,bf16,bf16)     | 3.7868 Tflops    |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 998.07 Gops      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 499.07 Gops      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 498.96 Gops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 249.47 Gops      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 115.16 Gflops    |
| AVX512_FP16     | FMA(f16,f16,f16)      | 499.08 Gflops    |
| AVX512F         | FMA(f32,f32,f32)      | 230.28 Gflops    |
| AVX512F         | FMA(f64,f64,f64)      | 115.17 Gflops    |
| FMA             | FMA(f32,f32,f32)      | 118.35 Gflops    |
| FMA             | FMA(f64,f64,f64)      | 62.385 Gflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 91.59 Gflops     |
| AVX             | ADD(MUL(f64,f64),f64) | 45.85 Gflops     |
| SSE             | ADD(MUL(f32,f32),f32) | 46.493 Gflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 23.235 Gflops    |
--------------------------------------------------------------
</pre>

For multi-cores:

<pre>
$ ./cpufp --thread_pool=[0-63]
Number Threads: 64
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AMX_INT8        | MM(s32,s8,s8)         | 390.67 Tops      |
| AMX_INT8        | MM(s32,s8,u8)         | 380.93 Tops      |
| AMX_INT8        | MM(s32,u8,s8)         | 391.32 Tops      |
| AMX_INT8        | MM(s32,u8,u8)         | 380.28 Tops      |
| AMX_BF16        | MM(f32,bf16,bf16)     | 192.47 Tflops    |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 48.114 Tops      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 24.169 Tops      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 30.818 Tops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 15.74 Tops       |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 7.09 Tflops      |
| AVX512_FP16     | FMA(f16,f16,f16)      | 31.473 Tflops    |
| AVX512F         | FMA(f32,f32,f32)      | 14.329 Tflops    |
| AVX512F         | FMA(f64,f64,f64)      | 6.5406 Tflops    |
| FMA             | FMA(f32,f32,f32)      | 7.4039 Tflops    |
| FMA             | FMA(f64,f64,f64)      | 3.9067 Tflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 5.4087 Tflops    |
| AVX             | ADD(MUL(f64,f64),f64) | 2.7339 Tflops    |
| SSE             | ADD(MUL(f32,f32),f32) | 2.9077 Tflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 1.4791 Tflops    |
--------------------------------------------------------------
</pre>

### AMD Ryzen7 8845HS(8 x Zen4)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 647.97 GOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 324.27 GOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 324.92 GFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 163.58 GFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 81.786 GFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 163.57 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 81.785 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 157.36 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 79.045 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 80.34 GFLOPS     |
| SSE2            | ADD(MUL(f64,f64),f64) | 40.371 GFLOPS    |
--------------------------------------------------------------
</pre>

For multi-cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 5113.8 GOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 2559.1 GOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 2551.6 GFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 1283.6 GFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 641.21 GFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 1271.7 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 632.3 GFLOPS     |
| AVX             | ADD(MUL(f32,f32),f32) | 1193.6 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 590.85 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 613.54 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 307.67 GFLOPS    |
--------------------------------------------------------------
</pre>

### AMD Ryzen9 6900HX(8 x Zen3+)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| FMA             | FMA(f32,f32,f32)      | 151.84 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 75.702 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 150.86 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 75.476 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 75.452 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 37.737 GFLOPS    |
--------------------------------------------------------------
</pre>

For multi-cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6,8,10,12,14]
Number Threads: 8
Thread Pool Binding: 0 2 4 6 8 10 12 14
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| FMA             | FMA(f32,f32,f32)      | 1057.8 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 534.37 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 1037.6 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 516.21 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 518.32 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 258.92 GFLOPS    |
--------------------------------------------------------------
</pre>

### Intel N100(4 x Alder Lake-N)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 108.51 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 54.244 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 54.247 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 27.128 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 27.128 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 13.564 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 27.126 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 13.563 GFLOPS    |
--------------------------------------------------------------
</pre>

For multi_cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 369.66 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 185.09 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 185.08 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 92.55 GFLOPS     |
| AVX             | ADD(MUL(f32,f32),f32) | 92.546 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 46.269 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 92.546 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 46.27 GFLOPS     |
--------------------------------------------------------------
</pre>

## Some arm64 CPU benchmark results

### RaspBerry Pi4(4 x Cortex-A72)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 11.958 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 11.958 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 5.9792 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 5.9792 GFLOPS    |
-------------------------------------------------------------
</pre>

For multi_cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 47.883 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 47.88 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64) | 23.933 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 23.943 GFLOPS    |
-------------------------------------------------------------
</pre>

### RaspBerry Pi5(4 x Cortex-A76)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 153.48 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 153.48 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 153.47 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 153.48 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 76.738 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 76.738 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 38.369 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 38.369 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 19.185 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 19.185 GFLOPS    |
----------------------------------------------------------------
</pre>

For multi_cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 613.79 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 614.02 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 613.98 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 613.99 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 306.88 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 306.98 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 153.48 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 153.5 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 74.513 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 76.751 GFLOPS    |
----------------------------------------------------------------
</pre>

### Rockchip RK3588(4 x Cortex-A76 + 4 x Cortex-A55)

For single core(Cortex-A55):

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 58.305 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 58.311 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 58.313 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 58.311 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 29.156 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 29.156 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 14.579 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 14.577 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 7.2891 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 7.2834 GFLOPS    |
----------------------------------------------------------------
</pre>

For multi_cores(Cortex-A55):

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 232.58 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 232.46 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 232.59 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 232.54 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 116.29 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 116.28 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 58.145 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 58.14 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 29.072 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 29.07 GFLOPS     |
----------------------------------------------------------------
</pre>

For single core(Cortex-A76):

<pre>
$ ./cpufp --thread_pool=[4]
Number Threads: 1
Thread Pool Binding: 4
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 151.74 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 151.75 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 151.75 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 151.74 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 75.862 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 75.862 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 37.927 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 37.925 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 18.961 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 18.961 GFLOPS    |
----------------------------------------------------------------
</pre>

For multi_cores(Cortex-A76):

<pre>
$ ./cpufp --thread_pool=[4-7]
Number Threads: 4
Thread Pool Binding: 4 5 6 7
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 599.34 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 600.34 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 600.04 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 598.17 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 298.94 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 298.91 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 150 GFLOPS       |
| asimd           | fmla.vv(f32,f32,f32)    | 150.08 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 75.046 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 75.034 GFLOPS    |
----------------------------------------------------------------
</pre>


### Phytium,D2000/8

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 18.376 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 18.375 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 9.1877 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 9.1891 GFLOPS    |
-------------------------------------------------------------
</pre>

For multi_cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 73.51 GFLOPS     |
| asimd           | fmla.vv(f32,f32,f32) | 73.51 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64) | 36.755 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 36.747 GFLOPS    |
-------------------------------------------------------------
</pre>

