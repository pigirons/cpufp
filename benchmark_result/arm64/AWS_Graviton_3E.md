# AWS Graviton 3E

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
