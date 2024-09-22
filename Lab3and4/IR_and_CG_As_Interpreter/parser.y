%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token PRINT SCAN
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token<str_val> ID
%token<int_val> ICONST
%token<int_val> INT

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP SUBOP 
%left MULOP /*MULOP has lowest precedence*/

%type<int_val> exp assignment_print_scan

%start program

%%
program: {gen_code(START, -1);} code {gen_code(HALT, -1);};

code: statements;

statements: statements statement | ;

statement: declaration
        | assignment_print_scan
        ;

declaration: INT ID SEMI
            {
                insert($2, $1);
            };

assignment_print_scan: ID ASSIGN exp SEMI
                    {
                        int address = idcheck($1);

                        if(address !=-1)
                        {
                            gen_code(STORE, address);
                        }                        
                    }
                    | PRINT LPAREN ID RPAREN SEMI
                    {
                        int address = idcheck($3);

                        if(address !=-1)
                        {
                            gen_code(PRINT_INT_VALUE, address);
                        }
                    }                    
                    | SCAN LPAREN ID RPAREN SEMI
                    {
                        int address = idcheck($3);

                        if(address !=-1)
                        {
                            gen_code(SCAN_INT_VALUE, address);
                        }
                    }
                    ;

exp: ICONST
    {
        gen_code(LD_INT, $1);
    }
    | ID
    {
        int address = idcheck($1);

        if(address !=-1)
        {
            gen_code(LD_VAR, address);
        }
    }
    | exp ADDOP exp
    {
        gen_code(ADD, -1);
    }
    | exp SUBOP exp
    {
        gen_code(SUB, -1);
    }
    | exp MULOP exp
    | exp GT exp
    ;
%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");

    printf("============= INTERMEDIATE CODE===============\n");
    print_code();

    printf("============= RUN CODE IN VIRTUAL MACHINE ===============\n");
    vm();

	return 0;
}
