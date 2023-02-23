#include <fstream>

using namespace std;

typedef enum
{
    _CPUID_X86_SSE_         = 0x1,
    _CPUID_X86_AVX_         = 0x2,
    _CPUID_X86_FMA_         = 0x4,
    _CPUID_X86_AVX512F_     = 0x8,
    _CPUID_X86_AVX512_VNNI_ = 0x10,
    _CPUID_X86_AVX_VNNI_    = 0x20,
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
     * Test AVX512F/AVX512-VNNI
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
    
    /*
     * Test AVX-VNNI
     */
    cpuid.ieax = 0x7;
    cpuid.iecx = 0x1;
    cpuid_x86_exec(&cpuid);

    if (BIT_TEST(cpuid.eax, 4))
    {
        SET_FEAT(_CPUID_X86_AVX_VNNI_);
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
    bf.close();
}

void gen_cpufp_include_cpp()
{
    ofstream cf("cpufp_x86_incl.cpp");
    cf << "static void cpufp_register_isa()" << endl << "{" << endl;
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_))
    {
        cf << "    reg_new_isa(\"AVX_VNNI\", \"INT8\", \"GOPS\"," << endl;
        cf << "        0x20000000LL, 640LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_int8);" << endl;
        cf << "    reg_new_isa(\"AVX_VNNI\", \"INT16\", \"GOPS\"," << endl;
        cf << "        0x20000000LL, 320LL," << endl;
        cf << "        cpufp_kernel_x86_avx_vnni_int16);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512_VNNI_))
    {
        cf << "    reg_new_isa(\"AVX512_VNNI\", \"INT8\", \"GOPS\"," << endl;
        cf << "        0x20000000LL, 1280LL," << endl;
        cf << "        cpufp_kernel_x86_avx512_vnni_int8);" << endl;
        cf << "    reg_new_isa(\"AVX512_VNNI\", \"INT16\", \"GOPS\"," << endl;
        cf << "        0x20000000LL, 640LL," << endl;
        cf << "        cpufp_kernel_x86_avx512_vnni_int16);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX512F_))
    {
        cf << "    reg_new_isa(\"AVX512F\", \"FP32\", \"GFLOPS\"," << endl;
        cf << "        0x20000000LL, 320LL," << endl;
        cf << "        cpufp_kernel_x86_avx512f_fp32);" << endl;
        cf << "    reg_new_isa(\"AVX512F\", \"FP64\", \"GFLOPS\"," << endl;
        cf << "        0x20000000LL, 160LL," << endl;
        cf << "        cpufp_kernel_x86_avx512f_fp64);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_FMA_))
    {
        cf << "    reg_new_isa(\"FMA\", \"FP32\", \"GFLOPS\"," << endl;
        cf << "        0x40000000LL, 160LL," << endl;
        cf << "        cpufp_kernel_x86_fma_fp32);" << endl;
        cf << "    reg_new_isa(\"FMA\", \"FP64\", \"GFLOPS\"," << endl;
        cf << "        0x40000000LL, 80LL," << endl;
        cf << "        cpufp_kernel_x86_fma_fp64);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_))
    {
        cf << "    reg_new_isa(\"AVX\", \"FP32\", \"GFLOPS\"," << endl;
        cf << "        0x40000000LL, 96LL," << endl;
        cf << "        cpufp_kernel_x86_avx_fp32);" << endl;
        cf << "    reg_new_isa(\"AVX\", \"FP64\", \"GFLOPS\"," << endl;
        cf << "        0x40000000LL, 48LL," << endl;
        cf << "        cpufp_kernel_x86_avx_fp64);" << endl;
    }
    if (cpuid_x86_support(_CPUID_X86_SSE_))
    {
        cf << "    reg_new_isa(\"SSE\", \"FP32\", \"GFLOPS\"," << endl;
        cf << "        0x30000000LL, 64LL," << endl;
        cf << "        cpufp_kernel_x86_sse_fp32);" << endl;
        cf << "    reg_new_isa(\"SSE\", \"FP64\", \"GFLOPS\"," << endl;
        cf << "        0x30000000LL, 32LL," << endl;
        cf << "        cpufp_kernel_x86_sse_fp64);" << endl;
    }
    cf << "}" << endl;
    cf.close();
}

void gen_link()
{
    ofstream lf("link.sh");
    lf << "g++ -O3 -o cpufp table.o smtl.o cpubm_x86.o cpufp_x86.o -lpthread";
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
    if (cpuid_x86_support(_CPUID_X86_AVX512_VNNI_))
    {
        lf << " cpufp_kernel_x86_avx512_vnni.o";
    }
    if (cpuid_x86_support(_CPUID_X86_AVX_VNNI_))
    {
        lf << " cpufp_kernel_x86_avx_vnni.o";
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

