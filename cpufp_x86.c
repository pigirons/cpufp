#define _GNU_SOURCE

#include "cpubm_x86.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int parse_thread_pool(char *sets,
    int *set_of_threads)
{
    if (sets[0] != '[')
    {
        return 0;
    }
    int num_threads = 0;
    int pos = 1;
    int left = 0, right = 0;
    int state = 0;
    while (sets[pos] != ']' && sets[pos] != '\0')
    {
        if (state == 0)
        {
            if (sets[pos] >= '0' && sets[pos] <= '9')
            {
                left *= 10;
                left += (int)(sets[pos] - '0');
            }
            else if (sets[pos] == ',')
            {
                set_of_threads[num_threads++] = left;
                left = 0;
            }
            else if (sets[pos] == '-')
            {
                right = 0;
                state = 1;
            }
        }
        else if (state == 1)
        {
            if (sets[pos] >= '0' && sets[pos] <= '9')
            {
                right *= 10;
                right += (int)(sets[pos] - '0');
            }
            else if (sets[pos] == ',')
            {
                int i;
                for (i = left; i <= right; i++)
                {
                    set_of_threads[num_threads++] = i;
                }
                left = 0;
                state = 0;
            }
        }
        pos++;
    }
    if (sets[pos] != ']')
    {
        return 0;
    }
    if (state == 0)
    {
        set_of_threads[num_threads++] = left;
    }
    else if (state == 1)
    {
        int i;
        for (i = left; i <= right; i++)
        {
            set_of_threads[num_threads++] = i;
        }
    }

    return num_threads;
}

int main(int argc, char *argv[])
{
    if (argc != 2)
    {
        fprintf(stderr, "Usage: %s --thread_pool=[xxx]\n", argv[0]);
        fprintf(stderr, "[xxx] indicates all cores to benchmark.\n");
        fprintf(stderr, "Example: [0,3,5-8,13-15].\n");
        fprintf(stderr, "Notice: there must NOT be any spaces.\n");
        exit(0);
    }

    if (strncmp(argv[1], "--thread_pool=", 14))
    {
        fprintf(stderr, "Error: You must set --thread_pool parameter.\n");
        fprintf(stderr, "Usage: %s --thread_pool=[xxx]\n", argv[0]);
        fprintf(stderr, "[xxx] indicates all cores to benchmark.\n");
        fprintf(stderr, "Example: [0,3,5-8,13-15].\n");
        fprintf(stderr, "Notice: there must NOT be any spaces.\n");
        exit(0);
    }

    int num_threads;
    int set_of_threads[512];

    num_threads = parse_thread_pool(argv[1] + 14, set_of_threads);

    cpu_benchmark_x86_init();
    cpu_benchmark_x86_do(num_threads, set_of_threads);
    
    return 0;
}

