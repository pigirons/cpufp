# Intel Ultra7 255H

Product Code Name: Arrow Lake-H

Setting: 6 Lion Cove P-Cores + 8 Skymont E-Cores + 2 (Unknown Arch) LPE-Cores

For single P-Core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 645.85 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 323.52 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,s8)       | 645.68 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,u8)       | 645.64 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,u8,u8)       | 646.57 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 161.5 GFLOPS     |
| FMA             | FMA(f64,f64,f64)      | 80.824 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 134.82 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 67.404 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 67.535 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 33.785 GFLOPS    |
--------------------------------------------------------------
</pre>

For 6 P-Cores:

<pre>
$ ./cpufp --thread_pool=[0-5]
Number Threads: 6
Thread Pool Binding: 0 1 2 3 4 5
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 3.3865 TOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 1.7065 TOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,s8)       | 3.3983 TOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,u8)       | 3.4168 TOPS      |
| AVX_VNNI_INT8   | DP4A(s32,u8,u8)       | 3.3996 TOPS      |
| FMA             | FMA(f32,f32,f32)      | 847.36 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 428.26 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 709.43 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 352.7 GFLOPS     |
| SSE             | ADD(MUL(f32,f32),f32) | 357.3 GFLOPS     |
| SSE2            | ADD(MUL(f64,f64),f64) | 175.87 GFLOPS    |
--------------------------------------------------------------
</pre>

For single E-Core:

<pre>
$ ./cpufp --thread_pool=[6]
Number Threads: 1
Thread Pool Binding: 6
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 560.96 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 280.61 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,s8)       | 561.25 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,u8)       | 561.2 GOPS       |
| AVX_VNNI_INT8   | DP4A(s32,u8,u8)       | 561.41 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 140.34 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 70.146 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 70.156 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 35.078 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 70.08 GFLOPS     |
| SSE2            | ADD(MUL(f64,f64),f64) | 35.039 GFLOPS    |
--------------------------------------------------------------
</pre>

For 8 E-Cores:

<pre>
$ ./cpufp --thread_pool=[6-13]
Number Threads: 8
Thread Pool Binding: 6 7 8 9 10 11 12 13
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 4.1365 TOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 2.0816 TOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,s8)       | 4.1632 TOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,u8)       | 4.156 TOPS       |
| AVX_VNNI_INT8   | DP4A(s32,u8,u8)       | 4.1675 TOPS      |
| FMA             | FMA(f32,f32,f32)      | 1.0423 TFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 521.02 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 521.08 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 260.49 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 519.53 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 260.87 GFLOPS    |
--------------------------------------------------------------
</pre>

For single LPE-Core:

<pre>
$ ./cpufp --thread_pool=[14]
Number Threads: 1
Thread Pool Binding: 14
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 158.95 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 79.533 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,s8)       | 159.1 GOPS       |
| AVX_VNNI_INT8   | DP4A(s32,s8,u8)       | 159.04 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,u8,u8)       | 159.05 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 39.74 GFLOPS     |
| FMA             | FMA(f64,f64,f64)      | 19.892 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 19.878 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 9.939 GFLOPS     |
| SSE             | ADD(MUL(f32,f32),f32) | 19.896 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 9.9386 GFLOPS    |
--------------------------------------------------------------
</pre>

For 2 LPE-Cores:

<pre>
$ ./cpufp --thread_pool=[14,15]
Number Threads: 2
Thread Pool Binding: 14 15
--------------------------------------------------------------
| Instruction Set | Core Computation      | Peak Performance |
| AVX_VNNI        | DP4A(s32,u8,s8)       | 317.85 GOPS      |
| AVX_VNNI        | DP2A(s32,s16,s16)     | 159.17 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,s8)       | 317.99 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,s8,u8)       | 318.21 GOPS      |
| AVX_VNNI_INT8   | DP4A(s32,u8,u8)       | 317.57 GOPS      |
| FMA             | FMA(f32,f32,f32)      | 79.563 GFLOPS    |
| FMA             | FMA(f64,f64,f64)      | 39.748 GFLOPS    |
| AVX             | ADD(MUL(f32,f32),f32) | 39.789 GFLOPS    |
| AVX             | ADD(MUL(f64,f64),f64) | 19.899 GFLOPS    |
| SSE             | ADD(MUL(f32,f32),f32) | 39.781 GFLOPS    |
| SSE2            | ADD(MUL(f64,f64),f64) | 19.877 GFLOPS    |
--------------------------------------------------------------
</pre>

