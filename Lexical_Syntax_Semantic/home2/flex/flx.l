%option noyywrap

%{
#include "bis.tab.h"
%}

digit [0-9]
letter [a-zA-Z]
ws [ ]

%%
{ws} {}
"Dim" {printf("%s -> DIM\n", yytext); return(DIM);}
"As" {printf("%s -> AS\n", yytext); return(AS);}
"Single" {printf("%s -> SINGLE_TYPE\n", yytext); return(SINGLE_TYPE);}
"Integer" {printf("%s -> INT_TYPE\n", yytext); return(INT_TYPE);}
("_"|{letter})("_"|{letter}|{digit})* {printf("%s -> ID\n", yytext); return(ID);}
{digit}*"."{digit}+ {printf("%s -> FLOAT_NUM\n", yytext); return(FLOAT_NUM);}
{digit}+ {printf("%s -> INT_NUM\n", yytext); return(INT_NUM);}
":=" {printf("%s -> ASSIGN\n", yytext); return(ASSIGN);}
"+" {printf("%s -> PLUS\n", yytext); return(PLUS);}
"-" {printf("%s -> MINUS\n", yytext); return(MINUS);}
%%

// int main()
// {
//     yylex();
//     return 0;
// }