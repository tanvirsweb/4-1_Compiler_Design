main:
	gcc -E preprocessed.c > preprocessed.i
	gcc -S -masm=intel preprocessed.i
	as -o preprocessed.o preprocessed.s 