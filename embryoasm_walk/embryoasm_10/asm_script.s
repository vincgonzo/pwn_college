.global _start
.intel_syntax noprefix

_start:
	# Memory reads 
	mov rax, [0x404000]
	
	int 0x80
