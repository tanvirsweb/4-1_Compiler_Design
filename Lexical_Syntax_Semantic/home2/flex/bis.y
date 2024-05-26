%{
#include<stdio.h>
int yylex();
void yyerror(char*);
%}
%token DIM AS SINGLE_TYPE INT_TYPE ID FLOAT_NUM INT_NUM ASSIGN PLUS MINUS
%start S

%%
S: def rest ;
def: define
    | def define
    ;
define: DIM ID AS SINGLE_TYPE 
    | DIM ID AS INT_TYPE
    ;
rest: assignment
    | expression
    | rest alter
    ;
alter: assignment | expression ;
assignment: ID ASSIGN INT_NUM
            | ID ASSIGN FLOAT_NUM
            ;
expression: ID ASSIGN eq 
            | expression ID ASSIGN eq;
eq: types
    | eq PLUS types
    | eq MINUS types
    ;
types: ID | INT_NUM | FLOAT_NUM ;
%%

int main()
{
    yyparse(); // if there is an error the line below wont execute
    printf("Parsing Finshed\n");
    exit(1);
}

void yyerror(char *err){
    fprintf(stderr, "Error: %s\n", err);
}