#ifndef _CPUFP_X86_H
#define _CPUFP_X86_H

#ifdef _USE_X86_SSE
void cpufp_x86_sse_fp32();
void cpufp_x86_sse_fp64();
#endif

#ifdef _USE_X86_AVX
void cpufp_x86_avx_fp32();
void cpufp_x86_avx_fp64();
#endif

#ifdef _USE_X86_FMA
void cpufp_x86_fma_fp32();
void cpufp_x86_fma_fp64();
#endif

#endif

