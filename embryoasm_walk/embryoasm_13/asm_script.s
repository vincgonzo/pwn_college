.global _start
.intel_syntax noprefix

_start:
	# Absolute jump 
        mov rdx, 0x403000
        jmp rdx

	int 0x80
