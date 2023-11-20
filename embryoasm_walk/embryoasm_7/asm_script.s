.global _start
.intel_syntax noprefix

_start:
	# Register sizes for Modulus operation
	mov rcx, rdi
	mov al, cl
	#mov ax, 0x100
	mov rdx, rsi 
	mov bx, dx #mov part of registrers to % values
	#mov ebx, 0x10000 I've moved int3 from my code feel free to add it ;) 
	
	int 0x80
