#define _GPU_SOURCE

#include "table.h"

#include "smtl.h"

#include "cpuid_x86.h"
#include "cpubm_x86.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <time.h>

static double get_time(struct timespec *start,
	struct timespec *end)
{
	return end->tv_sec - start->tv_sec +
		(end->tv_nsec - start->tv_nsec) * 1e-9;
}

void cpufp_kernel_x86_sse_fp32(int64_t);
void cpufp_kernel_x86_sse_fp64(int64_t);

void cpufp_kernel_x86_avx_fp32(int64_t);
void cpufp_kernel_x86_avx_fp64(int64_t);

void cpufp_kernel_x86_fma_fp32(int64_t);
void cpufp_kernel_x86_fma_fp64(int64_t);

void cpufp_kernel_x86_avx512f_fp32(int64_t);
void cpufp_kernel_x86_avx512f_fp64(int64_t);

void cpufp_kernel_x86_avx512_vnni_int8(int64_t);
void cpufp_kernel_x86_avx512_vnni_int16(int64_t);

void cpufp_kernel_x86_avx_vnni_int8(int64_t);
void cpufp_kernel_x86_avx_vnni_int16(int64_t);

typedef struct
{
    cpuid_x86_feature_t isa;
    bm_type_t type;
    int64_t loop_time;
    int32_t comp_pl;
    void (*bench)(int64_t);
} cpubm_x86_t;

int bm_list_size = 0;
cpubm_x86_t cpubm_x86_list[6 * 8];

void cpu_benchmark_x86_init()
{
    cpuid_x86_init();
    
    bm_list_size = 0;

    if (cpuid_x86_support(_CPUID_X86_AVX512_VNNI_))
    {
        cpubm_x86_t s1 =
        {
            .isa = _CPUID_X86_AVX512_VNNI_,
            .type = _INT8_,
            .loop_time = 0x20000000LL,
            .comp_pl = 1280,
            .bench = cpufp_kernel_x86_avx512_vnni_int8,
        };
        cpubm_x86_t s2 =
        {
            .isa = _CPUID_X86_AVX512_VNNI_,
            .type = _INT16_,
            .loop_time = 0x20000000LL,
            .comp_pl = 640,
            .bench = cpufp_kernel_x86_avx512_vnni_int16,
        };
        cpubm_x86_list[bm_list_size++] = s1;
        cpubm_x86_list[bm_list_size++] = s2;
    }
    else if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_))
    {
        cpubm_x86_t s1 =
        {
            .isa = _CPUID_X86_AVX_VNNI_,
            .type = _INT8_,
            .loop_time = 0x20000000LL,
            .comp_pl = 640,
            .bench = cpufp_kernel_x86_avx_vnni_int8,
        };
        cpubm_x86_t s2 =
        {
            .isa = _CPUID_X86_AVX_VNNI_,
            .type = _INT16_,
            .loop_time = 0x20000000LL,
            .comp_pl = 320,
            .bench = cpufp_kernel_x86_avx_vnni_int16,
        };
        cpubm_x86_list[bm_list_size++] = s1;
        cpubm_x86_list[bm_list_size++] = s2;
    }
    
    if (cpuid_x86_support(_CPUID_X86_AVX512F_))
    {
        cpubm_x86_t s1 =
        {
            .isa = _CPUID_X86_AVX512F_,
            .type = _FP32_,
            .loop_time = 0x20000000LL,
            .comp_pl = 320,
            .bench = cpufp_kernel_x86_avx512f_fp32,
        };
        cpubm_x86_t s2 =
        {
            .isa = _CPUID_X86_AVX512F_,
            .type = _FP64_,
            .loop_time = 0x20000000LL,
            .comp_pl = 160,
            .bench = cpufp_kernel_x86_avx512f_fp64,
        };
        cpubm_x86_list[bm_list_size++] = s1;
        cpubm_x86_list[bm_list_size++] = s2;
    }

    if (cpuid_x86_support(_CPUID_X86_FMA_))
    {
        cpubm_x86_t s1 =
        {
            .isa = _CPUID_X86_FMA_,
            .type = _FP32_,
            .loop_time = 0x40000000LL,
            .comp_pl = 160,
            .bench = cpufp_kernel_x86_fma_fp32,
        };
        cpubm_x86_t s2 =
        {
            .isa = _CPUID_X86_FMA_,
            .type = _FP64_,
            .loop_time = 0x40000000LL,
            .comp_pl = 80,
            .bench = cpufp_kernel_x86_fma_fp64,
        };
        cpubm_x86_list[bm_list_size++] = s1;
        cpubm_x86_list[bm_list_size++] = s2;
    }

    if (cpuid_x86_support(_CPUID_X86_AVX_))
    {
        cpubm_x86_t s1 =
        {
            .isa = _CPUID_X86_AVX_,
            .type = _FP32_,
            .loop_time = 0x40000000LL,
            .comp_pl = 96,
            .bench = cpufp_kernel_x86_avx_fp32,
        };
        cpubm_x86_t s2 =
        {
            .isa = _CPUID_X86_AVX_,
            .type = _FP64_,
            .loop_time = 0x40000000LL,
            .comp_pl = 48,
            .bench = cpufp_kernel_x86_avx_fp64,
        };
        cpubm_x86_list[bm_list_size++] = s1;
        cpubm_x86_list[bm_list_size++] = s2;
    }

    if (cpuid_x86_support(_CPUID_X86_SSE_))
    {
        cpubm_x86_t s1 =
        {
            .isa = _CPUID_X86_SSE_,
            .type = _FP32_,
            .loop_time = 0x30000000LL,
            .comp_pl = 64,
            .bench = cpufp_kernel_x86_sse_fp32,
        };
        cpubm_x86_t s2 =
        {
            .isa = _CPUID_X86_SSE_,
            .type = _FP64_,
            .loop_time = 0x30000000LL,
            .comp_pl = 32,
            .bench = cpufp_kernel_x86_sse_fp64,
        };
        cpubm_x86_list[bm_list_size++] = s1;
        cpubm_x86_list[bm_list_size++] = s2;
    }
}

