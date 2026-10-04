# CIX P1 CD8180(Radxa Orion O6)

Settings:

BIOS: v1.3.1
OS: debian 13.7
Kernel: 6.12.111+deb13-arm64

Cortex-A720 @ 2.6GHz: 0,1
Cortex-A720 @ 2.5GHz: 10,11
Cortex-A720 @ 2.3GHz: 6,7
Cortex-A720 @ 2.2GHz: 8,9
Cortex-A520 @ 1.8GHz: 2-5

Power policy: Balance

For single P-Core @ 2.6GHz:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 332.47 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 332.54 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 332.47 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 166.24 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 165.72 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 166.23 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 166.22 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 166.24 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 166.25 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 166.26 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 166.25 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 83.132 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 83.118 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 83.126 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 83.125 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 41.563 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 41.563 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 20.781 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 20.783 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.6GHz:

<pre>
$ ./cpufp --thread_pool=[0,1]
Number Threads: 2
Thread Pool Binding: 0 1
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 664.89 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 664.81 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 664.88 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 332.46 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 332.46 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 332.46 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 332.48 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 332.44 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 332.47 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 332.46 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 332.45 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 166.24 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 166.22 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 166.23 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 166.22 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 83.118 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 83.109 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 41.55 GFLOPS     |
| asimd           | fmla.vv(f64,f64,f64)    | 41.561 GFLOPS    |
----------------------------------------------------------------
</pre>

For single P-Core @ 2.5GHz:

<pre>
$ ./cpufp --thread_pool=[10]
Number Threads: 1
Thread Pool Binding: 10
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 319.7 GOPS       |
| i8mm            | mmla(u32,u8,u8)         | 319.74 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 319.72 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 159.87 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 159.83 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 159.88 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 159.86 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 159.87 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 159.87 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 159.86 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 159.86 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 79.928 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 79.934 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 79.915 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 79.936 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 39.957 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 39.967 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 19.981 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 19.984 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.5GHz:

<pre>
$ ./cpufp --thread_pool=[10,11]
Number Threads: 2
Thread Pool Binding: 10 11
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 639.3 GOPS       |
| i8mm            | mmla(u32,u8,u8)         | 639.27 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 639.29 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 319.71 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 319.62 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 319.72 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 319.64 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 319.68 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 319.64 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 319.67 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 319.65 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 159.85 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 159.84 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 159.82 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 159.84 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 79.915 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 79.919 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 39.957 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 39.96 GFLOPS     |
----------------------------------------------------------------
</pre>

For single P-Core @ 2.3GHz:

<pre>
$ ./cpufp --thread_pool=[6]
Number Threads: 1
Thread Pool Binding: 6
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 294.07 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 294.1 GOPS       |
| i8mm            | mmla(s32,u8,s8)         | 294.16 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 147.07 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 147.04 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 147.06 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 147.08 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 147.06 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 147.05 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 147.07 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 147.05 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 73.525 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 73.524 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 73.534 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 73.533 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 36.763 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 36.757 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 18.384 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 18.384 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.3GHz:

<pre>
$ ./cpufp --thread_pool=[6,7]
Number Threads: 2
Thread Pool Binding: 6 7
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 588.12 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 588.01 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 588.23 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 294.11 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 294.1 GOPS       |
| i8mm            | dp4a.vv(s32,u8,s8)      | 294.04 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 294.1 GOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 294.09 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 294.06 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 294.08 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 294.11 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 147.05 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 147.02 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 147.03 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 147.05 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 73.523 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 73.51 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 36.76 GFLOPS     |
| asimd           | fmla.vv(f64,f64,f64)    | 36.761 GFLOPS    |
----------------------------------------------------------------
</pre>

For single P-Core @ 2.2GHz:

<pre>
$ ./cpufp --thread_pool=[8]
Number Threads: 1
Thread Pool Binding: 8
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 281.35 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 281.31 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 281.29 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 140.65 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 140.66 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 140.69 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 140.66 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 140.66 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 140.66 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 140.65 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 140.66 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 70.331 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 70.339 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 70.34 GFLOPS     |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 70.337 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 35.166 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 35.166 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 17.579 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 17.582 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.2GHz:

<pre>
$ ./cpufp --thread_pool=[8,9]
Number Threads: 2
Thread Pool Binding: 8 9
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 562.59 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 562.58 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 562.58 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 281.29 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 281.28 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 281.24 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 281.26 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 281.31 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 281.33 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 281.32 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 281.3 GFLOPS     |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 140.64 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 140.63 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 140.63 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 140.64 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 70.317 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 70.33 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 35.168 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 35.166 GFLOPS    |
----------------------------------------------------------------
</pre>

For single E-core @ 1.8GHz:

<pre>
$ ./cpufp --thread_pool=[2]
Number Threads: 1
Thread Pool Binding: 2
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 114.68 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 114.68 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 114.7 GOPS       |
| i8mm            | dp4a.vs(s32,s8,u8)      | 57.345 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 57.351 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 57.361 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 57.371 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 57.355 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 57.357 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 57.363 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 22.943 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 28.649 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 28.664 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 28.673 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 28.637 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 14.322 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 14.337 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 7.1707 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 7.1691 GFLOPS    |
----------------------------------------------------------------
</pre>

For 4 E-Cores @ 1.8GHz:

<pre>
$ ./cpufp --thread_pool=[2-5]
Number Threads: 4
Thread Pool Binding: 2 3 4 5
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 458.24 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 458.16 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 458.4 GOPS       |
| i8mm            | dp4a.vs(s32,s8,u8)      | 229.19 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 229.2 GOPS       |
| i8mm            | dp4a.vv(s32,u8,s8)      | 229.2 GOPS       |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 229.15 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 229.18 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 229.29 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 229.54 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 91.642 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 114.16 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 114.04 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 114.55 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 114.65 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 57.26 GFLOPS     |
| asimd           | fmla.vv(f32,f32,f32)    | 57.354 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 28.649 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 28.626 GFLOPS    |
----------------------------------------------------------------
</pre>
