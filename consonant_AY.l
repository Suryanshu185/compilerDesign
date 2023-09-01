c[a-zA-Z]
vowel[aeiouAEIOU]
cons[^aeiouAEIOU]

%option noyywrap

%%

{cons}{c}* {

	char s[100];
	strcpy(s,yytext+1); 
	strncat(s,yytext,1); // strncat(s,yytext,1) is same as strcat(s,yytext[0])
	strcat(s,"ay");
	printf("%s",s);
	fprintf(yyout,"%s",s);
}

{vowel}{c}* {

	char s[100];
	strcpy(s,yytext);
	strcat(s,"ay");
	printf("%s",s);
	fprintf(yyout,"%s",s);
}

([^c]+) {
    /* Non-letter characters are copied as-is */
    printf("%s", yytext);
    fprintf(yyout, "%s", yytext);
}

%%

int main() {
	yyin = fopen("input.txt", "r");
	yyout = fopen("output.txt", "w");
	yylex();
	fclose(yyin);
	fclose(yyout);
	return 0;
}