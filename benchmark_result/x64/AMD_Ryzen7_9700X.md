# AMD Ryzen7 9700X

Microarchitecture: Zen5

Setting: 8 Zen5 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX512_VNNI     | 512b          | DP4A(s32,u8,s8)       | 1.4165 TOPS      |
| AVX512_VNNI     | 512b          | DP2A(s32,s16,s16)     | 708.13 GOPS      |
| AVX512_BF16     | 512b          | DP2A(f32,bf16,bf16)   | 708.05 GFLOPS    |
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 353.99 GFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 177.01 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 353.53 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 176.79 GFLOPS    |
| AVX512_VNNI     | 256b          | DP4A(s32,u8,s8)       | 708.68 GOPS      |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 708.61 GOPS      |
| AVX512_VNNI     | 256b          | DP2A(s32,s16,s16)     | 354.31 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 354.34 GOPS      |
| AVX512_BF16     | 256b          | DP2A(f32,bf16,bf16)   | 354.31 GFLOPS    |
| FMA             | 256b          | FMA(f32,f32,f32)      | 177.18 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 88.574 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 176.98 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 88.368 GFLOPS    |
| AVX512_VNNI     | 128b          | DP4A(s32,u8,s8)       | 354.3 GOPS       |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 354.28 GOPS      |
| AVX512_VNNI     | 128b          | DP2A(s32,s16,s16)     | 177.17 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 177.15 GOPS      |
| AVX512_BF16     | 128b          | DP2A(f32,bf16,bf16)   | 177.18 GFLOPS    |
| FMA             | 128b          | FMA(f32,f32,f32)      | 88.576 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 44.294 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 84.357 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 44.202 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX512_VNNI     | 512b          | DP4A(s32,u8,s8)       | 11.073 TOPS      |
| AVX512_VNNI     | 512b          | DP2A(s32,s16,s16)     | 5.5341 TOPS      |
| AVX512_BF16     | 512b          | DP2A(f32,bf16,bf16)   | 5.5352 TFLOPS    |
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 2.7636 TFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 1.3783 TFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 2.7218 TFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 1.3583 TFLOPS    |
| AVX512_VNNI     | 256b          | DP4A(s32,u8,s8)       | 5.5634 TOPS      |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 5.5596 TOPS      |
| AVX512_VNNI     | 256b          | DP2A(s32,s16,s16)     | 2.7787 TOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 2.7799 TOPS      |
| AVX512_BF16     | 256b          | DP2A(f32,bf16,bf16)   | 2.7822 TFLOPS    |
| FMA             | 256b          | FMA(f32,f32,f32)      | 1.3894 TFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 693.61 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 1.3778 TFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 687.44 GFLOPS    |
| AVX512_VNNI     | 128b          | DP4A(s32,u8,s8)       | 2.7862 TOPS      |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 2.7875 TOPS      |
| AVX512_VNNI     | 128b          | DP2A(s32,s16,s16)     | 1.3946 TOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 1.3945 TOPS      |
| AVX512_BF16     | 128b          | DP2A(f32,bf16,bf16)   | 1.3957 TFLOPS    |
| FMA             | 128b          | FMA(f32,f32,f32)      | 696.68 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 348.24 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 651.25 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 344.36 GFLOPS    |
------------------------------------------------------------------------------
</pre>

