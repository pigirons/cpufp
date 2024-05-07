# LoongArch64 CPU benchmark results

## Loongson 3A6000

Setting: 4 LA664 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------------------------
| Instruction Set | Core Computation                       | Peak Performance |
| LASX            | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 119.92 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 59.959 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 59.959 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 29.979 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 14.99 GFLOPS     |
| FP_DP           | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 14.99 GFLOPS     |
-------------------------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
-------------------------------------------------------------------------------
| Instruction Set | Core Computation                       | Peak Performance |
| LASX            | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 479.67 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 239.85 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 239.84 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 119.92 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) + fadd(f32,f32,f32) | 59.961 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64) + fadd(f64,f64,f64) | 59.642 GFLOPS    |
-------------------------------------------------------------------------------
</pre>

NOTE: Loongson 3A6000 has 4 vector pipelines: two of them are Floating Mul-Add, while the other two are Floating Add. The ratio of Muls:Adds is 1:2.

