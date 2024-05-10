# E2K CPU benchmark results

## Elbrus-8C2 1.2 GHz

Setting: 4 Sockets x 8 Elbrus-v5

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v5              | ADD(MUL(f32,f32),f32) | 57.413 GFLOPS    |
| v5              | ADD(MUL(f64,f64),f64) | 28.707 GFLOPS    |
| v4              | ADD(MUL(f32,f32),f32) | 28.727 GFLOPS    |
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
| v5              | ADD(MUL(f32,f32),f32) | 459.61 GFLOPS    |
| v5              | ADD(MUL(f64,f64),f64) | 229.72 GFLOPS    |
| v4              | ADD(MUL(f32,f32),f32) | 229.76 GFLOPS    |
| v4              | ADD(MUL(f64,f64),f64) | 114.89 GFLOPS    |
--------------------------------------------------------------
</pre>

For 32 cores:

<pre>
$ ./cpufp --thread_pool=[0-31]
Number Threads: 32
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| v5              | ADD(MUL(f32,f32),f32) | 1.835 TFLOPS     |
| v5              | ADD(MUL(f64,f64),f64) | 917.64 GFLOPS    |
| v4              | ADD(MUL(f32,f32),f32) | 917.56 GFLOPS    |
| v4              | ADD(MUL(f64,f64),f64) | 458.77 GFLOPS    |
--------------------------------------------------------------
</pre>

## Elbrus-8C 1.2 GHz

Setting: 4 Sockets x 8 Elbrus-v4

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

## Elbrus-4C 750 MHz

Setting: 4 Sockets x 4 Elbrus-v3

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
