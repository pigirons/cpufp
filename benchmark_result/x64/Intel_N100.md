# Intel N100

Product Code Name: Alder Lake-N

Setting: 4 Gracemont Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 108.51 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 54.244 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 54.247 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 27.128 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 27.128 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 13.564 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 27.126 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 13.563 GFLOPS    |
--------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 369.66 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 185.09 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 185.08 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 92.55 GFLOPS     |
| AVX             | ADD(MUL(f32,f32),f32) | 92.546 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 46.269 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 92.546 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 46.27 GFLOPS     |
--------------------------------------------------------------
</pre>
