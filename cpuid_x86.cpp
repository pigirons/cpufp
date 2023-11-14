#include <fstream>

using namespace std;

typedef enum
{
    _CPUID_X86_SSE_           = 0x1,
    _CPUID_X86_AVX_           = 0x2,
    _CPUID_X86_FMA_           = 0x4,
    _CPUID_X86_AVX512F_       = 0x8,
    _CPUID_X86_AVX512_VNNI_   = 0x10,
    _CPUID_X86_AVX_VNNI_      = 0x20,
    _CPUID_X86_AVX_VNNI_INT8_ = 0x40,
    _CPUID_X86_AVX512_BF16_   = 0x80,
    _CPUID_X86_AVX512_FP16_   = 0x100,
} cpuid_x86_feature_t;

struct cpuid_t
{
    unsigned int ieax;
    unsigned int iecx;
    unsigned int eax;
    unsigned int ebx;
    unsigned int ecx;
    unsigned int edx;
};

static unsigned int feat = 0;

#define BIT_TEST(bit_map, pos) (((bit_map) & (0x1 << (pos))) ? 1 : 0)
#define SET_FEAT(feat_mask) { feat |= (feat_mask); }

static void cpuid_x86_exec(struct cpuid_t *cpuid)
{
    asm volatile("pushq %%rbx\n"
        "cpuid\n"
        "movl %%ebx, %1\n"
        "popq %%rbx\n"
        : "=a"(cpuid->eax), "=r"(cpuid->ebx), "=c"(cpuid->ecx), "=d"(cpuid->edx)
        : "a"(cpuid->ieax), "c"(cpuid->iecx)
        : "cc");
}

static void cpuid_x86_init()
{
    struct cpuid_t cpuid;

    if (feat != 0)
    {
        return;
    }

    /*
     * Test SSE/AVX/FMA
     */
    cpuid.ieax = 0x1;
    cpuid.iecx = 0x0;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.edx, 25))
    {
        SET_FEAT(_CPUID_X86_SSE_);
    }
    if (BIT_TEST(cpuid.ecx, 28))
    {
        SET_FEAT(_CPUID_X86_AVX_);
    }
    if (BIT_TEST(cpuid.ecx, 12))
    {
        SET_FEAT(_CPUID_X86_FMA_);
    }

    /*
     * Test AVX512F/AVX512_VNNI/AVX512_FP16
     */
    cpuid.ieax = 0x7;
    cpuid.iecx = 0x0;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.ebx, 16))
    {
        SET_FEAT(_CPUID_X86_AVX512F_);
    }
    if (BIT_TEST(cpuid.ecx, 11))
    {
        SET_FEAT(_CPUID_X86_AVX512_VNNI_);
    }
    if (BIT_TEST(cpuid.edx, 23))
    {
        SET_FEAT(_CPUID_X86_AVX512_FP16_);
    }
    
    /*
     * Test AVX_VNNI/AVX_VNNI_INT8/AVX512_BF16
     */
    cpuid.ieax = 0x7;
    cpuid.iecx = 0x1;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.eax, 4))
    {
        SET_FEAT(_CPUID_X86_AVX_VNNI_);
    }
    if (BIT_TEST(cpuid.eax, 5))
    {
        SET_FEAT(_CPUID_X86_AVX512_BF16_);
    }
    if (BIT_TEST(cpuid.edx, 4))
    {
        SET_FEAT(_CPUID_X86_AVX_VNNI_INT8_);
    }
}

static int cpuid_x86_support(cpuid_x86_feature_t isa)
{
    return ((feat & isa) != 0);
}

