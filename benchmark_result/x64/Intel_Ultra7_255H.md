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
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 647.06 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 646.81 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 647.17 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 646.86 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 323.05 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 161.55 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 80.961 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 132.12 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 66.11 GFLOPS     |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 323.03 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 323.55 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 323.24 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 323.2 GOPS       |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 161.58 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 80.786 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 40.381 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 67.709 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 33.791 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 6 P-Cores:

<pre>
$ ./cpufp --thread_pool=[0-5]
Number Threads: 6
Thread Pool Binding: 0 1 2 3 4 5
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 3.4864 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 3.4477 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 3.416 TOPS       |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 3.4142 TOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 1.7058 TOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 854.05 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 426.89 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 710.61 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 355.38 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 1.7078 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 1.7078 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 1.7081 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 1.7087 TOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 853.72 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 426.93 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 213.29 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 354.37 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 178.34 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For single E-Core:

<pre>
$ ./cpufp --thread_pool=[6]
Number Threads: 1
Thread Pool Binding: 6
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 561.38 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 561.39 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 561.43 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 561.43 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 280.72 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 140.35 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 70.175 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 70.177 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 35.089 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 449.23 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 449.91 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 449.35 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 449.5 GOPS       |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 224.62 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 113.49 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 56.793 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 70.099 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 35.043 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 8 E-Cores:

<pre>
$ ./cpufp --thread_pool=[6-13]
Number Threads: 8
Thread Pool Binding: 6 7 8 9 10 11 12 13
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 4.1754 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 4.1767 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 4.1732 TOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 4.1708 TOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 2.0668 TOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 1.029 TFLOPS     |
| FMA             | 256b          | FMA(f64,f64,f64)      | 513.76 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 511.26 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 254.99 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 3.26 TOPS        |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 3.2669 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 3.2702 TOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 3.2616 TOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 1.6311 TOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 824.83 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 412.47 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 509.08 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 254.62 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For single LPE-Core:

<pre>
$ ./cpufp --thread_pool=[14]
Number Threads: 1
Thread Pool Binding: 14
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 157.12 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 157 GOPS         |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 157.02 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 156.96 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 78.469 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 39.237 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 19.624 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 19.63 GFLOPS     |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 9.8176 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 156.93 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 157.11 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 156.99 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 156.87 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 78.453 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 39.312 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 19.628 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 19.615 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 9.8155 GFLOPS    |
------------------------------------------------------------------------------
</pre>

For 2 LPE-Cores:

<pre>
$ ./cpufp --thread_pool=[14,15]
Number Threads: 2
Thread Pool Binding: 14 15
------------------------------------------------------------------------------
| Instruction Set | Vector Length | Core Computation      | Peak Performance |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 256b          | DP4A(s32,u8,s8)       | 316.22 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,s8)       | 316.14 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,s8,u8)       | 315.76 GOPS      |
| AVX_VNNI_INT8   | 256b          | DP4A(s32,u8,u8)       | 316.06 GOPS      |
| AVX_VNNI        | 256b          | DP2A(s32,s16,s16)     | 158.13 GOPS      |
| FMA             | 256b          | FMA(f32,f32,f32)      | 79.052 GFLOPS    |
| FMA             | 256b          | FMA(f64,f64,f64)      | 39.483 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f32,f32),f32) | 39.472 GFLOPS    |
| AVX             | 256b          | ADD(MUL(f64,f64),f64) | 19.759 GFLOPS    |
|-----------------|---------------|-----------------------|------------------|
| AVX_VNNI        | 128b          | DP4A(s32,u8,s8)       | 315.74 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,s8)       | 316.01 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,s8,u8)       | 315.23 GOPS      |
| AVX_VNNI_INT8   | 128b          | DP4A(s32,u8,u8)       | 316.03 GOPS      |
| AVX_VNNI        | 128b          | DP2A(s32,s16,s16)     | 157.66 GOPS      |
| FMA             | 128b          | FMA(f32,f32,f32)      | 79.005 GFLOPS    |
| FMA             | 128b          | FMA(f64,f64,f64)      | 39.435 GFLOPS    |
| SSE             | 128b          | ADD(MUL(f32,f32),f32) | 39.406 GFLOPS    |
| SSE2            | 128b          | ADD(MUL(f64,f64),f64) | 19.723 GFLOPS    |
------------------------------------------------------------------------------
</pre>

