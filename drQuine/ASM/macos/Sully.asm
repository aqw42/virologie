DEFAULT REL
SECTION .rodata
filename_1: db "Sully_", 0
filename_2: db ".c", 0
command: db 59, " ./a.out", 0
x: equ 5
code:   db " %4$d", 0

filename: db "prout", 0

SECTION .text
extern dprintf
global _start
_start:
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
    mov r9, x - 1
	xor eax, eax
	call dprintf

	mov eax, 60
	xor edi, edi
	syscall
