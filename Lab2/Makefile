main:
	flex cal.l
	gcc lex.yy.c
	./a <input.txt

main2:
	bison -d cal.y
	flex cal.l
	gcc lex.yy.c cal.tab.c
	a < input.txt

main3:
	bison -d prog1.y
	flex prog1.l
	gcc lex.yy.c prog1.tab.c
	a < input.txt