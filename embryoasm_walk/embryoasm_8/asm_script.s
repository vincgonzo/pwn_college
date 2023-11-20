.global _start
.intel_syntax noprefix

_start:
	# Bitwise and operation 
	and rdi, rsi
	xor rax, rax
	add rax, rdi
	
	int 0x80
