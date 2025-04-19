# Broadcom BCM2711(RaspBerry Pi 4)

Setting: 4 Cortex-A72 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 11.958 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 11.958 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 5.9792 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 5.9792 GFLOPS    |
-------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 47.883 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 47.88 GFLOPS     |
| asimd           | fmla.vs(f64,f64,f64) | 23.933 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 23.943 GFLOPS    |
-------------------------------------------------------------
</pre>
