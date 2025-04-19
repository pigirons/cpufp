# Broadcom BCM2712(RaspBerry Pi 5)

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
