#ifndef _TABLE_H
#define _TABLE_H

typedef struct table* table_handle;

void create_table(table_handle *th);

void set_table_size(table_handle th,
    int row,
    int col);

void set_table_content(table_handle th,
    int idx_r,
    int idx_c,
    char *content);

void print_table(table_handle th);

void delete_table(table_handle th);

#endif

