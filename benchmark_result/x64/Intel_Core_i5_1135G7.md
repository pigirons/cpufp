# Intel Core i5-1135G7

Product Code Name: Tiger Lake

Setting: 4 Tiger-Lake Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 512b          | DP4A(s32,u8,s8)       | 518.33 GOPS      |
| AVX512_VNNI     | 512b          | DP2A(s32,s16,s16)     | 261.39 GOPS      |
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 130.73 GFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 65.365 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 65.37 GFLOPS     |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 32.688 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 256b          | DP4A(s32,u8,s8)       | 535.46 GOPS      |
| AVX512_VNNI     | 256b          | DP2A(s32,s16,s16)     | 267.87 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 133.92 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 66.97 GFLOPS     |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 66.964 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 33.485 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 128b          | DP4A(s32,u8,s8)       | 267.86 GOPS      |
| AVX512_VNNI     | 128b          | DP2A(s32,s16,s16)     | 133.86 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 66.969 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 33.481 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 16.343 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 8.1701 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 512b          | DP4A(s32,u8,s8)       | 1.9379 TOPS      |
| AVX512_VNNI     | 512b          | DP2A(s32,s16,s16)     | 969.04 GOPS      |
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 484.54 GFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 242.26 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 242.29 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 121.09 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 256b          | DP4A(s32,u8,s8)       | 1.9385 TOPS      |
| AVX512_VNNI     | 256b          | DP2A(s32,s16,s16)     | 969.2 GOPS       |
| FMA             | 256b          | FMA(f32,f32,f32)      | 484.59 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 242.28 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 242.3 GFLOPS     |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 121.14 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX512_VNNI     | 128b          | DP4A(s32,u8,s8)       | 968.97 GOPS      |
| AVX512_VNNI     | 128b          | DP2A(s32,s16,s16)     | 484.57 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 242.31 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 121.15 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 60.549 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 30.283 GFLOPS    |
------------------------------------------------------------------------------
</pre>