void gen_build_kernel_sh()
{
    ofstream bf("build_kernel.sh");
    if (cpuid_x86_support(_CPUID_X86_SSE_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_sse.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_FMA_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_fma.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512F_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx512f.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_VNNI_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx512_vnni.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx_vnni.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_INT8_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx_vnni_int8.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_BF16_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx512_bf16.S" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_FP16_))
    {
        bf << "g++ -c asm/cpufp_kernel_x86_avx512_fp16.S" << endl;
    }
    bf.close();
}

void gen_cpufp_include_cpp()
{
    ofstream cf("cpufp_x86_incl.cpp");
    cf << "static void cpufp_register_isa()" << endl << "{" << endl;
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_))
    {
        cf << "    reg_new_isa(\"AVX_VNNI\", \"DP4A(s32,u8,s8)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_dp4a_s32u8s8);" << endl;
        cf << "    reg_new_isa(\"AVX_VNNI\", \"DP2A(s32,s16,s16)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 512LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_dp2a_s32s16s16);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_INT8_))
    {
        cf << "    reg_new_isa(\"AVX_VNNI_INT8\", \"DP4A(s32,s8,s8)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_int8_dp4a_s32s8s8);" << endl;
        cf << "    reg_new_isa(\"AVX_VNNI_INT8\", \"DP4A(s32,s8,u8)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_int8_dp4a_s32s8u8);" << endl;
        cf << "    reg_new_isa(\"AVX_VNNI_INT8\", \"DP4A(s32,u8,u8)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_int8_dp4a_s32u8u8);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_VNNI_))
    {
        cf << "    reg_new_isa(\"AVX512_VNNI\", \"DP4A(s32,u8,s8)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 2048LL," << endl;
        cf << "        cpufp_kernel_x86_avx512_vnni_dp4a_s32u8s8);" << endl;
        cf << "    reg_new_isa(\"AVX512_VNNI\", \"DP2A(s32,s16,s16)\", \"GOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx512_vnni_dp2a_s32s16s16);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_BF16_))
    {
        cf << "    reg_new_isa(\"AVX512_BF16\", \"DP2A(f32,bf16,bf16)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx512_bf16_dp2a_f32bf16bf16);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_FP16_))
    {
        cf << "    reg_new_isa(\"AVX512_FP16\", \"FMA(f16,f16,f16)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 1024LL," << endl;
        cf << "        cpufp_kernel_x86_avx512f_fp16_fma_f16f16f16);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_FMA_))
    {
        cf << "    reg_new_isa(\"FMA\", \"FMA(f32,f32,f32)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 256LL," << endl;
        cf << "        cpufp_kernel_x86_fma_f32f32f32);" << endl;
        cf << "    reg_new_isa(\"FMA\", \"FMA(f64,f64,f64)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 128LL," << endl;
        cf << "        cpufp_kernel_x86_fma_f64f64f64);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_))
    {
        cf << "    reg_new_isa(\"AVX\", \"ADD(MUL(f32,f32),f32)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 96LL," << endl;
        cf << "        cpufp_kernel_x86_avx_add_mul_f32f32_f32);" << endl;
        cf << "    reg_new_isa(\"AVX\", \"ADD(MUL(f64,f64),f64)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 48LL," << endl;
        cf << "        cpufp_kernel_x86_avx_add_mul_f64f64_f64);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_SSE_))
    {
        cf << "    reg_new_isa(\"SSE\", \"ADD(MUL(f32,f32),f32)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 64LL," << endl;
        cf << "        cpufp_kernel_x86_sse_add_mul_f32f32_f32);" << endl;
        cf << "    reg_new_isa(\"SSE\", \"ADD(MUL(f64,f64),f64)\", \"GFLOPS\"," << endl;
        cf << "        0x10000000LL, 32LL," << endl;
        cf << "        cpufp_kernel_x86_sse_add_mul_f64f64_f64);" << endl;
    }
    cf << "}" << endl;
    cf.close();
}

void gen_link()
{
    ofstream lf("link.sh");
    lf << "g++ -O3 -o cpufp table.o smtl.o cpubm_x86.o cpufp_x86.o";
    if (cpuid_x86_support(_CPUID_X86_SSE_))
    {
        lf << " cpufp_kernel_x86_sse.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_))
    {
        lf << " cpufp_kernel_x86_avx.o";
    }
    if (cpuid_x86_support(_CPUID_X86_FMA_))
    {
        lf << " cpufp_kernel_x86_fma.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512F_))
    {
        lf << " cpufp_kernel_x86_avx512f.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_BF16_))
    {
        lf << " cpufp_kernel_x86_avx512_bf16.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_FP16_))
    {
        lf << " cpufp_kernel_x86_avx512_fp16.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_VNNI_))
    {
        lf << " cpufp_kernel_x86_avx512_vnni.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_))
    {
        lf << " cpufp_kernel_x86_avx_vnni.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_INT8_))
    {
        lf << " cpufp_kernel_x86_avx_vnni_int8.o";
    }
    lf << endl;
    lf.close();
}

int main(int argc, char *argv[])
{
    cpuid_x86_init();

    gen_build_kernel_sh();
    gen_cpufp_include_cpp();
    gen_link();

    return 0;
}

