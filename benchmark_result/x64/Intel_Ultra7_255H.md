# Intel Ultra7 255H

Product Code Name: Arrow Lake-H

Setting: 6 Lion Cove P-Cores + 8 Skymont E-Cores + 2 (Unknown Arch) LPE-Cores

For single P-Core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 646.13 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 645.96 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 645.73 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 645.82 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 322.94 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 161.8 GFLOPS     |
| FMA             | 256b          | FMA(f64,f64,f64)      | 80.838 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 130.88 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 65.21 GFLOPS     |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 323.56 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 323.06 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 323.12 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 323.58 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 161.81 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 80.955 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 40.384 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 66.143 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 33.059 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 6 P-Cores:

<pre>
$ ./cpufp --thread_pool=[0-5]
Number Threads: 6
Thread Pool Binding: 0 1 2 3 4 5
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 3.4153 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 3.4161 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 3.4137 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 3.4114 TOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 1.7078 TOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 853.86 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 427.04 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 710.03 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 355.4 GFLOPS     |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 1.7044 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 1.7069 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 1.7069 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 1.7073 TOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 853.66 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 426.51 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 213.28 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 349.97 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 174.4 GFLOPS     |
------------------------------------------------------------------------------
</pre>

For single E-Core:

<pre>
$ ./cpufp --thread_pool=[6]
Number Threads: 1
Thread Pool Binding: 6
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 561.38 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 561.4 GOPS       |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 561.37 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 561.37 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 280.69 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 140.32 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 70.168 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 70.174 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 35.082 GFLOPS    |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 449.24 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 453.76 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 449.17 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 449.48 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 226.99 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 112.3 GFLOPS     |
| FMA             | 128b          | FMA(f64,f64,f64)      | 56.145 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 70.108 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 35.042 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 8 E-Cores:

<pre>
$ ./cpufp --thread_pool=[6-13]
Number Threads: 8
Thread Pool Binding: 6 7 8 9 10 11 12 13
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 4.0953 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 4.077 TOPS       |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 4.0811 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 4.0752 TOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 2.0402 TOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 1.0194 TFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 509.81 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 509.51 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 255.04 GFLOPS    |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 3.2636 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 3.2998 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 3.2656 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 3.264 TOPS       |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 1.6492 TOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 816.2 GFLOPS     |
| FMA             | 128b          | FMA(f64,f64,f64)      | 407.77 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 506.71 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 254.04 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For single LPE-Core:

<pre>
$ ./cpufp --thread_pool=[14]
Number Threads: 1
Thread Pool Binding: 14
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 159.22 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 159.23 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 159.21 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 159.24 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 79.609 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 39.789 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 19.904 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 19.903 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 9.9514 GFLOPS    |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 159.1 GOPS       |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 159.17 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 159.23 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 159.23 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 79.619 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 39.806 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 19.904 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 19.903 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 9.9516 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 2 LPE-Cores:

<pre>
$ ./cpufp --thread_pool=[14,15]
Number Threads: 2
Thread Pool Binding: 14 15
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 318.42 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 318.46 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 318.4 GOPS       |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 318.46 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 159.19 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 79.613 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 39.804 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 39.793 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 19.905 GFLOPS    |
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 318.5 GOPS       |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 318.38 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 318.44 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 318.45 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 159.17 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 79.6 GFLOPS      |
| FMA             | 128b          | FMA(f64,f64,f64)      | 39.81 GFLOPS     |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 39.802 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 19.905 GFLOPS    |
------------------------------------------------------------------------------
</pre>

