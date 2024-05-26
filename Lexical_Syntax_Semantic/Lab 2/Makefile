main:
	flex cal.l
	gcc lex.yy.c
	a
main2:
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o cal
	cal < input.txt > output.txt