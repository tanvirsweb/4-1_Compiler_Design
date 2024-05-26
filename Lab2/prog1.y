%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE ID NUM ASSIGN SEMI WHILE LP LT RP LB INCREMENT ADDOP RB
%start S

%%
S: declr while_loop;
declr: INT_TYPE ID ASSIGN NUM SEMI
while_loop: WHILE LP ID LT NUM RP LB ID INCREMENT SEMI RB
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