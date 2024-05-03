# LoongArch64 CPU benchmark results

## Loongson 3A6000

Setting: 4 LA664 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-----------------------------------------------------------
| Instruction Set | Core Computation   | Peak Performance |
| LASX            | fmadd(f32,f32,f32) | 79.89 GFLOPS     |
| LASX            | fmadd(f64,f64,f64) | 39.95 GFLOPS     |
| LSX             | fmadd(f32,f32,f32) | 39.952 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) | 19.964 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) | 9.9916 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64) | 9.9919 GFLOPS    |
-----------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
-----------------------------------------------------------
| Instruction Set | Core Computation   | Peak Performance |
| LASX            | fmadd(f32,f32,f32) | 319.72 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) | 159.82 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) | 159.72 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) | 79.858 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) | 39.94 GFLOPS     |
| FP_DP           | fmadd(f64,f64,f64) | 39.943 GFLOPS    |
-----------------------------------------------------------
</pre>

