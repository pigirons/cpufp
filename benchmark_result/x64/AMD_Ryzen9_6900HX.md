# AMD Ryzen9 6900HX

Architecture: Zen3+

Setting: 8 Zen3+ Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| FMA             | FMA(f32,f32,f32)      | 151.84 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 75.702 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 150.86 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 75.476 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 75.452 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 37.737 GFLOPS    |
--------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6,8,10,12,14]
Number Threads: 8
Thread Pool Binding: 0 2 4 6 8 10 12 14
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| FMA             | FMA(f32,f32,f32)      | 1057.8 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 534.37 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 1037.6 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 516.21 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 518.32 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 258.92 GFLOPS    |
--------------------------------------------------------------
</pre>
