# Elbrus-4C

Setting: 4 Sockets x 4 Elbrus-v3

Freqency: 750 MHz

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v1              | ADD(MUL(f32,f32),f32) | 11.939 GFLOPS    |
| v1              | ADD(MUL(f64,f64),f64) | 5.9801 GFLOPS    |
--------------------------------------------------------------
</pre>

For 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v1              | ADD(MUL(f32,f32),f32) | 47.704 GFLOPS    |
| v1              | ADD(MUL(f64,f64),f64) | 23.913 GFLOPS    |
--------------------------------------------------------------
</pre>

For 16 cores:

<pre>
$ ./cpufp --thread_pool=[0-15]
Number Threads: 16
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v1              | ADD(MUL(f32,f32),f32) | 189.81 GFLOPS    |
| v1              | ADD(MUL(f64,f64),f64) | 95.294 GFLOPS    |
--------------------------------------------------------------
</pre>
