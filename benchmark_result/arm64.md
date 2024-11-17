# arm64 CPU benchmark results

## Qualcomm Snapdragon X Elite - X1E80100

Architecture: Oryon-1

Setting: 4 cores @ 3.4Ghz + 8 cores @ 4.0Ghz

For single core:

<pre>
PS C:\Data\cpufp> .\cpufp.exe --thread_pool=[4]
Number Threads: 1
Thread Pool Binding: 4
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 442.36 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 434.67 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 437.35 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 520.02 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 525.78 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 515.6 GOPS       |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 510.91 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 516.89 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 518 GOPS         |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 514.3 GOPS       |
| bf16            | mmla(f32,bf16,bf16)     | 223.53 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 256.44 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 252.13 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 260.4 GFLOPS     |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 259.04 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 127.29 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 125.67 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 65.2 GFLOPS      |
| asimd           | fmla.vv(f64,f64,f64)    | 65.195 GFLOPS    |
----------------------------------------------------------------
</pre>

For 12 cores:

<pre>
PS C:\Data\cpufp> .\cpufp.exe --thread_pool=[0-11]
Number Threads: 12
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 4.3971 TOPS      |
| i8mm            | mmla(u32,u8,u8)         | 4.3813 TOPS      |
| i8mm            | mmla(s32,u8,s8)         | 4.3889 TOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 5.1953 TOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 5.221 TOPS       |
| i8mm            | dp4a.vv(s32,u8,s8)      | 5.209 TOPS       |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 5.2081 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 5.2275 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 5.222 TOPS       |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 5.2146 TOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 2.2578 TFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 2.6124 TFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 2.6172 TFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 2.6051 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 2.6035 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 1.3028 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 1.3032 TFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 654.67 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 654.44 GFLOPS    |
----------------------------------------------------------------
</pre>

## HUAWEI Kunpeng 920 7260

Architecture: Taishan V110

Setting: 2 * 64 cores

For single core:

<pre>
$ ./cpufp --thread_pool=[1]
Number Threads: 1
Thread Pool Binding: 1
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 166.3 GOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 166.32 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 166.31 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 166.29 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 83.161 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 83.151 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 41.576 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 41.579 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 10.395 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 10.394 GFLOPS    |
----------------------------------------------------------------

</pre>

For 32 cores:

<pre>
$ ./cpufp --thread_pool=[0-31]
Number Threads: 32
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 5.304 TOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 5.3108 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 5.307 TOPS       |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 5.3123 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 2.6555 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 2.6564 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 1.3252 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 1.328 TFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 331.95 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 331.98 GFLOPS    |
----------------------------------------------------------------

</pre>

For 64 cores:

<pre>
$ ./cpufp --thread_pool=[0-63]
Number Threads: 64
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 10.601 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 10.586 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 10.587 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 10.593 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 5.2966 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 5.2975 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 2.6551 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 2.6557 TFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 663.98 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 663.73 GFLOPS    |
----------------------------------------------------------------

</pre>

For 128 cores:

<pre>
$ ./cpufp --thread_pool=[0-127]
Number Threads: 128
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 20.951 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 20.27 TOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 19.736 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 16.495 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 10.481 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 10.514 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 5.1993 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 4.117 TFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 1.2754 TFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 1.049 TFLOPS     |
----------------------------------------------------------------

</pre>

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

## Rockchip RK3399

Setting: 2 Cortex-A72(big) Cores + 4 Cortex-A53(Little) Cores

For single Little core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 11.255 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 11.255 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 5.6275 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 5.6277 GFLOPS    |
-------------------------------------------------------------
</pre>

For 4 Little cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 45.029 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 45.027 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 22.509 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 22.513 GFLOPS    |
-------------------------------------------------------------
</pre>

For single big core:

<pre>
$ ./cpufp --thread_pool=[4]
Number Threads: 1
Thread Pool Binding: 4
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 14.348 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 14.348 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 7.1744 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 7.1743 GFLOPS    |
-------------------------------------------------------------
</pre>

For 2 big cores:

