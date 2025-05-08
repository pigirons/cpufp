# CIX P1 CD8180(Radxa Orion O6)

Settings:  
Cortex-A720 @ 2.5GHz: 0,11  
Cortex-A720 @ 2.4GHz: 9,10  
Cortex-A720 @ 2.3GHz: 5,6  
Cortex-A720 @ 2.2GHz: 7,8  
Cortex-A520 @ 1.8GHz: 1-4

Power policy: Balance

For single P-Core @ 2.5GHz:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 319.69 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 319.71 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 319.71 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 159.86 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 159.88 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 159.85 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 159.87 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 159.89 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 159.87 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 159.89 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 159.9 GFLOPS     |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 79.947 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 79.949 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 79.948 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 79.944 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 39.971 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 39.972 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 19.985 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 19.984 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.5GHz:

<pre>
$ ./cpufp --thread_pool=[0,11]
Number Threads: 2
Thread Pool Binding: 0 11
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 638.37 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 639.22 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 639.3 GOPS       |
| i8mm            | dp4a.vs(s32,s8,u8)      | 319.61 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 319.58 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 319.69 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 319.67 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 319.61 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 319.6 GOPS       |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 319.65 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 319.64 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 159.87 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 159.86 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 159.85 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 159.85 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 79.899 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 79.935 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 39.956 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 39.963 GFLOPS    |
----------------------------------------------------------------
</pre>

For single P-Core @ 2.4GHz:

<pre>
$ ./cpufp --thread_pool=[9]
Number Threads: 1
Thread Pool Binding: 9
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 306.95 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 306.94 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 306.98 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 153.47 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 153.46 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 153.48 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 153.46 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 153.46 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 153.48 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 153.47 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 153.49 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 76.745 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 76.732 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 76.734 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 76.75 GFLOPS     |
| asimd           | fmla.vs(f32,f32,f32)    | 38.369 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 38.367 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 19.186 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 19.185 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.4GHz:

<pre>
$ ./cpufp --thread_pool=[9,10]
Number Threads: 2
Thread Pool Binding: 9 10
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 613.78 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 613.84 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 613.84 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 306.92 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 306.9 GOPS       |
| i8mm            | dp4a.vv(s32,u8,s8)      | 306.95 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 306.92 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 306.89 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 306.94 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 306.93 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 306.9 GFLOPS     |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 153.47 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 153.46 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 153.45 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 153.46 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 76.725 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 76.726 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 38.368 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 38.364 GFLOPS    |
----------------------------------------------------------------
</pre>

For single P-Core @ 2.3GHz:

<pre>
$ ./cpufp --thread_pool=[5]
Number Threads: 1
Thread Pool Binding: 5
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 294.17 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 294.15 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 294.14 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 147.07 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 147.08 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 147.07 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 147.07 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 147.07 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 147.07 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 147.08 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 147.07 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 73.532 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 73.539 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 73.541 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 73.537 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 36.768 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 36.772 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 18.383 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 18.384 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.3GHz:

<pre>
$ ./cpufp --thread_pool=[5,6]
Number Threads: 2
Thread Pool Binding: 5 6
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 586.66 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 587.38 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 587.83 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 293.61 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 293.87 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 293.46 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 293.87 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 293.94 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 293.91 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 293.86 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 293.81 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 146.88 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 146.91 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 146.94 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 146.84 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 73.442 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 73.456 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 36.735 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 36.728 GFLOPS    |
----------------------------------------------------------------
</pre>

For single P-Core @ 2.2GHz:

<pre>
$ ./cpufp --thread_pool=[7]
Number Threads: 1
Thread Pool Binding: 7
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 281.34 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 281.37 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 281.35 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 140.67 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 140.68 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 140.68 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 140.68 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 140.7 GOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 140.69 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 140.69 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 140.67 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 70.338 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 70.335 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 70.346 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 70.345 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 35.169 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 35.172 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 17.587 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 17.585 GFLOPS    |
----------------------------------------------------------------
</pre>

For 2 P-Cores @ 2.2GHz:

<pre>
$ ./cpufp --thread_pool=[7,8]
Number Threads: 2
Thread Pool Binding: 7 8
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 562.68 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 562.69 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 562.75 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 281.34 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 281.32 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 281.32 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 281.32 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 281.36 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 281.38 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 281.36 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 281.34 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 140.68 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 140.67 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 140.67 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 140.69 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 70.344 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 70.342 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 35.171 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 35.17 GFLOPS     |
----------------------------------------------------------------
</pre>

For single E-core @ 1.8GHz:

<pre>
$ ./cpufp --thread_pool=[1]
Number Threads: 1
Thread Pool Binding: 1
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 114.83 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 114.82 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 114.81 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 57.415 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 57.414 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 57.417 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 57.411 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 57.417 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 57.418 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 57.415 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 22.967 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 28.706 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 28.708 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 28.703 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 28.708 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 14.354 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 14.353 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 7.1768 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 7.1766 GFLOPS    |
----------------------------------------------------------------
</pre>

For 4 E-Cores @ 1.8GHz:

<pre>
$ ./cpufp --thread_pool=[1-4]
Number Threads: 4
Thread Pool Binding: 1 2 3 4
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| i8mm            | mmla(s32,s8,s8)         | 402.75 GOPS      |
| i8mm            | mmla(u32,u8,u8)         | 402.79 GOPS      |
| i8mm            | mmla(s32,u8,s8)         | 402.79 GOPS      |
| i8mm            | dp4a.vs(s32,s8,u8)      | 201.37 GOPS      |
| i8mm            | dp4a.vs(s32,u8,s8)      | 201.35 GOPS      |
| i8mm            | dp4a.vv(s32,u8,s8)      | 201.35 GOPS      |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 201.37 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 201.29 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 201.35 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 201.36 GOPS      |
| bf16            | mmla(f32,bf16,bf16)     | 80.555 GFLOPS    |
| bf16            | dp2a.vs(f32,bf16,bf16)  | 100.68 GFLOPS    |
| bf16            | dp2a.vv(f32,bf16,bf16)  | 100.66 GFLOPS    |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 100.68 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 100.7 GFLOPS     |
| asimd           | fmla.vs(f32,f32,f32)    | 50.355 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 50.348 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 25.172 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 25.172 GFLOPS    |
----------------------------------------------------------------
</pre>
