%option noyywrap
%{
#include <stdio.h>
#include <string.h>
%}

%% 
[0-9]*222[0-9]*222[0-9]*222[0-9]* { fprintf(stdout, "This string belongs to the grammar with three consecutive '222's.\n"); }
[0-9]*222[0-9]*222[0-9]*          { fprintf(stdout, "This string belongs to the grammar with three consecutive '222's.\n"); }
[0-9]*222[0-9]*                   { fprintf(stdout, "This string belongs to the grammar with three consecutive '222's.\n"); }
[0-9]*222                         { fprintf(stdout, "This string belongs to the grammar with three consecutive '222's.\n"); }
[0-9]*                            { fprintf(stdout, "This string does not belong to the grammar with three consecutive '222's.\n"); }
%%

int main()
{
    yylex();
    return 0;
}
