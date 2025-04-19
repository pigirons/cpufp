# Apple M2 Max (Macbook Pro 16)

Setting: 8 Avalanche P-Cores + 4 Blizzard E-Cores

OS: MacOS 15.1

For 1 P-core:

<pre>
> ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 347.22 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 353.72 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 361.84 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 426.77 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 418.49 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 436.31 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 425.79 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 420.44 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 430.16 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 425.55 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 51.959 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 53.449 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 53.995 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 215.06 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 210.01 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 105.54 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 107.27 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 54.109 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 51.883 GFLOPS    |
----------------------------------------------------------------
</pre>

For 8 P-cores:

<pre>
> ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 2.5416 TOPS      |
| i8mm            | mmla(u32,u8,u8)         | 2.2677 TOPS      |
| i8mm            | mmla(s32,u8,s8)         | 2.6085 TOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 3.0364 TOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 3.0657 TOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 3.1035 TOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 2.9913 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 3.0582 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 2.9646 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 2.3463 TOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 384.6 GFLOPS     |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 375.38 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 369.55 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 1.5043 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 1.5192 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 763 GFLOPS       |
| asimd           | fmla.vv(f32,f32,f32)    | 765.33 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 377.3 GFLOPS     |
| asimd           | fmla.vv(f64,f64,f64)    | 377.05 GFLOPS    |
----------------------------------------------------------------
</pre>

For 1 E-core:

<pre>
> taskpolicy -c background ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 101.41 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 97.71 GOPS       |
| i8mm            | mmla(s32,u8,s8)         | 100.49 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 101.54 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 96.847 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 98.375 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 102.21 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 95.13 GOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 98.558 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 102.73 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 12.526 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 11.987 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 11.877 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 50.557 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 51.691 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 23.584 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 23.78 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 12.689 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 12.744 GFLOPS    |
----------------------------------------------------------------
</pre>

For 4 E-cores (OS is running and therefore using some of them):

<pre>
> taskpolicy -c background ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 292.61 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 278.35 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 288.3 GOPS       |
| i8mm            | dp4a.vs(s32,s8,u8)      | 315.5 GOPS       |
| i8mm            | dp4a.vs(s32,u8,s8)      | 312.98 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 245.39 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 205.68 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 267.14 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 320.75 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 279.87 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 37.858 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 36.48 GFLOPS     |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 35.658 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 145.14 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 140.57 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 74.868 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 78.191 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 40.488 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 36.496 GFLOPS    |
----------------------------------------------------------------
</pre>

For 8 P-cores and 4 E-cores:

<pre>
> ./cpufp --thread_pool=[0-11]
Number Threads: 12
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 2.3888 TOPS      |
| i8mm            | mmla(u32,u8,u8)         | 2.4141 TOPS      |
| i8mm            | mmla(s32,u8,s8)         | 2.2572 TOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 2.7256 TOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 2.4714 TOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 2.6389 TOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 2.7067 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 2.626 TOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 2.7011 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 2.6723 TOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 345.83 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 341.14 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 340.41 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 1.3411 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 1.2838 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 645.88 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 668.01 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 339.89 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 337.88 GFLOPS    |
----------------------------------------------------------------
</pre>
