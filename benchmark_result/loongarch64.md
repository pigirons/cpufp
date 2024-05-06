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
| LASX            | fmadd(f32,f32,f32) | 119.92 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) | 59.957 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) | 59.958 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) | 29.98 GFLOPS     |
| FP_SP           | fmadd(f32,f32,f32) | 14.99 GFLOPS     |
| FP_DP           | fmadd(f64,f64,f64) | 14.99 GFLOPS     |
-----------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
-----------------------------------------------------------
| Instruction Set | Core Computation   | Peak Performance |
| LASX            | fmadd(f32,f32,f32) | 479.7 GFLOPS     |
| LASX            | fmadd(f64,f64,f64) | 239.86 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) | 239.85 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) | 119.92 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) | 59.963 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64) | 59.963 GFLOPS    |
-----------------------------------------------------------
</pre>

NOTE: Loongson 3A6000 has 4 vector pipelines. Two of them are floating mul-add, while the other two are floating add. The numbers of muls and adds are not equal.

