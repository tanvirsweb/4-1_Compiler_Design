%{
    #include <stdio.h>
	#include <stdlib.h>
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token INT MAKE REAL_NUM INT_NUM ID ASSIGN MUL SEMI 

%start code
%%
code: L1 L2 L3;
L1: MAKE INT ID ASSIGN INT_NUM SEMI
L2: MAKE INT ID ASSIGN REAL_NUM SEMI
L3: ID ASSIGN INT_NUM MUL ID MUL ID SEMI
%%

int main()
{
    yyparse();
    printf("Parsing Finshed\n");
    return 0;
}

void yyerror(char *err){
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}