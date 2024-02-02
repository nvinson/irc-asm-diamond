.PHONEY: clean all

all: diamond

diamond: diamond.o
	ld -o $@ $<

diamond.o: diamond.asm
	nasm -f elf64 -g $<

clean:
	rm -f diamond.o diamond
