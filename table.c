#include "table.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct table
{
    int row;
    int col;
    int *col_width;
    char ***contents;
};

void create_table(table_handle *th)
{
    *th = (table_handle)malloc(sizeof(struct table));
    (*th)->row = 0;
    (*th)->col = 0;
    (*th)->col_width = NULL;
    (*th)->contents = NULL;
}

void set_table_size(table_handle th,
    int row,
    int col)
{
    th->row = row;
    th->col = col;
    th->col_width = (int*)calloc(col, sizeof(int));
    th->contents = (char***)malloc(row * sizeof(char**));
    
    int i, j;
    for (i = 0; i < row; i++)
    {
        th->contents[i] = (char**)malloc(col * sizeof(char*));
        for (j = 0; j < col; j++)
        {
            th->contents[i][j] = NULL;
        }
    }
}

void set_table_content(table_handle th,
    int idx_r,
    int idx_c,
    char *content)
{
    int len = strlen(content);
    if (len > th->col_width[idx_c])
    {
        th->col_width[idx_c] = len;
    }
    if (th->contents[idx_r][idx_c])
    {
        free(th->contents[idx_r][idx_c]);
    }
    th->contents[idx_r][idx_c] = (char*)malloc((len + 1) * sizeof(char));
    strcpy(th->contents[idx_r][idx_c], content);
}

void print_table(table_handle th)
{
    int i, j;
    
    int col_len = th->col + 1;

    for (i = 0; i < th->col; i++)
    {
        col_len += th->col_width[i] + 2;
    }

    char *cur_line = (char*)malloc((col_len + 1) * sizeof(char));
    for (i = 0; i < col_len; i++)
    {
        cur_line[i] = '-';
    }
    cur_line[col_len] = '\0';
    printf("%s\n", cur_line);

    for (i = 0; i < th->row; i++)
    {
        int cur_pos = 0;
        cur_line[cur_pos++] = '|';
        
        for (j = 0; j < th->col; j++)
        {
            int cur_stop = cur_pos + th->col_width[j] + 2;
            char *cur_str = th->contents[i][j];
            int cur_str_len = strlen(cur_str);
            
            cur_line[cur_pos++] = ' ';
            memcpy(cur_line + cur_pos, cur_str, cur_str_len);
            cur_pos += cur_str_len;

            while (cur_pos < cur_stop)
            {
                cur_line[cur_pos++] = ' ';
            }
            cur_line[cur_pos++] = '|';
        }
        cur_line[col_len] = '\0';
        printf("%s\n", cur_line);
    }
    
    for (i = 0; i < col_len; i++)
    {
        cur_line[i] = '-';
    }
    cur_line[col_len] = '\0';
    printf("%s\n", cur_line);

    free(cur_line);
}

void delete_table(table_handle th)
{
    int i, j;
    for (i = 0; i < th->row; i++)
    {
        for (j = 0; j < th->col; j++)
        {
            free(th->contents[i][j]);
        }
        free(th->contents[i]);
    }
    free(th->contents);
    free(th->col_width);
    free(th);
}

