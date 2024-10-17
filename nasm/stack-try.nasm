; Filename: stackTry.nasm 
; Author:  Vincent Castanié
;
;
; Purpose: Stack instructions in 64-bit CPU

global _start			

section .text
_start:


	mov rax, 0x1122334455667788
	push rax
	mov rbx, [search]
	mov rdx, 0x5
	push rbx

next_bytes:
	mov cl, bl
	; shift rcx
	shl rcx, 0x8
	inc rbx
	dec rdx
	jnz next_bytes

	; push rcx
	; shrink rbx
	and rbx, 0xffffffffffff0000

	; shl r10, 0x16
	; divide rdx by 2
	;shr rdx, 0x1
	xor rax, rax
	; write syscall
	mov rax, 0x4
	mov ebx, 0x1
	pop rcx
	mov edx, 0x20
	int 0x80
	; mov r15, [rbx]
	

	; exit the program gracefully  

	mov rax, 0x3c
	mov rdi, 0		
	int 0x80	


section .data

search:	db 0x2F, 0x66, 0x6c, 0x61, 0x67
stacker: db 0x16