<pre>
$ ./cpufp --thread_pool=[4,5]
Number Threads: 2
Thread Pool Binding: 4 5
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 28.698 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 28.698 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 14.349 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 14.347 GFLOPS    |
-------------------------------------------------------------
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

## Apple M2 Max (Macbook Pro 16), macos 15.1

Setting: 8xAvalanche P-Cores + 4xBlizzard E-Cores

For 1 P-core:

<pre>
❯ ./cpufp --thread_pool=[0]
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
❯ ./cpufp --thread_pool=[0-7]
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
❯ taskpolicy -c background ./cpufp --thread_pool=[0]
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
❯ taskpolicy -c background ./cpufp --thread_pool=[0-3]
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
❯ ./cpufp --thread_pool=[0-11]
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

## Apple M4 Max (Macbook Pro 16), macos 15.1

Setting: 12x P-Cores + 4x E-Cores

For 1 P-core:

<pre>
$ ./<mark>cpufp</mark> --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 477.42 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 477.76 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 478.18 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 472.27 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 472.34 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 472.57 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 472.39 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 472.39 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 472.66 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 472.7 GOPS       |
| bf16            | mmla(f32,bf16,bf16)     | 71.964 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 71.942 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 71.915 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 233.67 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 236.39 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 116.7 GFLOPS     |
| asimd           | fmla.vv(f32,f32,f32)    | 118.4 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 58.344 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 59.124 GFLOPS    |
----------------------------------------------------------------
</pre>

For 12 P-cores:
<pre>
$ ./cpufp --thread_pool=[0-11]
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
| i8mm            | mmla(s32,s8,s8)         | 4.9542 TOPS      |
| i8mm            | mmla(u32,u8,u8)         | 4.9557 TOPS      |
| i8mm            | mmla(s32,u8,s8)         | 4.9335 TOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 4.8965 TOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 4.8873 TOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 4.896 TOPS       |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 4.891 TOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 4.8954 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 4.8983 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 4.8943 TOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 745.35 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 745.37 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 745.28 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 2.4183 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 2.4491 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 1.208 TFLOPS     |
| asimd           | fmla.vv(f32,f32,f32)    | 1.2245 TFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 604.22 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 612.65 GFLOPS    |
----------------------------------------------------------------
</pre>

For 1 E-core:
<pre>
$ taskpolicy -c background ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 66.327 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 68.298 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 75.25 GOPS       |
| i8mm            | dp4a.vs(s32,s8,u8)      | 65.959 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 66.819 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 69.26 GOPS       |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 67.005 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 66.623 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 64.867 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 65.323 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 11.234 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 11.222 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 11.242 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 32.67 GFLOPS     |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 33.329 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 16.367 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 16.262 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 8.1371 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 8.5853 GFLOPS    |
----------------------------------------------------------------
</pre>

For 4 E-cores (OS is running and therefore using some of them):
<pre>
$ taskpolicy -c background ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 245.5 GOPS       |
| i8mm            | mmla(u32,u8,u8)         | 254.44 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 254.65 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 250.63 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 254.65 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 254.88 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 247.45 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 255.69 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 254.06 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 253.43 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 42.842 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 43.632 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 43.273 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 126.73 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 132.21 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 65.895 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 63.022 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 31.509 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 31.543 GFLOPS    |
----------------------------------------------------------------
</pre>

For 12 P-cores + 4 E-cores:

<pre>
$ ./<mark>cpufp</mark> --thread_pool=[0-15]
Number Threads: 16
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
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
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
Warning: cpu thread policy is not supported by OS
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 5.4673 TOPS      |
| i8mm            | mmla(u32,u8,u8)         | 5.5309 TOPS      |
| i8mm            | mmla(s32,u8,s8)         | 5.5254 TOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 5.4348 TOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 5.4187 TOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 5.4255 TOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 5.4434 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 5.4171 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 5.4069 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 5.3969 TOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 844.34 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 843.35 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 841.86 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 2.6914 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 2.735 TFLOPS     |
| asimd           | fmla.vs(f32,f32,f32)    | 1.3444 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 1.3631 TFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 673.16 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 678.52 GFLOPS    |
----------------------------------------------------------------
</pre>