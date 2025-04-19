# Qualcomm Snapdragon X Elite - X1E80100

Architecture: Oryon-1

Setting: 4 E-cores @ 3.4Ghz + 8 P-cores @ 4.0Ghz

For single core:

<pre>
> .\cpufp.exe --thread_pool=[4]
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
> .\cpufp.exe --thread_pool=[0-11]
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
