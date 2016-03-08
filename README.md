# cpufp


This is a cpu tool for testing the floating-points peak performance. Now it supports linux and x86-64 platform. It can automatically recognize the x86 instruction sets and select the proper set to do test.


build:

sh build.sh


test:

./cpufp num_cores


clean:

sh clean.sh


Example on Intel i7 4790K(Haswell, 4 cores, 8 threads, fixed at 4GHz):

$ ./cpufp 1

Core used: 1

FP32 perf: 127.8892 GFLOPS.

FP64 perf: 63.9466 GFLOPS.

$ ./cpufp 2

Core used: 2

FP32 perf: 255.7734 GFLOPS.

FP64 perf: 127.8866 GFLOPS.

$ ./cpufp 4

Core used: 4

FP32 perf: 511.5616 GFLOPS.

FP64 perf: 255.7780 GFLOPS.

$ ./cpufp 8

Core used: 8

FP32 perf: 511.5075 GFLOPS.

FP64 perf: 255.7590 GFLOPS.


The next version may support ARMv7 and ARMv8 architectures.

Welcome for bug reporting.

