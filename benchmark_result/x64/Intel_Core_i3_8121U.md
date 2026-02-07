# Intel Core i3-8121U

Product Code Name: Cannon-Lake

Setting: 2 Cannon-Lake Cores

For single Core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 101.56 GFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 50.784 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 50.783 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 25.391 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 256b          | FMA(f32,f32,f32)      | 101.55 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 50.803 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 50.744 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 25.39 GFLOPS     |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 128b          | FMA(f32,f32,f32)      | 50.772 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 25.376 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 12.69 GFLOPS     |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 6.3453 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 2 Cores:

<pre>
$ ./cpufp --thread_pool=[0,1]
Number Threads: 2
Thread Pool Binding: 0 1
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX512F         | 512b          | FMA(f32,f32,f32)      | 197.25 GFLOPS    |
| AVX512F         | 512b          | FMA(f64,f64,f64)      | 98.624 GFLOPS    |
| AVX512F         | 512b          | ADD(MUL(f32,f32),f32) | 98.62 GFLOPS     |
| AVX512F         | 512b          | ADD(MUL(f64,f64),f64) | 49.315 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 256b          | FMA(f32,f32,f32)      | 197.18 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 98.594 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 98.64 GFLOPS     |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 49.304 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 128b          | FMA(f32,f32,f32)      | 98.629 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 49.319 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 24.658 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 12.326 GFLOPS    |
------------------------------------------------------------------------------
</pre>

