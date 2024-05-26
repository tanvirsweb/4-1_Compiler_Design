%{
#include<stdio.h>
int yylex();
void yyerror(char*);
%}

%token NUM PLUS
%start cal

%%
cal: NUM PLUS NUM
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