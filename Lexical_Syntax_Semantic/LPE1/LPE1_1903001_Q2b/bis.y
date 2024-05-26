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

%token FLOAT INT DOUBLE IF RET TYPE VAR RETURN REAL_NUM
%token INT_NUM ASSIGN GT LP RP PLUS SEMI LB RB
%token ID


%start code
%%
code: main_func;
main_func: RET TYPE INT ID LP RP LB statements RB;
statements: statements statement | ;
statement: declaration
        | conditional
        | return_statement ;
declaration: VAR TYPE dtype ID ASSIGN exp SEMI;
dtype: INT | FLOAT | DOUBLE ;
constant: REAL_NUM | INT_NUM;
exp: ID 
    | constant
    | exp PLUS exp
    | exp GT exp ;

conditional: IF LP exp RP LB statements RB ;
return_statement: RETURN constant SEMI ;

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