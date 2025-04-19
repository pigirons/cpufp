# Rockchip RK3399

Setting: 2 Cortex-A72(big) Cores + 4 Cortex-A53(Little) Cores

For single Little core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 11.255 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 11.255 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 5.6275 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 5.6277 GFLOPS    |
-------------------------------------------------------------
</pre>

For 4 Little cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 45.029 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 45.027 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 22.509 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 22.513 GFLOPS    |
-------------------------------------------------------------
</pre>

For single big core:

<pre>
$ ./cpufp --thread_pool=[4]
Number Threads: 1
Thread Pool Binding: 4
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 14.348 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 14.348 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 7.1744 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 7.1743 GFLOPS    |
-------------------------------------------------------------
</pre>

For 2 big cores:

<pre>
$ ./cpufp --thread_pool=[4,5]
Number Threads: 2
Thread Pool Binding: 4 5
-------------------------------------------------------------
| Instruction Set | Core Computation     | Peak Performance |
| asimd           | fmla.vs(f32,f32,f32) | 28.698 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32) | 28.698 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64) | 14.349 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64) | 14.347 GFLOPS    |
-------------------------------------------------------------
</pre>
