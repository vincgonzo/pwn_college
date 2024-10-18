; Filename: arithmetic-64.nasm
; Author:  Vincent Castanié
;
; Purpose: Arithmetic add / sub / CF Instructions 

global _start			

section .text
_start:

	; register based addition 

	mov eax, 0x01
	add eax, 0x01

	mov eax, 0xffffffff
	add rax, 0x01

	mov rax, 0x09
	sub rax, 0x04


	; memory based addition 

	mov rax, qword [var1]
	add qword [var4], rax

	add qword [var4], 0x02


	;  set / clear / complement carry flag 

	clc
	stc
	cmc

	; add with carry 

	mov rax, 0
	stc
	adc rax, 0x1
	stc
	adc rax, 0x2

	; sub borrow

	mov rax, 0x10
	sub rax, 0x5
	stc
	sbb rax, 0x4
	
	; increment & decrement 

	inc rax
	dec rax
	
	; exit the program  

	mov rax, 0x3c
	mov rdi, 0		
	syscall

section .data

	var1	db	0x1
	var2	dw	0x1111
	var3	dq	0xffffffffffffffff
	var4    dd      0x0


