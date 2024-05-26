%{
#include<stdio.h>
int yylex();
void yyerror(char*);
%}

%token ID ASSIGN NUM SEM DTYPE WHILE LP RP RB LB INCR
%start cal

%%
cal: declr while_loop;
declr: DTYPE ID ASSIGN NUM SEM;
while_loop: WHILE LP NUM RP LB ID INCR SEM RB
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