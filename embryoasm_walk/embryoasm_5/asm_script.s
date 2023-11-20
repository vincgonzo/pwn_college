.global _start
.intel_syntax noprefix

_start:
	# Modulus operation
	mov rax, rdi
	mov rbx, rsi
	div rbx 
	mov rcx, rax
	mov rax, rdx
	
	int 0x80
