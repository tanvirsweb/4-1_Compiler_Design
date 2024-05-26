%option noyywrap

%{
#include "cal.tab.h"
%}

digit [0-9]


%%
{digit}{digit}* { printf("%s -> NUM\n", yytext); return(NUM);}
"+" { printf("%s -> PLUS\n", yytext); return(PLUS);}
%%

// int main()
// {

//     // {digit}{digit}* = {digit}+
//     yylex();
//     return 0;
// }