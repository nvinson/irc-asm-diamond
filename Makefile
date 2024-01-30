diamond: diamond.o
	ld diamond.o -o diamond

diamond.o: diamond.asm
	nasm -f elf64 -g diamond.asm

.PHONEY: clean
clean:
	rm -f diamond.o diamond
