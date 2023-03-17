.intel_syntax noprefix
.global _start

.section .text

_start:
	mov rdi, 2 
	mov rsi, 1 
	mov rdx, 0
	mov rax, 0x29 
	syscall

	mov rdi, 3 # page socket return 
	lea rsi, [rip + sockaddr] 
	mov rdx, 16	
	mov rax, 0x31
	syscall 

	mov rdi, 0
	mov rax, 60
	syscall 

.section .data
sockaddr:
	.2byte 2
	.2byte 0x5000 # big endian value for port 80
	.4byte 0
	.8byte 0
