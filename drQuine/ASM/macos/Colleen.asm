DEFAULT REL
SECTION .text
global _main
extern _printf
extern _exit
_main:
	push rbx
	lea rdi, [code]
	mov rsi, 10
	mov rdx, 34
	lea rcx, [code]
	xor rax, rax
	call _printf
quit:
	call _exit

code: db "DEFAULT REL%1$cSECTION .text%1$cglobal _main%1$cextern _printf%1$c_main:%1$c	push rbx%1$c	lea rdi, [code]%1$c	mov rsi, 10%1$c	mov rdx, 34%1$c	lea rcx, [code]%1$c	xor rax, rax%1$c	call _printf%1$cquit:%1$c	mov eax, 0x2000001%1$c	xor edi, edi%1$c	syscall ;end%1$c%1$ccode: %2$c%3$s%2$c, 0%1$c", 0