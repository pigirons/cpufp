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
| LASX            | fmadd(f32,f32,f32) | 79.855 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) | 39.928 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) | 39.932 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) | 19.965 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) | 9.982 GFLOPS     |
| FP_DP           | fmadd(f64,f64,f64) | 9.9826 GFLOPS    |
-----------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
-----------------------------------------------------------
| Instruction Set | Core Computation   | Peak Performance |
| LASX            | fmadd(f32,f32,f32) | 319.45 GFLOPS    |
| LASX            | fmadd(f64,f64,f64) | 159.73 GFLOPS    |
| LSX             | fmadd(f32,f32,f32) | 159.73 GFLOPS    |
| LSX             | fmadd(f64,f64,f64) | 79.794 GFLOPS    |
| FP_SP           | fmadd(f32,f32,f32) | 39.92 GFLOPS     |
| FP_DP           | fmadd(f64,f64,f64) | 39.931 GFLOPS    |
-----------------------------------------------------------
</pre>

## Loongson 3C5000

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

## Loongson 3A5000M

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
