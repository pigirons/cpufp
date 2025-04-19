# AMD Ryzen7 8845HS

Architecture: Zen4

Setting: 8 Zen4 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 647.97 GOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 324.27 GOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 324.92 GFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 163.58 GFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 81.786 GFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 163.57 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 81.785 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 157.36 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 79.045 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 80.34 GFLOPS     |
| SSE2            | ADD(MUL(f64,f64),f64) | 40.371 GFLOPS    |
--------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 5113.8 GOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 2559.1 GOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 2551.6 GFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 1283.6 GFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 641.21 GFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 1271.7 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 632.3 GFLOPS     |
| AVX             | ADD(MUL(f32,f32),f32) | 1193.6 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 590.85 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 613.54 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 307.67 GFLOPS    |
--------------------------------------------------------------
</pre>
