# SpacemiT K3 

## Setting: 8 SpacemiT-X100 Cores

For single core:

<pre>
$ ./cpufp --thread_pool=[0]
Number Threads: 1
Thread Pool Binding: 0
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 613.46 GOPS      |
| ime             | vmadotu(u32,u8,u8)     | 613.47 GOPS      |
| ime             | vmadotus(s32,u8,s8)    | 613.47 GOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 613.5 GOPS       |
| ime             | vmadotslide(s32,s8,s8) | 613.46 GOPS      |
| vector          | vfmacc.vf(f16,f16,f16) | 76.686 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 76.685 GFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 38.343 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 38.343 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 19.171 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 19.151 GFLOPS    |
---------------------------------------------------------------
</pre>

For cluster 0, 4 cores:

<pre>
$ ./cpufp --thread_pool=[0-3]
Number Threads: 4
Thread Pool Binding: 0 1 2 3
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 2.4543 TOPS      |
| ime             | vmadotu(u32,u8,u8)     | 2.4544 TOPS      |
| ime             | vmadotus(s32,u8,s8)    | 2.4546 TOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 2.4543 TOPS      |
| ime             | vmadotslide(s32,s8,s8) | 2.4548 TOPS      |
| vector          | vfmacc.vf(f16,f16,f16) | 306.77 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 306.8 GFLOPS     |
| vector          | vfmacc.vf(f32,f32,f32) | 153.2 GFLOPS     |
| vector          | vfmacc.vv(f32,f32,f32) | 153.4 GFLOPS     |
| vector          | vfmacc.vf(f64,f64,f64) | 76.699 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 76.692 GFLOPS    |
---------------------------------------------------------------
</pre>

For 2 clusters, 8 cores:

<pre>
$ ./cpufp --thread_pool=[0-7]
Number Threads: 8
Thread Pool Binding: 0 1 2 3 4 5 6 7
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 4.9095 TOPS      |
| ime             | vmadotu(u32,u8,u8)     | 4.9096 TOPS      |
| ime             | vmadotus(s32,u8,s8)    | 4.9091 TOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 4.9095 TOPS      |
| ime             | vmadotslide(s32,s8,s8) | 4.9099 TOPS      |
| vector          | vfmacc.vf(f16,f16,f16) | 613.76 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 613.68 GFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 306.87 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 306.77 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 153.43 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 153.42 GFLOPS    |
---------------------------------------------------------------
</pre>

## Setting: 8 SpacemiT-A100 Cores

For single core:

<pre>
$ ai ./cpufp --thread_pool=[8]
Number Threads: 1
Thread Pool Binding: 8
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 4.0849 TOPS      |
| ime             | vmadotu(u32,u8,u8)     | 4.0851 TOPS      |
| ime             | vmadotus(s32,u8,s8)    | 4.0853 TOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 4.0853 TOPS      |
| ime             | vmadotslide(s32,s8,s8) | 4.085 TOPS       |
| vector          | vfmacc.vf(f16,f16,f16) | 127.67 GFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 127.67 GFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 63.838 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 63.835 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 15.959 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 15.959 GFLOPS    |
---------------------------------------------------------------
</pre>

For 2 clusters, 8 cores:

<pre>
$ ai ./cpufp --thread_pool=[8-15]
Number Threads: 8
Thread Pool Binding: 8 9 10 11 12 13 14 15
---------------------------------------------------------------
| Instruction Set | Core Computation       | Peak Performance |
| ime             | vmadot(s32,s8,s8)      | 16.361 TOPS      |
| ime             | vmadotu(u32,u8,u8)     | 16.361 TOPS      |
| ime             | vmadotus(s32,u8,s8)    | 16.361 TOPS      |
| ime             | vmadotsu(s32,s8,u8)    | 16.362 TOPS      |
| ime             | vmadotslide(s32,s8,s8) | 16.362 TOPS      |
| vector          | vfmacc.vf(f16,f16,f16) | 1.0208 TFLOPS    |
| vector          | vfmacc.vv(f16,f16,f16) | 1.0219 TFLOPS    |
| vector          | vfmacc.vf(f32,f32,f32) | 510.94 GFLOPS    |
| vector          | vfmacc.vv(f32,f32,f32) | 510.97 GFLOPS    |
| vector          | vfmacc.vf(f64,f64,f64) | 127.71 GFLOPS    |
| vector          | vfmacc.vv(f64,f64,f64) | 127.74 GFLOPS    |
---------------------------------------------------------------
</pre>