%option noyywrap
%{
#include"cal.tab.h"
%}
digit [0-9]
num {digit}{digit}*
%%
{num} {printf("%s -> NUM\n", yytext); yylval=atoi(yytext); return(NUM);}
"+" {printf("%s -> ADDOP\n", yytext); return(ADDOP); }
"-" {printf("%s -> SUBOP\n", yytext); return(SUBOP); }
%%
// int main()
// {
//     yylex();
//     return 0;
// }