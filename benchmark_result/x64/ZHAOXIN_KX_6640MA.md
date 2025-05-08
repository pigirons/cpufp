# ZHAOXIN KX-6640MA

Architecture: LuJiaZui

Setting: 4 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX             | ADD(MUL(f32,f32),f32) | 13.825 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 5.1625 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 20.738 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 5.1844 GFLOPS    |
--------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX             | ADD(MUL(f32,f32),f32) | 46.638 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 17.449 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 70.102 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 17.511 GFLOPS    |
--------------------------------------------------------------
</pre>

