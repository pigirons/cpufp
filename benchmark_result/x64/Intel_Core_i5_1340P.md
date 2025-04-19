# Intel Core i5-1340P

Product Code Name: Raptor Lake

Setting: 4 Raptor Cove(P-Core) Cores + 8 Gracemont(E-Core) Cores

For single P-Core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 586.84 Gops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 293.5 Gops       |
| FMA             | FMA(f32,f32,f32)      | 146.76 Gflops    |
| FMA             | FMA(f64,f64,f64)      | 73.373 Gflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 107.7 Gflops     |
| AVX             | ADD(MUL(f64,f64),f64) | 53.512 Gflops    |
| SSE             | ADD(MUL(f32,f32),f32) | 54.49 Gflops     |
| SSE2            | ADD(MUL(f64,f64),f64) | 27.243 Gflops    |
--------------------------------------------------------------
</pre>

For 4 P-Cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 2.2454 Tops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 1.1215 Tops      |
| FMA             | FMA(f32,f32,f32)      | 546.31 Gflops    |
| FMA             | FMA(f64,f64,f64)      | 267.62 Gflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 356.72 Gflops    |
| AVX             | ADD(MUL(f64,f64),f64) | 176.89 Gflops    |
| SSE             | ADD(MUL(f32,f32),f32) | 183.39 Gflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 91.293 Gflops    |
--------------------------------------------------------------
</pre>

For single E-Core:

<pre>
$ ./cpufp --thread_pool=[8]
Number Threads: 1
Thread Pool Binding: 8
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 108.5 Gops       |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 54.251 Gops      |
| FMA             | FMA(f32,f32,f32)      | 54.248 Gflops    |
| FMA             | FMA(f64,f64,f64)      | 27.125 Gflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 27.126 Gflops    |
| AVX             | ADD(MUL(f64,f64),f64) | 13.563 Gflops    |
| SSE             | ADD(MUL(f32,f32),f32) | 27.122 Gflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 13.561 Gflops    |
--------------------------------------------------------------
</pre>

For 8 E-Cores:

<pre>
$ ./cpufp --thread_pool=[8-15]
Number Threads: 8
Thread Pool Binding: 8 9 10 11 12 13 14 15
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 791.36 Gops      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 395.68 Gops      |
| FMA             | FMA(f32,f32,f32)      | 395.67 Gflops    |
| FMA             | FMA(f64,f64,f64)      | 197.83 Gflops    |
| AVX             | ADD(MUL(f32,f32),f32) | 197.84 Gflops    |
| AVX             | ADD(MUL(f64,f64),f64) | 98.921 Gflops    |
| SSE             | ADD(MUL(f32,f32),f32) | 197.83 Gflops    |
| SSE2            | ADD(MUL(f64,f64),f64) | 98.916 Gflops    |
--------------------------------------------------------------
</pre>
