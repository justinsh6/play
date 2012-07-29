CC=gcc
ASM=nasm
LD=ld

all: c-hello asm-hello

c-hello.o: hello.c
	$(CC) -c hello.c

c-hello: c-hello.o
	$(CC) hello.o -o c-hello

asm-hello.o: hello.asm
	$(ASM) -f elf hello.asm -o asm-hello.o

asm-hello: asm-hello.o
	$(LD) -m elf_i386 -s -o asm-hello asm-hello.o

clean:
	rm -f *.o hello c-hello asm-hello
