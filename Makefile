CC=gcc
ASM=nasm
LD=ld

all: c-hello

c-hello.o: hello.c
	$(CC) -c hello.c

c-hello: c-hello.o
	$(CC) hello.o -o c-hello

clean:
	rm -f *.o hello c-hello asm-hello
