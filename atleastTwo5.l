%option noyywrap
%{
#include <stdio.h>
%}

%%
([^5]*5[^5]*){2}.*    printf("String satisfies the condition.\n");
[^5]*                  printf("String does not satisfy the condition.\n");
%%

int main() {
    yylex();
    return 0;
}
