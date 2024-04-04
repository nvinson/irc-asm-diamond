.PHONEY: clean all

CFLAGS=""
LDFLAGS=""

all: main test

main: main.o diamond.o
	ld -o $@ $<

test: test.c diamond.o
	gcc $^ -o $@

main.o: main.asm
	nasm -f elf64 -g $<

diamond.o: diamond.asm
	nasm -f elf64 -g $<

clean:
	rm -f main test main.o test.o diamond.o
