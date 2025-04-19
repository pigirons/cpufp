# Apple M4 Max (Macbook Pro 16)

Setting: 12 P-Cores + 4 E-Cores

OS: MacOS 15.1

For 1 P-core:

<pre>
$ ./cpufp --thread_pool=[0]
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
$ ./cpufp --thread_pool=[0-15]
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
