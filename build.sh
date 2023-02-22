g++ -O3 -std=c++11 -c cpuid_x86.cpp
g++ -O3 -std=c++11 -o cpuid_gen cpuid_x86.o
./cpuid_gen
sh build_kernel.sh

g++ -O3 -std=c++11 -c table.cpp
g++ -O3 -std=c++11 -c smtl.cpp
g++ -O3 -std=c++11 -c cpubm_x86.cpp
g++ -O3 -std=c++11 -c cpufp_x86.cpp

sh link.sh
