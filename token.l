%option noyywrap

%{

%}

digits [0-9]
alphabets [a-zA-Z]
alphanum [a-zA-Z0-9]

%%

int|float|double|char   printf("Keyword: %s\n", yytext);
{alphabets}{alphanum}*      printf("Identifier: %s\n", yytext);
{digits}+(\.{digits}+)?   printf("Constant: %s\n", yytext);
[+\-*/]                 printf("Operator: %s\n", yytext);
[=;,\(\)\{\}'"|]            printf("Punctuation: %s\n", yytext);

%%

int main() {
    printf("Enter values: \n");
    yylex();
    return 0;
}