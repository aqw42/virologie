#! /bin/sh

nasm -f elf64 ft_strlen.asm
gcc -c main.c
gcc main.o ft_strlen.o -no-pie


