nasm -f elf64 $1.asm
ld $1.o -o $1 -lc --dynamic-linker /lib/ld-linux-x86-64.so.2
rm $1.o
