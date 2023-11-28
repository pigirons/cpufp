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
|SSE|fp32/fp64|Before Sandy Bridge|
|AVX|fp32/fp64|From Sandy Bridge|
|FMA|fp32/fp64|From Haswell/Zen|
|AVX512f|fp32/fp64|From Skylake X/Zen4|
|AVX512_VNNI|int8/int16|From IceLake|
|AVX_VNNI|int8/int16|From Alder Lake|
|AVX512_FP16|fp16|From Intel Sapphire Rapids|
|AVX512_BF16|bf16|From AMD Zen4|
|AVX_VNNI_INT8|int8|Unknown|

## Some benchmark results

### Intel Alder Lake i7-1280p

For single Golden Cove(big) core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------
| Instruction Set | Data Type | Peak Performance |
| AVX_VNNI        | INT8      | 590.31 GOPS      |
| AVX_VNNI        | INT16     | 295.06 GOPS      |
| FMA             | FP32      | 149.87 GFLOPS    |
| FMA             | FP64      | 74.931 GFLOPS    |
| AVX             | FP32      | 112.39 GFLOPS    |
| AVX             | FP64      | 56.203 GFLOPS    |
| SSE             | FP32      | 56.054 GFLOPS    |
| SSE             | FP64      | 28.001 GFLOPS    |
--------------------------------------------------
</pre>

For multiple big cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6,8,10]
Number Threads: 6
Thread Pool Binding: 0 2 4 6 8 10
--------------------------------------------------
| Instruction Set | Data Type | Peak Performance |
| AVX_VNNI        | INT8      | 2636.8 GOPS      |
| AVX_VNNI        | INT16     | 1319.1 GOPS      |
| FMA             | FP32      | 670.05 GFLOPS    |
| FMA             | FP64      | 335 GFLOPS       |
| AVX             | FP32      | 502.4 GFLOPS     |
| AVX             | FP64      | 251.2 GFLOPS     |
| SSE             | FP32      | 250.42 GFLOPS    |
| SSE             | FP64      | 125.16 GFLOPS    |
--------------------------------------------------
</pre>

For single Gracemont(little) core:

<pre>
$ ./cpufp --thread_pool=[12]
Number Threads: 1
Thread Pool Binding: 12
--------------------------------------------------
| Instruction Set | Data Type | Peak Performance |
| AVX_VNNI        | INT8      | 114.89 GOPS      |
| AVX_VNNI        | INT16     | 57.445 GOPS      |
| FMA             | FP32      | 57.444 GFLOPS    |
| FMA             | FP64      | 28.723 GFLOPS    |
| AVX             | FP32      | 28.723 GFLOPS    |
| AVX             | FP64      | 14.362 GFLOPS    |
| SSE             | FP32      | 28.312 GFLOPS    |
| SSE             | FP64      | 14.361 GFLOPS    |
--------------------------------------------------
</pre>

For multiple little cores:

<pre>
$ ./cpufp --thread_pool=[12-19]
Number Threads: 8
Thread Pool Binding: 12 13 14 15 16 17 18 19
--------------------------------------------------
| Instruction Set | Data Type | Peak Performance |
| AVX_VNNI        | INT8      | 867.99 GOPS      |
| AVX_VNNI        | INT16     | 434 GOPS         |
| FMA             | FP32      | 434 GFLOPS       |
| FMA             | FP64      | 217 GFLOPS       |
| AVX             | FP32      | 217.01 GFLOPS    |
| AVX             | FP64      | 108.5 GFLOPS     |
| SSE             | FP32      | 216.39 GFLOPS    |
| SSE             | FP64      | 108.5 GFLOPS     |
--------------------------------------------------
</pre>

### AMD Ryzen9 6900HX(Zen3+)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| FMA             | FMA(f32,f32,f32)      | 150.94 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 75.77 GFLOPS     |
| AVX             | ADD(MUL(f32,f32),f32) | 149.89 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 74.982 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 75.378 GFLOPS    |
| SSE             | ADD(MUL(f64,f64),f64) | 37.608 GFLOPS    |
--------------------------------------------------------------
</pre>

For multi-cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6,8,10,12,14]
Number Threads: 8
Thread Pool Binding: 0 2 4 6 8 10 12 14
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| FMA             | FMA(f32,f32,f32)      | 1054.6 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 525.72 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 1014.6 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 506.08 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 519.33 GFLOPS    |
| SSE             | ADD(MUL(f64,f64),f64) | 254.33 GFLOPS    |
--------------------------------------------------------------
</pre>

### Intel Celeron N5105(Jasper Lake)

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------
| Instruction Set | Data Type | Peak Performance |
| SSE             | FP32      | 23.102 GFLOPS    |
| SSE             | FP64      | 11.564 GFLOPS    |
--------------------------------------------------
</pre>

For multi_cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
--------------------------------------------------
| Instruction Set | Data Type | Peak Performance |
| SSE             | FP32      | 89.327 GFLOPS    |
| SSE             | FP64      | 44.664 GFLOPS    |
--------------------------------------------------
</pre>

Welcome for bug reporting.
