DEFAULT REL

SECTION .text

extern _dprintf
extern _exit
global _main
_main:
    lea rdi, [filename]
    mov esi, 0102o
    mov edx, 0666o
    mov eax, 0x2000002
    syscall

	mov edi, eax
	lea rsi, [code]
	mov edx, 10
	mov ecx, 34
    lea r8, [code]
	xor eax, eax
	call _dprintf

	call _exit

filename: db "grace_kid.asm", 0
code:   db "DEFAULT REL%1$cSECTION .rodata%1$cfilename: db %2$cgrace_kid.asm%2$c, 0%1$ccode:   db %2$c%3$s%2$c, 0%1$c%1$cSECTION .text%1$cextern dprintf%1$cglobal _start%1$c_start:%1$c    mov rdi, filename%1$c    mov rsi, 0102o%1$c    mov rdx, 0666o%1$c    mov rax, 2%1$c    syscall%1$c%1$c	mov edi, eax%1$c	mov esi, code%1$c	mov edx, 10%1$c	mov ecx, 34%1$c    mov r8, code%1$c	xor eax, eax%1$c	call dprintf%1$c%1$c	mov eax, 60%1$c	xor edi, edi%1$c	syscall%1$c", 0
