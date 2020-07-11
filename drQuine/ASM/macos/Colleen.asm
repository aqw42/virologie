DEFAULT REL
SECTION .rodata
code: db "DEFAULT REL%1$cSECTION .rodata%1$ccode: db %2$c%3$s%2$c%1$c%1$cSECTION .text%1$cextern printf%1$cglobal _start%1$c_start:%1$c	mov edi, code%1$c	mov esi, 10%1$c	mov edx, 34%1$c	mov ecx, code%1$c	xor eax, eax%1$c	call printf%1$c%1$c	mov eax, 60%1$c	xor edi, edi%1$c	syscall ;end%1$c", 0

SECTION .text
global _main
extern _printf
_main:
	lea rdi, [code]
	mov esi, 10
	lea rcx, [code]
	mov edx, 34
	xor eax, eax
	call _printf

	mov eax, 0x2000001
	xor edi, edi
	syscall ;end
