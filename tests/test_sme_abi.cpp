#include <arm_sme.h>
#include <stdint.h>

// Call a private-ZA, non-streaming entry point while the caller has live ZA.
// The compiler and SME runtime must preserve the caller's matrix and SM state.
extern "C" __arm_locally_streaming __arm_new("za")
bool test_sme_private_za(void (*kernel)(int64_t, void *))
{
    const svbool_t pg = svptrue_b32();
    svzero_za();
    svmopa_za32_f32_m(0, pg, pg, svdup_f32(2), svdup_f32(3));
    kernel(1, nullptr);
    float row[64]; // Maximum architectural SVL: 2048 bits / 32.
    svst1_hor_za32(0, 0, pg, row);
    for (uint64_t i = 0; i < svcntsw(); i++)
        if (row[i] != 6) return false;
    return true;
}

extern "C" uint64_t test_sme_svcr(void)
{
    uint64_t state;
    asm volatile("mrs %0, SVCR" : "=r"(state));
    return state;
}
