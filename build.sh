instruction_sets='sse avx fma avx512f avx512_vnni avx_vnni'
CC_FLAGS=''
OBJ_FILES=''
for instruction_set in $instruction_sets
do
    expression="${instruction_set} |${instruction_set}\$"
    if lscpu | grep -E "${expression}" > /dev/null
    then
        gcc -c asm/cpufp_kernel_x86_$instruction_set.S
        CC_FLAGS="${CC_FLAGS} -D __X86_${instruction_set^^}__"
        OBJ_FILES="${OBJ_FILES} cpufp_kernel_x86_$instruction_set.o"
    fi
done

gcc -O3 -c table.c
gcc -O3 -c smtl.c
gcc -O3 -c cpuid_x86.c
gcc -O3 $CC_FLAGS -c cpubm_x86.c
gcc -O3 -c cpufp_x86.c
gcc -O3 -o cpufp table.o smtl.o cpuid_x86.o cpubm_x86.o cpufp_x86.o $OBJ_FILES -lpthread
