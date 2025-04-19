# Intel Xeon Gold 6455B

Microarchitecture: Sapphire Rapids

Setting: 2 Sockets x 32 Golden Cove Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AMX_INT8        | MM(s32,s8,s8)         | 6.3726 Tops      |
| AMX_INT8        | MM(s32,s8,u8)         | 7.5746 Tops      |
| AMX_INT8        | MM(s32,u8,s8)         | 7.5733 Tops      |
| AMX_INT8        | MM(s32,u8,u8)         | 7.5718 Tops      |
| AMX_BF16        | MM(f32,bf16,bf16)     | 3.7868 Tflops    |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 998.07 Gops      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 499.07 Gops      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 498.96 Gops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 249.47 Gops      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 115.16 Gflops    |
| AVX512_FP16     | FMA(f16,f16,f16)      | 499.08 Gflops    |
| AVX512F         | FMA(f32,f32,f32)      | 230.28 Gflops    |
| AVX512F         | FMA(f64,f64,f64)      | 115.17 Gflops    |
| FMA             | FMA(f32,f32,f32)      | 118.35 Gflops    |
| FMA             | FMA(f64,f64,f64)      | 62.385 Gflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 91.59 Gflops     |
| AVX             | ADD(MUL(f64,f64),f64) | 45.85 Gflops     |
| SSE             | ADD(MUL(f32,f32),f32) | 46.493 Gflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 23.235 Gflops    |
--------------------------------------------------------------
</pre>

For 64 cores:

<pre>
$ ./cpufp --thread_pool=[0-63]
Number Threads: 64
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AMX_INT8        | MM(s32,s8,s8)         | 390.67 Tops      |
| AMX_INT8        | MM(s32,s8,u8)         | 380.93 Tops      |
| AMX_INT8        | MM(s32,u8,s8)         | 391.32 Tops      |
| AMX_INT8        | MM(s32,u8,u8)         | 380.28 Tops      |
| AMX_BF16        | MM(f32,bf16,bf16)     | 192.47 Tflops    |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 48.114 Tops      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 24.169 Tops      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 30.818 Tops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 15.74 Tops       |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 7.09 Tflops      |
| AVX512_FP16     | FMA(f16,f16,f16)      | 31.473 Tflops    |
| AVX512F         | FMA(f32,f32,f32)      | 14.329 Tflops    |
| AVX512F         | FMA(f64,f64,f64)      | 6.5406 Tflops    |
| FMA             | FMA(f32,f32,f32)      | 7.4039 Tflops    |
| FMA             | FMA(f64,f64,f64)      | 3.9067 Tflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 5.4087 Tflops    |
| AVX             | ADD(MUL(f64,f64),f64) | 2.7339 Tflops    |
| SSE             | ADD(MUL(f32,f32),f32) | 2.9077 Tflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 1.4791 Tflops    |
--------------------------------------------------------------
</pre>
