# AMD Ryzen7 9700X

Microarchitecture: Zen5

Setting: 8 Zen5 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 1.4139 TOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 706.78 GOPS      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 707.45 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 353.69 GOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 706.71 GFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 353.3 GFLOPS     |
| AVX512F         | FMA(f64,f64,f64)      | 176.62 GFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 176.83 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 88.417 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 176.48 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 88.084 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 88.286 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 44.058 GFLOPS    |
--------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 10.859 TOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 5.4159 TOPS      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 5.4499 TOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 2.7227 TOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 5.4168 TFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 2.7021 TFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 1.3483 TFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 1.3567 TFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 678.31 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 1.2726 TFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 633.21 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 600.08 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 333.63 GFLOPS    |
--------------------------------------------------------------
</pre>
