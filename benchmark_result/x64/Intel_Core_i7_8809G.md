# Intel Core i7-8809G(Intel Hades Canyon NUC)

Product Code Name: Kaby Lake-G

Setting: 4 Kaby Lake Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 256b          | FMA(f32,f32,f32)      | 133.44 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 66.404 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 66.702 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 33.454 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 128b          | FMA(f32,f32,f32)      | 66.683 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 33.433 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 33.392 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 16.706 GFLOPS    |
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
| FMA             | 256b          | FMA(f32,f32,f32)      | 491.21 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 244.71 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 246.28 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 123.43 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FMA             | 128b          | FMA(f32,f32,f32)      | 248.94 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 124.49 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 121.26 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 60.86 GFLOPS     |
------------------------------------------------------------------------------
</pre>
