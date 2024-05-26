
BIS := bis
FLEX := flx
main:
	bison -d $(BIS).y
	flex $(FLEX).l
	gcc $(BIS).tab.c lex.yy.c -o lex
	lex < in.txt