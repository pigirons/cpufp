# Loongson 3C5000

Setting: 16 LA464 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------------------------
| Instruction Set | Core Computation                       | Peak Performance |
| LASX            | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 52.603 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 26.331 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 26.323 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 13.166 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 6.583 GFLOPS     |
| FP_DP           | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 6.5723 GFLOPS    |
-------------------------------------------------------------------------------
</pre>

For 16 cores:

<pre>
$ ./cpufp --thread_pool=[0-15]
Number Threads: 16
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
-------------------------------------------------------------------------------
| Instruction Set | Core Computation                       | Peak Performance |
| LASX            | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 841.77 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 406.52 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 420.84 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 210.01 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 105.21 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 104.59 GFLOPS    |
-------------------------------------------------------------------------------
</pre>
