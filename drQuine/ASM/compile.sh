nasm -f elf64 $1.asm
gcc -no-pie -nostartfiles $1.o
