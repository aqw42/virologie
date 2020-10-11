DEFAULT REL

SECTION .text
extern dprintf
extern snprintf
extern exit
extern system
global main
main:
	lea edi, [filename_buff]
	mov esi, 13
	lea edx, [filename]
	mov ecx, x - 1
	xor eax, eax
	call snprintf ; string file.asm

	lea edi, [filename_obj_buff]
	mov esi, 13
	lea edx, [filename_obj]
	mov ecx, x - 1
	xor eax, eax
	call snprintf ; string file.o

    mov edi, filename_buff
    mov esi, 0102o
    mov edx, 0666o
    mov eax, 2
    syscall ; create file

	mov edi, eax
	lea esi, [code]
	mov edx, 10
	mov ecx, 34
    mov r8, code
	mov eax, x
	dec eax
    mov r9, rax
	xor eax, eax
	call dprintf ; print inside

	lea edi, [command_buff]
	mov esi, 128
	lea edx, [command]
	lea ecx, [filename_buff]
	lea r8, [ecx]
	lea ecx, [filename_obj_buff]
	lea r9, [ecx]
	xor eax, eax
	call snprintf ; string command to execute

	lea rdi, [command_buff]
	call system
	xor rdi, rdi
	call exit

SECTION .rodata
filename: db "Sully_%d.asm", 0
filename_obj: db "Sully_%d.o", 0
command: db "nasm %s -f elf64; gcc -no-pie %s; ./a.out", 0
code:   db ""
x: equ 5

SECTION .bss
filename_buff: resb 16
filename_obj_buff: resb 16
command_buff: resb 128