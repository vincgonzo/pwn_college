.global _start
.intel_syntax noprefix

_start:
	# Read one size data 
	mov al, BYTE PTR [0x404000]    
	
	int 0x80
