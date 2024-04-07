#include "table.hpp"
#include "smtl.hpp"

#include <unistd.h>
#include <cstdint>
#include <ctime>
#include <cstring>
#include <cstdint>
#include <vector>
#include <sstream>
#include <iomanip>

#if defined(_AMX_INT8_) || defined(_AMX_BF16_)
#include <sys/syscall.h>
#define _AMX_TILE_
#endif

using namespace std;

extern "C"
{
#ifdef _SSE_
    void sse_add_mul_f32f32_f32(int64_t, void *params);
#endif

#ifdef _SSE2_
    void sse2_add_mul_f64f64_f64(int64_t, void *params);
#endif

#ifdef _AVX_
    void avx_add_mul_f32f32_f32(int64_t, void *params);
    void avx_add_mul_f64f64_f64(int64_t, void *params);
#endif

#ifdef _FMA_
    void fma_f32f32f32(int64_t, void *params);
    void fma_f64f64f64(int64_t, void *params);
#endif

#ifdef _AVX512F_
    void avx512f_fma_f32f32f32(int64_t, void *params);
    void avx512f_fma_f64f64f64(int64_t, void *params);
#endif

#ifdef _AVX512_BF16_
    void avx512_bf16_dp2a_f32bf16bf16(int64_t, void *params);
#endif

#ifdef _AVX512_FP16_
    void avx512_fp16_fma_f16f16f16(int64_t, void *params);
#endif

#ifdef _AVX512_VNNI_
    void avx512_vnni_dp4a_s32u8s8(int64_t, void *params);
    void avx512_vnni_dp2a_s32s16s16(int64_t, void *params);
#endif

#ifdef _AVX_VNNI_
    void avx_vnni_dp4a_s32u8s8(int64_t, void *params);
    void avx_vnni_dp2a_s32s16s16(int64_t, void *params);
#endif

#ifdef _AVX_VNNI_INT8_
    void avx_vnni_int8_dp4a_s32s8s8(int64_t, void *params);
    void avx_vnni_int8_dp4a_s32s8u8(int64_t, void *params);
    void avx_vnni_int8_dp4a_s32u8u8(int64_t, void *params);
#endif

#ifdef _AMX_INT8_
    void amx_int8_mm_s32s8s8(int64_t, void* tile_cfg);
    void amx_int8_mm_s32s8u8(int64_t, void* tile_cfg);
    void amx_int8_mm_s32u8s8(int64_t, void* tile_cfg);
    void amx_int8_mm_s32u8u8(int64_t, void* tile_cfg);
#endif
#ifdef _AMX_BF16_
    void amx_bf16_mm_f32bf16bf16(int64_t, void* tile_cfg);
#endif
}

#ifdef _AMX_TILE_
struct
{
    uint8_t palette_id;
    uint8_t start_row;
    uint8_t reserved_0[14];
    uint16_t colsb[16];
    uint8_t rows[16];
} __tilecfg;

void init_tile_cfg()
{
    int i;
    __tilecfg.palette_id = 1;
    __tilecfg.start_row = 0;
    for (i = 0; i < 14; i++)
    {
        __tilecfg.reserved_0[i] = 0;
    }
    for (i = 0; i < 8; i++)
    {
        __tilecfg.colsb[i] = 64;
        __tilecfg.rows[i] = 16;
    }
    for (; i < 16; i++)
    {
        __tilecfg.colsb[i] = 0;
        __tilecfg.rows[i] = 0;
    }
}
#endif

typedef struct
{
    std::string isa;
    std::string type;
    std::string dim;
    int64_t loop_time;
    int64_t comp_pl;
    void *params;
    void (*bench)(int64_t, void*);
} cpubm_t;
static vector<cpubm_t> bm_list;

static double get_time(struct timespec *start,
    struct timespec *end)
{
    return end->tv_sec - start->tv_sec +
        (end->tv_nsec - start->tv_nsec) * 1e-9;
}

static void reg_new_isa(std::string isa,
    std::string type,
    std::string dim,
    int64_t loop_time,
    int64_t comp_pl,
    void *params,
    void (*bench)(int64_t, void*))
{
    cpubm_t new_one;
    new_one.isa = isa;
    new_one.type = type;
    new_one.dim = dim;
    new_one.loop_time = loop_time;
    new_one.comp_pl = comp_pl;
    new_one.params = params;
    new_one.bench = bench;

    bm_list.push_back(new_one);
}

static void thread_func(void *params)
{
    cpubm_t *bm = (cpubm_t*)params;
    if (bm->params)
    {
        bm->bench(bm->loop_time, bm->params);
    }
    else
    {
        bm->bench(bm->loop_time, NULL);
    }
}

