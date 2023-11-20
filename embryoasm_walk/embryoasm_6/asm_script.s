.global _start
.intel_syntax noprefix

_start:
	# Bitwise shift  
	mov rcx, rdi
 	shr rcx, 0x20
	mov al, cl
	
	int 0x80
