DEFAULT REL
SECTION .rodata
filename: db "Grace_kid.asm", 0
code:   db "DEFAULT REL%1$cSECTION .rodata%1$cfilename: db %2$cGrace_kid.asm%2$c, 0%1$ccode:   db %2$c%3$s%2$c, 0%1$c%1$cSECTION .text%1$cextern dprintf%1$cextern exit%1$cglobal main%1$cmain:%1$c    mov rdi, filename%1$c    mov rsi, 0102o%1$c    mov rdx, 0666o%1$c    mov rax, 2%1$c    syscall%1$c%1$c	mov edi, eax%1$c	mov esi, code%1$c	mov edx, 10%1$c	mov ecx, 34%1$c    mov r8, code%1$c	xor eax, eax%1$c	call dprintf%1$c%1$c	call exit%1$c", 0

SECTION .text
extern dprintf
extern exit
global main
main:
    mov rdi, filename
    mov rsi, 0102o
    mov rdx, 0666o
    mov rax, 2
    syscall

	mov edi, eax
	mov esi, code
	mov edx, 10
	mov ecx, 34
    mov r8, code
	xor eax, eax
	call dprintf

	call exit
