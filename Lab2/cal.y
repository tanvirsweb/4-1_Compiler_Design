%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADDOP SUBOP
%start S

%%
S: NUM ADDOP NUM printf("%d+%d=%d\n", $1,$3,$1+$3);
%%
int main()
{
    yyparse();
    printf("Parsing Finished");
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "error:%s\n");
    // for parser we must specify: what will be shown when error occur
}