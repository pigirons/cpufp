# HUAWEI Kunpeng D920 2249K

Architecture: Taishan V110

Setting: 8 cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 166.21 GOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 166.21 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 166.21 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 166.2 GOPS       |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 83.104 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 83.104 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 41.553 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 41.553 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 10.388 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 10.388 GFLOPS    |
----------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 1.3132 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 1.3014 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 1.3034 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 1.3016 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 651.87 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 652.34 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 326.4 GFLOPS     |
| asimd           | fmla.vv(f32,f32,f32)    | 326.12 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 81.791 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 81.503 GFLOPS    |
----------------------------------------------------------------
</pre>
