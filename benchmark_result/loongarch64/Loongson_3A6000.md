# Loongson 3A6000

Setting: 4 LA664 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| LASX            | fmadd(f32,f32,f32)    | 79.862 GFLOPS    |
| LASX            | fmadd(f64,f64,f64)    | 39.882 GFLOPS    |
| LASX            | add(mul(f32,f32),f32) | 79.77 GFLOPS     |
| LASX            | add(mul(f64,f64),f64) | 39.929 GFLOPS    |
| LSX             | fmadd(f32,f32,f32)    | 39.931 GFLOPS    |
| LSX             | fmadd(f64,f64,f64)    | 19.966 GFLOPS    |
| LSX             | add(mul(f32,f32),f32) | 39.892 GFLOPS    |
| LSX             | add(mul(f64,f64),f64) | 19.962 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32)    | 9.9832 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64)    | 9.9811 GFLOPS    |
--------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| LASX            | fmadd(f32,f32,f32)    | 319.29 GFLOPS    |
| LASX            | fmadd(f64,f64,f64)    | 159.6 GFLOPS     |
| LASX            | add(mul(f32,f32),f32) | 319.3 GFLOPS     |
| LASX            | add(mul(f64,f64),f64) | 159.66 GFLOPS    |
| LSX             | fmadd(f32,f32,f32)    | 159.71 GFLOPS    |
| LSX             | fmadd(f64,f64,f64)    | 79.854 GFLOPS    |
| LSX             | add(mul(f32,f32),f32) | 159.71 GFLOPS    |
| LSX             | add(mul(f64,f64),f64) | 79.833 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32)    | 39.927 GFLOPS    |
| FP_DP           | fmadd(f64,f64,f64)    | 39.932 GFLOPS    |
--------------------------------------------------------------
</pre>
