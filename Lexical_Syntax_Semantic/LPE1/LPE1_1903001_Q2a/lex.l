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

"float" { printf("%s -> Float_Type\n", yytext); }
"int" { printf("%s -> INT_TYPE\n", yytext); }
"double" { printf("%s -> DOUBLE_TYPE\n", yytext); }
"if" { printf("%s -> IF\n", yytext); }
"ret" { printf("%s -> RET\n", yytext); }
"type" { printf("%s -> TYPE\n", yytext); }
"var" { printf("%s -> VAR\n", yytext); }
"return" { printf("%s -> RETURN\n", yytext); }
{digit}*"."{digit}+ { printf("%s -> REAL_NUM\n", yytext); }
{digit}+ { printf("%s -> INT_NUM\n", yytext); }
{ID} { printf("%s -> ID\n", yytext); }
"=" { printf("%s -> ASSIGN\n", yytext); }
">" { printf("%s -> GT\n", yytext); }
"(" { printf("%s -> LP\n", yytext); }
")" { printf("%s -> RP\n", yytext); }
"+" { printf("%s -> PLUS\n", yytext); }
";" { printf("%s -> SEMI\n", yytext); }
"{" { printf("%s -> LB\n", yytext); }
"}" { printf("%s -> RB\n", yytext); }
%%

int main(){
	yylex();
	return 0;
}