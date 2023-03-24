.intel_syntax noprefix
.global _start


.section .text

_start:
	mov rdi, 0 # SYS_READ STDIN
	mov rsi, rsp
	mov rdx, 256
	mov rax, 0
	syscall
	
	mov r10, rsp
	mov r11, 0
first_e:
	mov al, [r10] # loop find first empty character
	cmp al, ' '
	je continue
	add r10, 1
	add r11, 1
	jmp first_e	

continue:
	add r10, 1 # keep string at this point
	mov r8, r10
	mov r9, 0

second_e:
	mov al, [r8] # loop find second empty character
	cmp al, ' '
	je finish
	add r8, 1
	add r9, 1
	jmp second_e	

finish:
	mov BYTE PTR [r8], 0 # path to FILE definition
	mov rdi, 1
	mov rsi, r10
	mov rdx, r9
	mov rax, 1 
	syscall

	mov rdi, r10 # SYS_OPEN FILE
	mov rsi, 2 
	mov rdx, 0 
	mov rax, 2
	syscall

	mov rdi, rax # SYS_READ FILE
	mov rsi, rsp
	mov rdx, 256
	mov rax, 0
	syscall

	mov rdi, 0 
	mov rax, 60
	syscall

