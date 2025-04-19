# HUAWEI Kunpeng 920 7260

Architecture: Taishan V110

Setting: 2 * 64 cores

For single core:

<pre>
$ ./cpufp --thread_pool=[1]
Number Threads: 1
Thread Pool Binding: 1
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 166.3 GOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 166.32 GOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 166.31 GOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 166.29 GOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 83.161 GFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 83.151 GFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 41.576 GFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 41.579 GFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 10.395 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 10.394 GFLOPS    |
----------------------------------------------------------------
</pre>

For 32 cores:

<pre>
$ ./cpufp --thread_pool=[0-31]
Number Threads: 32
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 5.304 TOPS       |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 5.3108 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 5.307 TOPS       |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 5.3123 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 2.6555 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 2.6564 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 1.3252 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 1.328 TFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 331.95 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 331.98 GFLOPS    |
----------------------------------------------------------------
</pre>

For 64 cores:

<pre>
$ ./cpufp --thread_pool=[0-63]
Number Threads: 64
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 10.601 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 10.586 TOPS      |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 10.587 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 10.593 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 5.2966 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 5.2975 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 2.6551 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 2.6557 TFLOPS    |
| asimd           | fmla.vs(f64,f64,f64)    | 663.98 GFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 663.73 GFLOPS    |
----------------------------------------------------------------
</pre>

For 128 cores:

<pre>
$ ./cpufp --thread_pool=[0-127]
Number Threads: 128
Thread Pool Binding: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
----------------------------------------------------------------
| Instruction Set | Core Computation        | Peak Performance |
| asimd_dp        | dp4a.vs(s32,s8,s8)      | 20.951 TOPS      |
| asimd_dp        | dp4a.vv(s32,s8,s8)      | 20.27 TOPS       |
| asimd_dp        | dp4a.vs(u32,u8,u8)      | 19.736 TOPS      |
| asimd_dp        | dp4a.vv(u32,u8,u8)      | 16.495 TOPS      |
| asimd_hp        | fmla.vs(fp16,fp16,fp16) | 10.481 TFLOPS    |
| asimd_hp        | fmla.vv(fp16,fp16,fp16) | 10.514 TFLOPS    |
| asimd           | fmla.vs(f32,f32,f32)    | 5.1993 TFLOPS    |
| asimd           | fmla.vv(f32,f32,f32)    | 4.117 TFLOPS     |
| asimd           | fmla.vs(f64,f64,f64)    | 1.2754 TFLOPS    |
| asimd           | fmla.vv(f64,f64,f64)    | 1.049 TFLOPS     |
----------------------------------------------------------------
</pre>
