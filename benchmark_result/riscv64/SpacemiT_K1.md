# SpacemiT K1

Setting: 8 SpacemiT-X60 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 511.53 GOPS      |
| ime             | vmadotu(u32,u8,u8)     | 511.5 GOPS       |
| ime             | vmadotus(s32,u8,s8)    | 511.53 GOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 511.51 GOPS      |
| ime             | vmadotslide(s32,s8,s8) | 511.51 GOPS      |
| vector          | vfmacc.vf(f16,f16,f16) | 66.722 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 63.936 GFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 33.36 GFLOPS     |
| vector          | vfmacc.vv(f32,f32,f32) | 31.968 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 16.679 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 15.985 GFLOPS    |
---------------------------------------------------------------
</pre>

For cluster 0(with ime extension), 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 2.046 TOPS       |
| ime             | vmadotu(u32,u8,u8)     | 2.0462 TOPS      |
| ime             | vmadotus(s32,u8,s8)    | 2.0461 TOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 2.0462 TOPS      |
| ime             | vmadotslide(s32,s8,s8) | 2.0461 TOPS      |
| vector          | vfmacc.vf(f16,f16,f16) | 266.88 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 255.75 GFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 133.43 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 127.85 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 66.709 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 63.935 GFLOPS    |
---------------------------------------------------------------
</pre>

For 2 clusters, 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| vector          | vfmacc.vf(f16,f16,f16) | 533.65 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 511.45 GFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 266.89 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 255.75 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 133.42 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 127.86 GFLOPS    |
---------------------------------------------------------------
</pre>
