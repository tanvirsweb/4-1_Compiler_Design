%option noyywrap
%{
#include"prog1.tab.h"
%}
letter [a-zA-Z]
digit [0-9]
num {digit}{digit}*
id ({letter}|"_")({letter}|"_"|{digit})*
delim [ \n]
%%
{delim} {} 
"int" {printf("%s -> INT_TYPE\n", yytext); return(INT_TYPE);}
"while" {printf("%s -> WHILE\n", yytext); return(WHILE); }
{id} {printf("%s -> ID\n", yytext); yylval=atoi(yytext); return(ID);}
{num} {printf("%s -> NUM\n", yytext); return(NUM);}
"=" {printf("%s -> ASSIGN\n", yytext); return(ASSIGN); }
";" {printf("%s -> SEMI\n", yytext); return(SEMI); }
"(" {printf("%s -> LP\n", yytext); return(LP); }
"<" {printf("%s -> LT\n", yytext); return(LT); }
")" {printf("%s -> RP\n", yytext); return(RP); }
"{" {printf("%s -> LB\n", yytext); return(LB); }
"++" {printf("%s -> INCREMENT\n", yytext); return(INCREMENT); }
"+" {printf("%s -> ADDOP\n", yytext); return(ADDOP); }
"}" {printf("%s -> RB\n", yytext); return(RB); }
%%
// int main()
// {
//     // while and int --> match with id --> so write their rule before id
//     // {delim} {}  --> space or \n (newline)  no operation {}
//     yylex();
//     return 0;
// }