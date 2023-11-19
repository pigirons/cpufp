#include "cpubm_x86.hpp"

#include <cstring>
#include <cstdint>
#include <vector>
using namespace std;

extern "C"
{
    void cpufp_kernel_x86_sse_add_mul_f32f32_f32(int64_t);
    void cpufp_kernel_x86_sse_add_mul_f64f64_f64(int64_t);

    void cpufp_kernel_x86_avx_add_mul_f32f32_f32(int64_t);
    void cpufp_kernel_x86_avx_add_mul_f64f64_f64(int64_t);

    void cpufp_kernel_x86_fma_f32f32f32(int64_t);
    void cpufp_kernel_x86_fma_f64f64f64(int64_t);

    void cpufp_kernel_x86_avx512f_fma_f32f32f32(int64_t);
    void cpufp_kernel_x86_avx512f_fma_f64f64f64(int64_t);

    void cpufp_kernel_x86_avx512_bf16_dp2a_f32bf16bf16(int64_t);

    void cpufp_kernel_x86_avx512_fp16_fma_f16f16f16(int64_t);

    void cpufp_kernel_x86_avx512_vnni_dp4a_s32u8s8(int64_t);
    void cpufp_kernel_x86_avx512_vnni_dp2a_s32s16s16(int64_t);

    void cpufp_kernel_x86_avx_vnni_dp4a_s32u8s8(int64_t);
    void cpufp_kernel_x86_avx_vnni_dp2a_s32s16s16(int64_t);

    void cpufp_kernel_x86_avx_vnni_int8_dp4a_s32s8s8(int64_t);
    void cpufp_kernel_x86_avx_vnni_int8_dp4a_s32s8u8(int64_t);
    void cpufp_kernel_x86_avx_vnni_int8_dp4a_s32u8u8(int64_t);
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

#include "cpufp_x86_incl.cpp"

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

