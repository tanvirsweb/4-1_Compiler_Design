main:
	gcc -E helloWorld.c > helloWorld.i
	gcc -S helloWorld.i
	gcc -S -masm=intel helloWorld.i
	as -o helloWorld.o helloWorld.s 
	objdump -M intel -d helloWorld.o > helloWorld.dump
	gcc -o helloWorld.exe helloWorld.o 
	helloWorld.exe
	objdump -M intel -d helloWorld.exe > helloWorld.txt