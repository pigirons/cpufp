#include "table.hpp"

#include <iostream>
using namespace std;

Table::Table()
{
    col = 0;
}

Table::~Table()
{
}

void Table::setColumnNum(int col)
{
    int i;

    this->col = col;

    colWidths.resize(col);
    
    for (i = 0; i < col; i++)
    {
        colWidths[i] = 2;
    }
}

void Table::addOneItem(std::vector<std::string> &item)
{
    int i;

    contents.push_back(item);

    for (i = 0; i < col; i++)
    {
        int length = item[i].size() + 2;
        if (length > colWidths[i])
        {
            colWidths[i] = length;
        }
    }
}

void Table::print()
{
    int i, j, k;

    int tableWidth = col + 1;
    for (i = 0; i < col; i++)
    {
        tableWidth += colWidths[i];
    }

    string vLine(tableWidth, '-');
    cout << vLine << endl;
    
    for (i = 0; i < contents.size(); i++)
    {
        string oneLine("|");
        for (j = 0; j < col; j++)
        {
            oneLine += (" " + contents[i][j]);
            for (k = 1 + contents[i][j].size();
                k < colWidths[j]; k++)
            {
                oneLine += " ";
            }
            oneLine += "|";
        }
        cout << oneLine << endl;
    }
    
    cout << vLine << endl;
}

