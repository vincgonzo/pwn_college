.intel_syntax noprefix
.global _start

.section .text

_start:
	mov rdi, 2 # SYS_SOCKET
        mov rsi, 1
        mov rdx, 0
        mov rax, 0x29
        syscall

        mov rdi, 3 # SYS_BIND 
        lea rsi, [rip + sockaddr] # pointer 
        mov rdx, 16
        mov rax, 0x31
        syscall

        mov rdi, 3 # SYS_LISTEN
        mov rsi, 0 
        mov rax, 0x32
        syscall

#       mov rdi, 3 # SYS_LISTEN
#       mov rsi, 0 
#       mov rax, 0x36
#       syscall

        mov rdi, 3 # SYS_ACCEPT
        mov rsi, 0x0
        mov rdx, 0x0
        mov rax, 0x2B
        syscall

        mov rdi, 3
        mov rax, 0x3
        syscall

        mov rdi, 0
        mov rax, 60
        syscall

.section .data
sockaddr:
	.2byte 2
	.2byte 0x5000 # careful with big endianess
	.4byte 0
	.8byte 0

