#ifndef _CPUBM_X86_H
#define _CPUBM_X86_H

typedef enum
{
    _INT64_ = 0x1,
    _INT32_ = 0x2,
    _INT16_ = 0x3,
    _INT8_  = 0x4,
    _FP64_  = 0x101,
    _FP32_  = 0x102,
    _FP16_  = 0x103,
    _BF16_  = 0x111,
} bm_type_t;

void cpu_benchmark_x86_init();

void cpu_benchmark_x86_do(int num_threads,
    int *set_of_threads);

#endif

