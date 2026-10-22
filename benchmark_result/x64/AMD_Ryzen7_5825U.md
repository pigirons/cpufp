# AMD Ryzen7 5825U(GMKtec M5 Plus)

Architecture: Zen3

Setting: 8 Zen3 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 256b          | FMA(f32,f32,f32)      | 142.34 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 71.159 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 141.56 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 70.761 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 128b          | FMA(f32,f32,f32)      | 71.17 GFLOPS     |
| FMA             | 128b          | FMA(f64,f64,f64)      | 35.583 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 70.775 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 35.381 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6,8,10,12,14]
Number Threads: 8
Thread Pool Binding: 0 2 4 6 8 10 12 14
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 256b          | FMA(f32,f32,f32)      | 948.38 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 464.97 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 872.18 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 437.08 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 128b          | FMA(f32,f32,f32)      | 484.98 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 242.21 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 440.93 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 223.07 GFLOPS    |
------------------------------------------------------------------------------
</pre>
