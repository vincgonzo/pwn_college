.global _start
.intel_syntax noprefix

_start:
	mov rax, 0
	cmp rdi , 0
	je done
	jmp loop

loop:
	mov rbx, 0
	mov bl, [rdi]
	cmp bl, 0
	je done
	add rax, 1
	add rdi, 1
	jmp loop

done: 
	int3
