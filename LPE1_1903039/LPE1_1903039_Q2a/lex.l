%option noyywrap
%{
 #include <stdio.h>
 #include<stdlib.h>
%}
letter [a-zA-Z]
digit [0-9]
ID (_|{letter})(_|{letter}|{digit})*
ws [ \n]
%%
({ws}) {}
"make" { printf("%s -> KEYWORD_MAKE\n", yytext); }
"int" { printf("%s -> INT_TYPE\n", yytext); }

{digit}*"."{digit}+ { printf("%s -> REAL_NUM\n", yytext); }
{digit}+ { printf("%s -> INT_NUM\n", yytext); }
{ID} { printf("%s -> ID\n", yytext); }
"<-" { printf("%s -> ASSIGN\n", yytext); }

"*" { printf("%s -> MUL\n", yytext); }
";" { printf("%s -> SEMI\n", yytext); }
%%
int main(){
 yylex();
 return 0; 
}