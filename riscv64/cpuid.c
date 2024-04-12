
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <asm/hwcap.h>
#include <sys/auxv.h>

#define ISA_V_HWCAP (1 << ('v' - 'a'))

int main()
{
    FILE *cpuinfo_file;
    char line[1024];
    char *token;
    const char *delimiter = ":";
    const char *search_key = "vendorid";
    char *vendor_id = NULL;

    cpuinfo_file = fopen("/proc/cpuinfo", "r");
    if (cpuinfo_file == NULL) {
        printf("Failed to open /proc/cpuinfo\n");
        return 1;
    }

    while (fgets(line, sizeof(line), cpuinfo_file)) {
        if ((token = strtok(line, delimiter)) != NULL) {
            if (strstr(token, search_key) != NULL) {
                token = strtok(NULL, delimiter);
                vendor_id = token + strspn(token, " \t");
                break;
            }
        }
    }

    fclose(cpuinfo_file);

    if (vendor_id) {
        if (strncmp(vendor_id, "0x710", 5) == 0) {
            printf("_IME_\n");
        }
    }

    uint64_t hwcaps = getauxval(AT_HWCAP);

#ifdef ISA_V_HWCAP
    if (hwcaps & ISA_V_HWCAP)
    {
        printf("_VECTOR_\n");
    }
#endif

    return 0;
}