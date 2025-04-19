# Phytium D2000/8

Setting: 8 FTC663 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 18.376 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 18.375 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 9.1877 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 9.1891 GFLOPS    |
-------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 73.51 GFLOPS     |
| asimd           | fmla.vv(f32,f32,f32) | 73.51 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64) | 36.755 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 36.747 GFLOPS    |
-------------------------------------------------------------
</pre>
