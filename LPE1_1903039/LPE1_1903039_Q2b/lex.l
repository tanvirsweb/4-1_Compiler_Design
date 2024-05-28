%option noyywrap

%{
	// Roll - 1903001
	#include <stdio.h>
	#include<stdlib.h>
	#include "bis.tab.h"
	int lineno=1;
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

"int" { return(INT); }
"make" { return(MAKE); }

{digit}*"."{digit}+ { return(REAL_NUM); }
{digit}+ { return(INT_NUM); }
{ID} { return(ID); }
"<-" { return(ASSIGN); }
"*" { return(MUL); }
";" { return(SEMI); }
"\n" {lineno+=1;}
%%

// int main(){
// 	yylex();
// 	return 0;
// }