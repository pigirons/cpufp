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
    pSep.push_back(0);

    for (i = 0; i < col; i++)
    {
        int length = item[i].size() + 2;
        if (length > colWidths[i])
        {
            colWidths[i] = length;
        }
    }
}

void Table::addSeparator()
{
    std::vector<std::string> dummy;
    contents.push_back(dummy);
    pSep.push_back(1);
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
            if (pSep[i] == 0)
            {
                oneLine += (" " + contents[i][j]);
                for (k = 1 + contents[i][j].size();
                    k < colWidths[j]; k++)
                {
                    oneLine += " ";
                }
            }
            else if (pSep[i] == 1)
            {
                string curCol(colWidths[j], '-');
                oneLine += curCol;
            }
            oneLine += "|";
        }
        cout << oneLine << endl;
    }

    cout << vLine << endl;
}

