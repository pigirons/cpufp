gcc -c asm/cpufp_kernel_x86_sse.S
gcc -c asm/cpufp_kernel_x86_avx.S
gcc -c asm/cpufp_kernel_x86_fma.S
gcc -c asm/cpufp_kernel_x86_avx512f.S
gcc -c asm/cpufp_kernel_x86_avx512_vnni.S
gcc -c asm/cpufp_kernel_x86_avx_vnni.S
gcc -O3 -c table.c
gcc -O3 -c smtl.c
gcc -O3 -c cpuid_x86.c
gcc -O3 -c cpubm_x86.c
gcc -O3 -c cpufp_x86.c
gcc -O3 -o cpufp table.o smtl.o cpuid_x86.o cpubm_x86.o cpufp_x86.o cpufp_kernel_x86_sse.o cpufp_kernel_x86_avx.o cpufp_kernel_x86_fma.o cpufp_kernel_x86_avx512f.o cpufp_kernel_x86_avx512_vnni.o cpufp_kernel_x86_avx_vnni.o
