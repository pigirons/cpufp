# arm64 CPU benchmark results

## AWS Graviton 3E

Architecture: Neoverse V1

Setting: Virtual 1 Core

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 332.34 GGOPS     |
| i8mm            | mmla(u32,u8,u8)         | 332.46 GGOPS     |
| i8mm            | mmla(s32,u8,s8)         | 332.46 GGOPS     |
| i8mm            | dp4a.vs(s32,s8,u8)      | 166.23 GGOPS     |
| i8mm            | dp4a.vs(s32,u8,s8)      | 166.17 GGOPS     |
| i8mm            | dp4a.vv(s32,u8,s8)      | 166.14 GGOPS     |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 166.18 GGOPS     |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 166.22 GGOPS     |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 166.22 GGOPS     |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 166.22 GGOPS     |
| bf16            | mmla(f32,bf16,bf16)     | 166.18 GGFLOPS   |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 83.085 GGFLOPS   |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 83.111 GGFLOPS   |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 83.105 GGFLOPS   |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 83.113 GGFLOPS   |
| asimd           | fmla.vs(f32,f32,f32)    | 41.549 GGFLOPS   |
| asimd           | fmla.vv(f32,f32,f32)    | 41.542 GGFLOPS   |
| asimd           | fmla.vs(f64,f64,f64)    | 35.96 GGFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 20.779 GGFLOPS   |
----------------------------------------------------------------
</pre>

## Broadcom BCM2711(RaspBerry Pi 4)

Setting: 4 Cortex-A72 Cores

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

For 4 cores:

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

## Broadcom BCM2712(RaspBerry Pi 5)

Setting: 4 Cortex-A76 Cores

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

For 4 cores:

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

## RockChip RK3588

Setting: 4 Cortex-A76(big) Cores + 4 Cortex-A55(Little) Cores

For single Little core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 58.379 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 58.371 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 58.369 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 58.382 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 29.193 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 29.192 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 14.593 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 14.596 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 7.2971 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 7.2972 GFLOPS    |
----------------------------------------------------------------
</pre>

For 4 Little cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 233.08 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 233.05 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 233.06 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 233.05 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 116.54 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 116.51 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 58.261 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 58.258 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 29.13 GFLOPS     |
| asimd           | fmla.vv(f64,f64,f64)    | 29.126 GFLOPS    |
----------------------------------------------------------------
</pre>

For single big core:

<pre>
$ ./cpufp --thread_pool=[4]
Number Threads: 1
Thread Pool Binding: 4
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 152.1 GOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 152.1 GOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 152.06 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 152.08 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 76.022 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 76.027 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 38.012 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 38.008 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 19.004 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 19.004 GFLOPS    |
----------------------------------------------------------------
</pre>

For 4 big cores:

<pre>
$ ./cpufp --thread_pool=[4-7]
Number Threads: 4
Thread Pool Binding: 4 5 6 7
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 601.71 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 602.2 GOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 602.22 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 602.2 GOPS       |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 300.97 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 300.93 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 149.79 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 150.15 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 75.222 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 75.215 GFLOPS    |
----------------------------------------------------------------
</pre>

## Phytium D2000/8

Setting: 8 FTC663 Cores

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

For 4 cores:

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

