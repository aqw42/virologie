DEFAULT REL
SECTION .rodata
code: db "DEFAULT REL%1$cSECTION .rodata%1$ccode: db %2$c%3$s%2$c, 0%1$c%1$cSECTION .text%1$cextern printf%1$cextern exit%1$cglobal _start%1$c_start:%1$c	mov edi, code%1$c	mov esi, 10%1$c	mov edx, 34%1$c	mov ecx, code%1$c	xor eax, eax%1$c	call printf%1$cend:%1$c	call exit ;end%1$c", 0

SECTION .text
extern printf
extern exit
global _start
_start:
	mov edi, code
	mov esi, 10
	mov edx, 34
	mov ecx, code
	xor eax, eax
	call printf
end:
	call exit ;end
