nasm -f elf64 $1.asm
gcc -no-pie -nostartfiles colleen.o
