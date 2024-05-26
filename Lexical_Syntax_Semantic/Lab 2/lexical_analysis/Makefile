main:
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o cal
	cal < input.txt > output.txt