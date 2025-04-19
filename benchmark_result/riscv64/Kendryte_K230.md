# Kendryte K230

Setting: 2 C908 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| vector          | vfmacc.vf(f16,f16,f16) | 25.014 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 25.01 GFLOPS     |
| vector          | vfmacc.vf(f32,f32,f32) | 12.507 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 12.508 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 6.254 GFLOPS     |
| vector          | vfmacc.vv(f64,f64,f64) | 6.2541 GFLOPS    |
---------------------------------------------------------------
</pre>
