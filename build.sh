g++ -O3 -c cpuid_x86.cpp
g++ -O3 -o cpuid_gen cpuid_x86.o
./cpuid_gen
sh build_kernel.sh

g++ -O3 -c table.cpp
g++ -O3 -c smtl.cpp
g++ -O3 -c cpubm_x86.cpp
g++ -O3 -c cpufp_x86.cpp

sh link.sh
