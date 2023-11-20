.global _start
.intel_syntax noprefix

_start:
	# divide operation
	mov rax, rdi
	mov rbx, rsi
	div rbx 
	
	int 0x80
