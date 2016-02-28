gcc -O3 -c cpuid_x86.c
gcc -O3 -o cpuid_x86 cpuid_x86.o
./cpuid_x86 > gen.sh
chmod 744 gen.sh
./gen.sh
