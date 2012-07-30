CC=gcc
CPP=g++
ASM=nasm
LD=ld

all: c-hello asm-hello hello

c-hello.o: hello.c
	$(CC) -c hello.c

c-hello: c-hello.o
	$(CC) hello.o -o c-hello

asm-hello.o: hello.asm
	$(ASM) -f elf hello.asm -o asm-hello.o

asm-hello: asm-hello.o
	$(LD) -m elf_i386 -s -o asm-hello asm-hello.o

hello.o: hello.cpp
	$(CPP) -c hello.cpp

hello: hello.o
	$(CPP) hello.o -o hello

clean:
	rm -f *.o hello c-hello asm-hello
