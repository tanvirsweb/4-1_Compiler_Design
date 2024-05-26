%option noyywrap

%{
	#include <stdio.h>
	#include<stdlib.h>
	#include "bis.tab.h"
	#include <string.h>
	int lineno = 1;
	void yyerror();
%}

letter [a-zA-Z]
digit [0-9]
ID ({letter})({letter}|{digit})*
quo ["]
ws [ ]
sc [ :=+-_]
literal ({quo})({letter}|{digit}|{sc})*({quo})

%%
({ws}) {}

"float" { printf("%s -> Float Type\n", yytext); return(FLOAT);}
"if" { printf("%s -> IF\n", yytext); return(IF);}
"elif" { printf("%s -> ELIF\n", yytext); return(ELIF);}
"else" { printf("%s -> ELSE\n", yytext); return(ELSE);}
{digit}*"."{digit}+ { printf("%s -> FLOAT_NUM\n", yytext); return(FCONST);}
{digit}+ { printf("%s -> INT_NUM\n", yytext); return(ICONST);}

{ID} { printf("%s -> ID\n", yytext);
	  strcpy(yylval.str_val, yytext);
	 return(ID);}
{literal} { printf("%s -> Literal\n", yytext); return(LITERAL);}
"==" { printf("%s -> EQUAL\n", yytext); return(EQUAL);}
"=" { printf("%s -> ASSIGN\n", yytext); return(ASSIGN);}
">" { printf("%s -> GT\n", yytext); return(GT);}
"(" { printf("%s -> LP\n", yytext); return(LP);}
")" { printf("%s -> RP\n", yytext); return(RP);}
":" { printf("%s -> COLON\n", yytext); return(COLON);}
"+" { printf("%s -> PLUS\n", yytext); return(PLUS);}
"*" { printf("%s -> MUL\n", yytext); return(MUL);}
"," { printf("%s -> COMMA\n", yytext); return(COMMA);}
"\n" {lineno+=1; printf("%s -> NL\n", yytext); return(NL);}
%%

// int main(){
// 	yylex();
// 	return 0;
// }