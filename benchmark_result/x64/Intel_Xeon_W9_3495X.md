# Intel Xeon W9-3495X

Microarchitecture: Sapphire Rapids

Setting: 1 Sockets x 56 Golden Cove Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AMX_INT8        | MM(s32,s8,s8)         | 5.6821 TOPS      |
| AMX_INT8        | MM(s32,s8,u8)         | 5.6854 TOPS      |
| AMX_INT8        | MM(s32,u8,s8)         | 5.6872 TOPS      |
| AMX_INT8        | MM(s32,u8,u8)         | 5.6905 TOPS      |
| AMX_BF16        | MM(f32,bf16,bf16)     | 2.8448 TFLOPS    |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 711.46 GOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 355.73 GOPS      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 368.94 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 184.44 GOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 80.477 GFLOPS    |
| AVX512_FP16     | FMA(f16,f16,f16)      | 355.76 GFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 158.74 GFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 79.375 GFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 92.224 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 46.115 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 67.789 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 33.9 GFLOPS      |
| SSE             | ADD(MUL(f32,f32),f32) | 34.43 GFLOPS     |
| SSE2            | ADD(MUL(f64,f64),f64) | 17.218 GFLOPS    |
--------------------------------------------------------------
</pre>

For 56 cores:

<pre>
$ ./cpufp --thread_pool=[0-55]
Number Threads: 56
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AMX_INT8        | MM(s32,s8,s8)         | 293.86 TOPS      |
| AMX_INT8        | MM(s32,s8,u8)         | 309.81 TOPS      |
| AMX_INT8        | MM(s32,u8,s8)         | 293.44 TOPS      |
| AMX_INT8        | MM(s32,u8,u8)         | 293.07 TOPS      |
| AMX_BF16        | MM(f32,bf16,bf16)     | 141.12 TFLOPS    |
| AVX512_VNNI     | DP4A(s32,u8,s8)       | 39.629 TOPS      |
| AVX512_VNNI     | DP2A(s32,s16,s16)     | 19.772 TOPS      |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 20.503 TOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 10.236 TOPS      |
| AVX512_BF16     | DP2A(f32,bf16,bf16)   | 4.4223 TFLOPS    |
| AVX512_FP16     | FMA(f16,f16,f16)      | 19.761 TFLOPS    |
| AVX512F         | FMA(f32,f32,f32)      | 7.7876 TFLOPS    |
| AVX512F         | FMA(f64,f64,f64)      | 3.8961 TFLOPS    |
| FMA             | FMA(f32,f32,f32)      | 4.962 TFLOPS     |
| FMA             | FMA(f64,f64,f64)      | 2.4778 TFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 3.4637 TFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 1.7112 TFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 1.9122 TFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 960.12 GFLOPS    |
--------------------------------------------------------------
</pre>
