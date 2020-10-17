DEFAULT REL
global ft_strlen
global ft_strlen2

extern printf

section .text
ft_strlen:
    xor eax, eax  
    cmp edi, 0
    je end
loop:
    mov r8b, BYTE [edi + eax]
    cmp r8b, 0
    je end
    inc eax
    jmp loop
end:
    ret

ft_strlen2:
    xor rax, rax
    cld
    mov esi, edi
    repne cmpsb
    mov ax, cx
    ret