DEFAULT REL
SECTION .rodata
filename: db "Sully_%d.asm", 0
command: db "nasm %s -f elf64; gcc -no-pie -nostartfiles %s; ./a.out", 0
code:   db "DEFAULT REL%1$cSECTION .rodata%1$cfilename: db "Sully_%d.asm", 0%1$ccommand: db "nasm %s -f elf64; gcc -no-pie -nostartfiles %s; ./a.out", 0%1$ccode:   db %2$c%3$c%2$c, 0%1$cx: equ %4$c%1$c%1$cSECTION .bss%1$cfilename_buff: resb 13%1$ccommand_buff: resb 80%1$c%1$cSECTION .text%1$cextern dprintf%1$cextern snprintf%1$cextern exit%1$cextern system%1$cglobal _start%1$c_start:%1$c	lea rdi, [filename_buff]%1$c	mov rsi, 13%1$c	lea rdx, [filename]%1$c	mov rcx, x - 1%1$c	call snprintf ; string filename to create%1$c%1$c    lea rdi, [filename_buff]%1$c    mov rsi, 0102o%1$c    mov rdx, 0666o%1$c    mov rax, 2%1$c    syscall ; create file%1$c%1$c	mov edi, eax%1$c	mov esi, code%1$c	mov edx, 10%1$c	mov ecx, 34%1$c    mov r8, code%1$c    mov r9, x - 1%1$c	xor eax, eax%1$c	call dprintf ; print inside%1$c%1$c	lea rdi, [command_buff]%1$c	mov rsi, 80%1$c	lea rdx, [command]%1$c	lea rcx, [filename_buff]%1$c	lea r8, [rcx]%1$c	call snprintf ; string command to execute%1$c%1$c	lea rdi, [command_buff]%1$c	call system%1$c%1$c	call exit%1$c", 0
x: equ 5

SECTION .bss
filename_buff: resb 13
command_buff: resb 80

SECTION .text
extern dprintf
extern snprintf
extern exit
extern system
global _start
_start:
	lea rdi, [filename_buff]
	mov rsi, 13
	lea rdx, [filename]
	mov rcx, x - 1
	call snprintf ; string filename to create

    lea rdi, [filename_buff]
    mov rsi, 0102o
    mov rdx, 0666o
    mov rax, 2
    syscall ; create file

	mov edi, eax
	mov esi, code
	mov edx, 10
	mov ecx, 34
    mov r8, code
    mov r9, x - 1
	xor eax, eax
	call dprintf ; print inside

	lea rdi, [command_buff]
	mov rsi, 80
	lea rdx, [command]
	lea rcx, [filename_buff]
	lea r8, [rcx]
	call snprintf ; string command to execute

	lea rdi, [command_buff]
	call system

	call exit
