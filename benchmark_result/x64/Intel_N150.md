# Intel N150

Product Code Name: Twin-Lake

Setting: 4 Gracemont Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 114.75 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 57.372 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 57.374 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 28.608 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 28.688 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 14.344 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 114.75 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 57.352 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 56.509 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 28.259 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 28.685 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 14.34 GFLOPS     |
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
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 369.64 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 184.83 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 179.63 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 89.945 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 91.402 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 45.469 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 369.7 GOPS       |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 184.84 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 171.99 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 86.56 GFLOPS     |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 88.764 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 44.468 GFLOPS    |
------------------------------------------------------------------------------
</pre>

