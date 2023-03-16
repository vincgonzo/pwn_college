.intel_syntax noprefix
.global _start

_start:
	mov rdi, 2 # AF_INET
	mov rsi, 1 # SOCKET_STREAM
	mov rdx, 0 # IPPROTO_IP
	mov rax, 0x29 # SYS_socket 
	syscalli # call for socket with previous parameters

	mov rdi, 0
	mov rax, 60
	syscall # SYS_EXIT
