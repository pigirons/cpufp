# Loongson 3A6000

Setting: 4 LA664 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| LASX            | 256b          | fmadd(f32,f32,f32)    | 79.781 GFLOPS    |
| LASX            | 256b          | fmadd(f64,f64,f64)    | 39.939 GFLOPS    |
| LASX            | 256b          | add(mul(f32,f32),f32) | 79.853 GFLOPS    |
| LASX            | 256b          | add(mul(f64,f64),f64) | 39.937 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| LSX             | 128b          | fmadd(f32,f32,f32)    | 39.916 GFLOPS    |
| LSX             | 128b          | fmadd(f64,f64,f64)    | 19.97 GFLOPS     |
| LSX             | 128b          | add(mul(f32,f32),f32) | 39.935 GFLOPS    |
| LSX             | 128b          | add(mul(f64,f64),f64) | 19.968 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FP_SP           | scalar        | fmadd(f32,f32,f32)    | 9.9848 GFLOPS    |
| FP_DP           | scalar        | fmadd(f64,f64,f64)    | 9.979 GFLOPS     |
------------------------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0,2,4,6]
Number Threads: 4
Thread Pool Binding: 0 2 4 6
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| LASX            | 256b          | fmadd(f32,f32,f32)    | 319.54 GFLOPS    |
| LASX            | 256b          | fmadd(f64,f64,f64)    | 159.71 GFLOPS    |
| LASX            | 256b          | add(mul(f32,f32),f32) | 319.15 GFLOPS    |
| LASX            | 256b          | add(mul(f64,f64),f64) | 159.61 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| LSX             | 128b          | fmadd(f32,f32,f32)    | 159.75 GFLOPS    |
| LSX             | 128b          | fmadd(f64,f64,f64)    | 79.876 GFLOPS    |
| LSX             | 128b          | add(mul(f32,f32),f32) | 159.56 GFLOPS    |
| LSX             | 128b          | add(mul(f64,f64),f64) | 79.751 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| FP_SP           | scalar        | fmadd(f32,f32,f32)    | 39.937 GFLOPS    |
| FP_DP           | scalar        | fmadd(f64,f64,f64)    | 39.937 GFLOPS    |
------------------------------------------------------------------------------
</pre>

