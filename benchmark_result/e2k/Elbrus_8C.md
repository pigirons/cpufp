# Elbrus-8C

Setting: 4 Sockets x 8 Elbrus-v4

Frequency: 1.2 GHz

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v4              | ADD(MUL(f32,f32),f32) | 28.704 GFLOPS    |
| v4              | ADD(MUL(f64,f64),f64) | 14.353 GFLOPS    |
--------------------------------------------------------------
</pre>

For 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v4              | ADD(MUL(f32,f32),f32) | 229.42 GFLOPS    |
| v4              | ADD(MUL(f64,f64),f64) | 114.56 GFLOPS    |
--------------------------------------------------------------
</pre>

For 32 cores:

<pre>
$ ./cpufp --thread_pool=[0-31]
Number Threads: 32
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v4              | ADD(MUL(f32,f32),f32) | 896.58 GFLOPS    |
| v4              | ADD(MUL(f64,f64),f64) | 448.7 GFLOPS     |
--------------------------------------------------------------
</pre>
