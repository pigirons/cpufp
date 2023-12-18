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

## Support arm64 SIMD ISA

|ISA|Data Type|Description|
| ------------ | ------------ | ------------ |
|asimd|fp32/fp64|From Cortex-A57/A53|
|asimd_hp|fp16|From Cortex-A75/A55|
|asimd_dp|int8|From Cortex-A75/A55|
|bf16|bf16|From Cortex-X2/A710/A510|
|i8mm|int8|From Cortex-X2/A710/A510|

## Some x86-64 CPU benchmark results

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

