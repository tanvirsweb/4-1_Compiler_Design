%{
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

%token FLOAT IF ELIF ELSE ICONST FCONST MUL NL
%token LITERAL EQUAL ASSIGN GT LP RP COLON PLUS COMMA
%token<str_val> ID
%left GT EQUAL
%left PLUS
%left MUL

%type<int_val> type constant exp expr function

%start code
%%
code: statements;
statements: statements statement {printf("#%d\n",lineno);}| ;
statement: declaration NL
        | conditional NL
        | assignment NL
        | function NL
        ;
declaration: type ID ASSIGN expr
            {
                printf("#%d. ID: %s Type: %d expr: %d\n",lineno, $2, $1, $4);
                insert($2, $1);
                printf("#%d. Assign type check: %d\n",lineno, typecheck(gettype($2),$4));
            };
type: FLOAT {$$=REAL_TYPE;}
function: ID LP optional_parmas RP {$$=UNDEF_TYPE;};
assignment: ID ASSIGN expr 
        {
            if(idcheck($1))
            {
                printf("#%d. Assign type check: %d\n",lineno, typecheck(gettype($1),$3));
            }
            else exit(1);
        };
constant: FCONST {$$=REAL_TYPE;}
        | ICONST {$$=INT_TYPE;}
        ;
optional_parmas: params | optional_parmas COMMA params;
params: LITERAL | ID | constant;
conditional: IF exp COLON statements optional_else
            | IF exp COLON statements
optional_else: ELIF exp COLON statements optional_else
            | ELSE COLON statements
            ;
expr: function {$$=$1;} | exp {$$=$1;};
exp: ID 
    {
        if(idcheck($1))
        {
            $$ = gettype($1);
        }
        else exit(1);
    }
    | constant {$$=$1;}
    | exp op exp
    {
        int rtype = typecheck($1, $3);
        printf("#%d. Expression type: %d\n",lineno, rtype);
    }
    ;
op: PLUS | MUL | GT | EQUAL ;
%%

int main()
{
    yyparse(); // if there is an error the line below wont execute
    printf("Parsing Finshed\n");
    return 0;
}

void yyerror(char *err){
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}