static void cpubm_x64_one(smtl_handle sh,
    cpubm_t &item,
    Table &table)
{
    struct timespec start, end;
    double time_used, perf;
    char perfUnit = 'G';

    int i;
    int num_threads = smtl_num_threads(sh);

    // warm up
    for (i = 0; i < num_threads; i++)
    {
        smtl_add_task(sh, thread_func, (void*)&item);
    }
    smtl_begin_tasks(sh);
    smtl_wait_tasks_finished(sh);

    clock_gettime(CLOCK_MONOTONIC_RAW, &start);
    for (i = 0; i < num_threads; i++)
    {
        smtl_add_task(sh, thread_func, (void*)&item);
    }
    smtl_begin_tasks(sh);
    smtl_wait_tasks_finished(sh);
    clock_gettime(CLOCK_MONOTONIC_RAW, &end);

    time_used = get_time(&start, &end);
    perf = item.loop_time * item.comp_pl * num_threads /
        time_used;
    if (perf > 1e12)
    {
        perfUnit = 'T';
        perf /= 1e12;
    }
    else
    {
        perf /= 1e9;
    }

    stringstream ss;
    ss << std::setprecision(5) << perf << " " << perfUnit << item.dim;

    vector<string> cont;
    cont.resize(3);
    cont[0] = item.isa;
    cont[1] = item.type;
    cont[2] = ss.str();
    table.addOneItem(cont);
}

static void cpubm_do_bench(std::vector<int> &set_of_threads,
    uint32_t idle_time)
{
    int i;

    if (bm_list.size() > 0)
    {
        int num_threads = set_of_threads.size();

        printf("Number Threads: %d\n", num_threads);
        printf("Thread Pool Binding:");
        for (i = 0; i < num_threads; i++)
        {
            printf(" %d", set_of_threads[i]);
        }
        printf("\n");

        // set table head
        vector<string> ti;
        ti.resize(3);
        ti[0] = "Instruction Set";
        ti[1] = "Core Computation";
        ti[2] = "Peak Performance";

        Table table;
        table.setColumnNum(3);
        table.addOneItem(ti);

        // set thread pool
        smtl_handle sh;
        smtl_init(&sh, set_of_threads);

        // traverse task list
        cpubm_x64_one(sh, bm_list[0], table);
        for (i = 1; i < bm_list.size(); i++)
        {
            sleep(idle_time);
            cpubm_x64_one(sh, bm_list[i], table);
        }

        table.print();

        smtl_fini(sh);
    }
}

static void parse_thread_pool(char *sets,
    vector<int> &set_of_threads)
{
    if (sets[0] != '[')
    {
        return;
    }
    int pos = 1;
    int left = 0, right = 0;
    int state = 0;
    while (sets[pos] != ']' && sets[pos] != '\0')
    {
        if (state == 0)
        {
            if (sets[pos] >= '0' && sets[pos] <= '9')
            {
                left *= 10;
                left += (int)(sets[pos] - '0');
            }
            else if (sets[pos] == ',')
            {
                set_of_threads.push_back(left);
                left = 0;
            }
            else if (sets[pos] == '-')
            {
                right = 0;
                state = 1;
            }
        }
        else if (state == 1)
        {
            if (sets[pos] >= '0' && sets[pos] <= '9')
            {
                right *= 10;
                right += (int)(sets[pos] - '0');
            }
            else if (sets[pos] == ',')
            {
                int i;
                for (i = left; i <= right; i++)
                {
                    set_of_threads.push_back(i);
                }
                left = 0;
                state = 0;
            }
        }
        pos++;
    }
    if (sets[pos] != ']')
    {
        return;
    }
    if (state == 0)
    {
        set_of_threads.push_back(left);
    }
    else if (state == 1)
    {
        int i;
        for (i = left; i <= right; i++)
        {
            set_of_threads.push_back(i);
        }
    }
}

