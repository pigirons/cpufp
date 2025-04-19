# Loongson 3A5000M

Setting: 4 LA464 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------------------------
| Instruction Set | Core Computation                       | Peak Performance |
| LASX            | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 47.831 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 23.888 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 23.918 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 11.957 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 5.9803 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 5.9803 GFLOPS    |
-------------------------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------------------------
| Instruction Set | Core Computation                       | Peak Performance |
| LASX            | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 190.92 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 95.47 GFLOPS     |
| LSX             | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 95.184 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 47.652 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 23.847 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 23.876 GFLOPS    |
-------------------------------------------------------------------------------
</pre>
