%{
    // Roll - 1903001
    #include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
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
%token<str_val> ID
%left GT
%left PLUS


%type<int_val> declaration dtype exp constant

%start code
%%
code: main_func;
main_func: RET TYPE INT ID LP RP LB statements RB;
statements: statements statement | ;
statement: declaration
        | conditional
        | return_statement ;
declaration: VAR TYPE dtype ID ASSIGN exp SEMI
            {
                insert($4, $3);
                typecheck(gettype($4), $6);
            };
dtype: INT {$$=INT_TYPE;}
    | FLOAT {$$=REAL_TYPE;}
    | DOUBLE {$$=REAL_TYPE;}
    ;
constant: REAL_NUM {$$=REAL_TYPE;}
    | INT_NUM {$$=INT_TYPE;}
    ;
exp: ID 
    {
        if(idcheck($1))
        {
            $$ = gettype($1);
        }
    }
    | constant {$$=$1;}
    | exp PLUS exp
    {
        $$ = typecheck($1, $3);
    }
    | exp GT exp 
    {
        $$ = typecheck($1, $3);
    }
    ;

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