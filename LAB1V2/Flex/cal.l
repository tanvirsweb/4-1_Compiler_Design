%option noyywrap
%{

%}
%%
"1" {printf("%s -> NUM\n", yytext);}
"2" {printf("%s -> NUM\n", yytext);}
"+" {printf("%s -> ADDOP\n", yytext);}
"-" {printf("%s -> SUBOP\n", yytext);}
"a" {printf("%s -> ID\n", yytext);}
"b" {printf("%s -> ID\n", yytext);}
"c" {printf("%s -> ID\n", yytext);}
"=" {printf("%s -> ASSIGN\n", yytext);}
";" {printf("%s -> SEMICOLON\n", yytext);}
%%
int main()
{
    yylex();
    return 0;
}