static void cpubm_x86_get_string(cpubm_x86_t *item,
    char **isa,
    char **type)
{
    if (item->isa == _CPUID_X86_AVX_VNNI_)
    {
        *isa = "AVX_VNNI";
    }
    else if (item->isa == _CPUID_X86_AVX512_VNNI_)
    {
        *isa = "AVX512_VNNI";
    }
    else if (item->isa == _CPUID_X86_AVX512F_)
    {
        *isa = "AVX512F";
    }
    else if (item->isa == _CPUID_X86_FMA_)
    {
        *isa = "FMA";
    }
    else if (item->isa == _CPUID_X86_AVX_)
    {
        *isa = "AVX";
    }
    else if (item->isa == _CPUID_X86_SSE_)
    {
        *isa = "SSE";
    }

    if (item->type == _FP64_)
    {
        *type = "fp64";
    }
    else if (item->type == _FP32_)
    {
        *type = "fp32";
    }
    else if (item->type == _INT8_)
    {
        *type = "int8";
    }
    else if (item->type == _INT16_)
    {
        *type = "int16";
    }
}

static void thread_func(void *params)
{
    cpubm_x86_t *bm = (cpubm_x86_t*)params;
    bm->bench(bm->loop_time);
}

static void cpubm_x86_one(smtl_handle sh,
    int list_idx,
    table_handle th)
{
    struct timespec start, end;
    double time_used, perf;

    cpubm_x86_t *item = cpubm_x86_list + list_idx;
    
    char *isa, *type, value[32];
    cpubm_x86_get_string(item, &isa, &type);

    int i;
    int num_threads = smtl_num_threads(sh);

	// warm up
	for (i = 0; i < num_threads; i++)
	{
		smtl_add_task(sh, thread_func, (void*)item);
	}
	smtl_begin_tasks(sh);
	smtl_wait_tasks_finished(sh);

	clock_gettime(CLOCK_MONOTONIC_RAW, &start);
	for (i = 0; i < num_threads; i++)
	{
		smtl_add_task(sh, thread_func, (void*)item);
	}
	smtl_begin_tasks(sh);
	smtl_wait_tasks_finished(sh);
	clock_gettime(CLOCK_MONOTONIC_RAW, &end);

	time_used = get_time(&start, &end);
	perf = item->loop_time * item->comp_pl * num_threads / time_used * 1e-9;
    
    char gflops_str[] = "GFLOPS", gops_str[] = "GOPS";
    if (item->type == _FP64_ || item->type == _FP32_ ||
        item->type == _FP16_ || item->type == _BF16_)
    {
        sprintf(value, "%.4lf %s", perf, gflops_str);
    }
    else if (item->type == _INT64_ || item->type == _INT32_ ||
        item->type == _INT16_ || item->type == _INT8_)
    {
        sprintf(value, "%.4lf %s", perf, gops_str);
    }

    set_table_content(th, list_idx + 1, 0, isa);
    set_table_content(th, list_idx + 1, 1, type);
    set_table_content(th, list_idx + 1, 2, value);
}

void cpu_benchmark_x86_do(int num_threads,
    int *set_of_threads)
{
    int i;
    
    printf("Number Threads: %d\n", num_threads);
    printf("Thread Pool Binding:");
    for (i = 0; i < num_threads; i++)
    {
        printf(" %d", set_of_threads[i]);
    }
    printf("\n");

    // set table head
    table_handle th;
    create_table(&th);
    
    set_table_size(th, bm_list_size + 1, 3);
    set_table_content(th, 0, 0, "Instruction Set");
    set_table_content(th, 0, 1, "Data Type");
    set_table_content(th, 0, 2, "Peak Performance");

    // set thread pool
    smtl_handle sh;
	smtl_init(&sh, num_threads, set_of_threads);

    // traverse task list
    for (i = 0; i < bm_list_size; i++)
    {
        cpubm_x86_one(sh, i, th);
    }

    print_table(th);
    delete_table(th);

    smtl_fini(sh);
}

