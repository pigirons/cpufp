#ifndef _CPUBM_X86_HPP
#define _CPUBM_X86_HPP

#include <string>
#include <vector>

void reg_new_isa(std::string isa,
    std::string type,
    std::string dim,
    int64_t loop_time,
    int64_t comp_pl,
    void (*bench)(int64_t));

void cpubm_do_bench(std::vector<int> &set_of_threads);

#endif

