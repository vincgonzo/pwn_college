.intel_syntax noprefix
.global _start

.section .text

_start:
	mov rdi, 0
	mov rsi, rsp
	mov rdx, 256
	syscall

	mov cx, WORD PTR [rsi]
	cmp cx, get_str
	je get_fct
	
	mov rax, 60
	syscall

get_fct:
	nop

.section .data
get_str: .ascii "GET "
post_str: .ascii "POST "
sockaddr:
        .2byte 2
        .2byte 0x5000 # careful with big endianess
        .4byte 0
        .8byte 0
addrlen:
        .quad 16

