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
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 512b          | DP4A(s32,u8,s8)       | 1.4172 TOPS      |
| AVX512_VNNI     | 512b          | DP2A(s32,s16,s16)     | 708.61 GOPS      |
| AVX512_BF16     | 512b          | DP2A(f32,bf16,bf16)   | 708.19 GFLOPS    |
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 354.29 GFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 177.09 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 353.63 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 176.47 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 256b          | DP4A(s32,u8,s8)       | 708.55 GOPS      |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 708.64 GOPS      |
| AVX512_VNNI     | 256b          | DP2A(s32,s16,s16)     | 354.38 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 354.22 GOPS      |
| AVX512_BF16     | 256b          | DP2A(f32,bf16,bf16)   | 354.39 GFLOPS    |
| FMA             | 256b          | FMA(f32,f32,f32)      | 177.14 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 88.565 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 176.96 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 88.467 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 128b          | DP4A(s32,u8,s8)       | 354.53 GOPS      |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 354.53 GOPS      |
| AVX512_VNNI     | 128b          | DP2A(s32,s16,s16)     | 177.27 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 177.24 GOPS      |
| AVX512_BF16     | 128b          | DP2A(f32,bf16,bf16)   | 177.26 GFLOPS    |
| FMA             | 128b          | FMA(f32,f32,f32)      | 88.641 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 44.308 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 88.465 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 44.259 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 512b          | DP4A(s32,u8,s8)       | 11.064 TOPS      |
| AVX512_VNNI     | 512b          | DP2A(s32,s16,s16)     | 5.5293 TOPS      |
| AVX512_BF16     | 512b          | DP2A(f32,bf16,bf16)   | 5.5324 TFLOPS    |
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 2.7598 TFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 1.3768 TFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 2.7312 TFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 1.3605 TFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 256b          | DP4A(s32,u8,s8)       | 5.5604 TOPS      |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 5.5592 TOPS      |
| AVX512_VNNI     | 256b          | DP2A(s32,s16,s16)     | 2.7816 TOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 2.7783 TOPS      |
| AVX512_BF16     | 256b          | DP2A(f32,bf16,bf16)   | 2.7814 TFLOPS    |
| FMA             | 256b          | FMA(f32,f32,f32)      | 1.3884 TFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 694.02 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 1.3781 TFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 688.82 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 128b          | DP4A(s32,u8,s8)       | 2.7881 TOPS      |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 2.7881 TOPS      |
| AVX512_VNNI     | 128b          | DP2A(s32,s16,s16)     | 1.3938 TOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 1.3938 TOPS      |
| AVX512_BF16     | 128b          | DP2A(f32,bf16,bf16)   | 1.3958 TFLOPS    |
| FMA             | 128b          | FMA(f32,f32,f32)      | 696.63 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 348.12 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 686.34 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 344.64 GFLOPS    |
------------------------------------------------------------------------------
</pre>

