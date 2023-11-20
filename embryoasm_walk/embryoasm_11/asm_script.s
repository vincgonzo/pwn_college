.global _start
.intel_syntax noprefix

_start:
	# Memory reads & write 
	mov edx, [edi]
	add rdi, 8 
	mov rcx, [rdi]
	mov rax, rsi
	mov [rsi], rcx
	add [rsi], rdx
	
	int 0x80
