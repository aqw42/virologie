.data
code: .ascii "type the code here\n"
quote: .ascii "\0x34"

.text
.global _start
_start:
	mov $4, %rax
	mov $1, %rdi
	mov $code, %rsi
	mov $18, %rdx
	syscall

	mov $quote, %rsi
	mov $1, %rdx
	syscall

	mov $code, %rsi
	mov $18, %rdx
	syscall

	mov $quote, %rsi
	mov $1, %rdx
	syscall

	mov $60, %rax
    mov $0, %rdi
    syscall