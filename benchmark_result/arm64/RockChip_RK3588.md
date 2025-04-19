# RockChip RK3588

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
