DEFAULT REL

SECTION .text
extern printf
extern dprintf
extern snprintf
extern exit
extern system
global main
main:
	lea edi, [filename_buff]
	mov esi, 16
	lea edx, [filename]
	mov ecx, x - 1
	xor eax, eax
	call snprintf ; string file.asm

	lea edi, [filename_obj_buff]
	mov esi, 16
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
end:
	call exit

SECTION .rodata
filename: db "Sully_%d.asm", 0
filename_obj: db "Sully_%d.o", 0
command: db "nasm -f elf64 %2$s; gcc -no-pie %1$s; ./a.out", 0
code:   db "DEFAULT REL%1$c%1$cSECTION .text%1$cextern printf%1$cextern dprintf%1$cextern snprintf%1$cextern exit%1$cextern system%1$cglobal main%1$cmain:%1$c mov ax, x%1$c mov bx, 1%1$c cmp ax, bx%1$c jl end %1$c%1$c lea edi, [filename_buff]%1$c mov esi, 16%1$c lea edx, [filename]%1$c mov ecx, x - 1%1$c xor eax, eax%1$c call snprintf%1$c%1$c lea edi, [filename_obj_buff]%1$c mov esi, 16%1$c lea edx, [filename_obj]%1$c mov ecx, x - 1%1$c xor eax, eax%1$c call snprintf%1$c%1$c mov edi, filename_buff%1$c mov esi, 0102o%1$c mov edx, 0666o%1$c mov eax, 2%1$c syscall%1$c%1$c mov edi, eax%1$c lea esi, [code]%1$c mov edx, 10%1$c mov ecx, 34%1$c mov r8, code%1$c mov eax, x - 1%1$c dec eax%1$c mov r9, rax%1$c xor eax, eax%1$c call dprintf%1$c%1$c lea edi, [command_buff]%1$c mov esi, 128%1$c lea edx, [command]%1$c lea ecx, [filename_buff]%1$c lea r8, [ecx]%1$c lea ecx, [filename_obj_buff]%1$c lea r9, [ecx]%1$c xor eax, eax%1$c call snprintf%1$c%1$c%1$c%1$c lea rdi, [command_buff]%1$c call system%1$c xor rdi, rdi%1$cend:%1$c call exit%1$c%1$cSECTION .rodata%1$cfilename: db %2$cSully_%%d.asm%2$c, 0%1$cfilename_obj: db %2$cSully_%%d.o%2$c, 0%1$ccommand: db %2$cnasm -f elf64 %%2$s; gcc -no-pie %%1$s; ./a.out%2$c, 0%1$ccode: db %2$c%3$s%2$c%1$cx: equ %4$d%1$c%1$c%1$c%1$cSECTION .bss%1$cfilename_buff: resb 16%1$cfilename_obj_buff: resb 16%1$ccommand_buff: resb 128%1$c%1$c"
x: equ 5



SECTION .bss
filename_buff: resb 16
filename_obj_buff: resb 16
command_buff: resb 128

