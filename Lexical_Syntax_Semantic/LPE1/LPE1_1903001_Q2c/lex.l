%option noyywrap

%{
	// Roll - 1903001
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

"float" { return(FLOAT); }
"int" { return(INT); }
"double" { return(DOUBLE); }
"if" { return(IF); }
"ret" { return(RET); }
"type" { return(TYPE); }
"var" { return(VAR); }
"return" { return(RETURN); }
{digit}*"."{digit}+ { return(REAL_NUM); }
{digit}+ { return(INT_NUM); }
{ID} { strcpy(yylval.str_val, yytext); 
	return(ID); }
"=" { return(ASSIGN); }
">" { return(GT); }
"(" { return(LP); }
")" { return(RP); }
"+" { return(PLUS); }
";" { return(SEMI); }
"{" { return(LB); }
"}" { return(RB); }
"\n" {lineno+=1;}
%%

// int main(){
// 	yylex();
// 	return 0;
// }