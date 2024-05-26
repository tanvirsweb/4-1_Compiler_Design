%option noyywrap

%{
#include "cal.tab.h"
%}

digit [0-9]
letter [a-zA-Z]
delim [ ]
%%
{delim} {} // ignoring all spaces
"while" {printf("%s -> KEYWORKD\n", yytext); return(WHILE);}
"int" {printf("%s -> DATATYPE\n", yytext); return(DTYPE);}
{digit}+ {printf("%s -> DIGIT\n", yytext); return(NUM);}
("_"|{letter})("_"|{letter}|{digit})* {printf("%s -> IDENTIFIER\n", yytext); return(ID);}
"=" {printf("%s -> ASSIGN\n", yytext); return(ASSIGN);}
";" {printf("%s -> SemiColon\n", yytext); return(SEM);}
"++" {printf("%s -> INCREMENT\n", yytext); return(INCR);}
"+" {printf("%s -> PLUS\n", yytext);}
")" {printf("%s -> RIGHT_PARENTHESIS\n", yytext); return(RP);}
"(" {printf("%s -> LEFT_PARENTHESIS\n", yytext); return(LP);}
"{" {printf("%s -> LEFT_BRACE\n", yytext); return(LB);}
"}" {printf("%s -> RIGHT_BRACE\n", yytext); return(RB);}
%%

// int main()
// {
//     /*
//     int a = 10;
//     while(1){
//         a++;
//     }
//     */
    
//     yylex();
//     return 0;
// }