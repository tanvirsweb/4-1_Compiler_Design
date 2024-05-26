%{
#include<stdio.h>
int yylex();
void yyerror(char*);
%}

%token ID ASSIGN INT_NUM FLOAT_NUM DIM AS SINGLE_TYPE INT_TYPE PLUS MINUS
%start cal

%%
cal: declr rest;
declr: DIM ID AS SINGLE_TYPE 
    | DIM ID AS INT_TYPE
    ;
rest:
    | ID ASSIGN INT_NUM 
    | ID ASSIGN FLOAT_NUM 
    ;
%%

int main()
{
    // token er moddhe jegula cal.l ee likhsi segula dite hobe

    yyparse(); // if there is an error the line below wont execute
    printf("Parsing Finshed\n");
    return 0;
}

void yyerror(char *err){
    fprintf(stderr, "Error: %s\n", err);
}