static void cpufp_register_isa()
{
#ifdef _AMX_TILE_
    init_tile_cfg();
    syscall(SYS_arch_prctl, 0x1023, 18);
#endif

#ifdef _AMX_INT8_
    reg_new_isa("AMX_INT8", "MM(s32,s8,s8)", "OPS",
        0x2500000LL, 131072LL, &__tilecfg, amx_int8_mm_s32s8s8);
    reg_new_isa("AMX_INT8", "MM(s32,s8,u8)", "OPS",
        0x2500000LL, 131072LL, &__tilecfg, amx_int8_mm_s32s8u8);
    reg_new_isa("AMX_INT8", "MM(s32,u8,s8)", "OPS",
        0x2500000LL, 131072LL, &__tilecfg, amx_int8_mm_s32u8s8);
    reg_new_isa("AMX_INT8", "MM(s32,u8,u8)", "OPS",
        0x2500000LL, 131072LL, &__tilecfg, amx_int8_mm_s32u8u8);
#endif

#ifdef _AMX_BF16_
    reg_new_isa("AMX_BF16", "MM(f32,bf16,bf16)", "FLOPS",
        0x2500000LL, 65536LL, &__tilecfg, amx_bf16_mm_f32bf16bf16);
#endif

#ifdef _AVX512_VNNI_
    reg_new_isa("AVX512_VNNI", "DP4A(s32,u8,s8)", "OPS",
        0x20000000LL, 2048LL, NULL, avx512_vnni_dp4a_s32u8s8);
    reg_new_isa("AVX512_VNNI", "DP2A(s32,s16,s16)", "OPS",
        0x20000000LL, 1024LL, NULL, avx512_vnni_dp2a_s32s16s16);
#endif

#ifdef _AVX_VNNI_
    reg_new_isa("AVX_VNNI", "DP4A(s32,u8,s8)", "OPS",
        0x20000000LL, 1024LL, NULL, avx_vnni_dp4a_s32u8s8);
    reg_new_isa("AVX_VNNI", "DP2A(s32,s16,s16)", "OPS",
        0x20000000LL, 512LL, NULL, avx_vnni_dp2a_s32s16s16);
#endif

#ifdef _AVX_VNNI_INT8_
    reg_new_isa("AVX_VNNI_INT8", "DP4A(s32,s8,s8)", "OPS",
        0x20000000LL, 1024LL, NULL, avx_vnni_int8_dp4a_s32s8s8);
    reg_new_isa("AVX_VNNI_INT8", "DP4A(s32,s8,u8)", "OPS",
        0x20000000LL, 1024LL, NULL, avx_vnni_int8_dp4a_s32s8u8);
    reg_new_isa("AVX_VNNI_INT8", "DP4A(s32,u8,u8)", "OPS",
        0x20000000LL, 1024LL, NULL, avx_vnni_int8_dp4a_s32u8u8);
#endif

#ifdef _AVX512_BF16_
    reg_new_isa("AVX512_BF16", "DP2A(f32,bf16,bf16)", "FLOPS",
        0x20000000LL, 1024LL, NULL, avx512_bf16_dp2a_f32bf16bf16);
#endif

#ifdef _AVX512_FP16_
    reg_new_isa("AVX512_FP16", "FMA(f16,f16,f16)", "FLOPS",
        0x20000000LL, 1024LL, NULL, avx512_fp16_fma_f16f16f16);
#endif

#ifdef _AVX512F_
    reg_new_isa("AVX512F", "FMA(f32,f32,f32)", "FLOPS",
        0x20000000LL, 512LL, NULL, avx512f_fma_f32f32f32);
    reg_new_isa("AVX512F", "FMA(f64,f64,f64)", "FLOPS",
        0x20000000LL, 256LL, NULL, avx512f_fma_f64f64f64);
#endif

#ifdef _FMA_
    reg_new_isa("FMA", "FMA(f32,f32,f32)", "FLOPS",
        0x20000000LL, 256LL, NULL, fma_f32f32f32);
    reg_new_isa("FMA", "FMA(f64,f64,f64)", "FLOPS",
        0x20000000LL, 128LL, NULL, fma_f64f64f64);
#endif

#ifdef _AVX_
    reg_new_isa("AVX", "ADD(MUL(f32,f32),f32)", "FLOPS",
        0x20000000LL, 128LL, NULL, avx_add_mul_f32f32_f32);
    reg_new_isa("AVX", "ADD(MUL(f64,f64),f64)", "FLOPS",
        0x20000000LL, 64LL, NULL, avx_add_mul_f64f64_f64);
#endif

#ifdef _SSE_
    reg_new_isa("SSE", "ADD(MUL(f32,f32),f32)", "FLOPS",
        0x20000000LL, 64LL, NULL, sse_add_mul_f32f32_f32);
#endif

#ifdef _SSE2_
    reg_new_isa("SSE2", "ADD(MUL(f64,f64),f64)", "FLOPS",
        0x20000000LL, 32LL, NULL, sse2_add_mul_f64f64_f64);
#endif
}

int main(int argc, char *argv[])
{
    vector<int> set_of_threads;
    uint32_t idle_time = 0;

    bool params_enough = false;

    int i;
    for (i = 1; i < argc; i++)
    {
        if (strncmp(argv[i], "--thread_pool=", 14) == 0)
        {
            parse_thread_pool(argv[i] + 14, set_of_threads);
            params_enough = true;
        }
        else if (strncmp(argv[i], "--idle_time=", 12) == 0)
        {
            idle_time = (uint32_t)atoi(argv[i] + 12);
        }
    }
    if (!params_enough)
    {
        fprintf(stderr, "Error: You must set --thread_pool parameter.\n");
        fprintf(stderr, "You may also set --idle_time parameter.\n");
        fprintf(stderr, "Usage: %s --thread_pool=[xxx] --idle_time=yyy\n", argv[0]);
        fprintf(stderr, "[xxx] indicates all cores to benchmark.\n");
        fprintf(stderr, "Example: [0,3,5-8,13-15].\n");
        fprintf(stderr, "idle_time is the interval time(s) between every two benchmarks.\n");
        fprintf(stderr, "idle_time parameter can be ignored, the default value is 0s.\n");
        fprintf(stderr, "Notice: there must NOT be any spaces.\n");
        exit(0);
    }

    cpufp_register_isa();
    cpubm_do_bench(set_of_threads, idle_time);

    return 0;
}

