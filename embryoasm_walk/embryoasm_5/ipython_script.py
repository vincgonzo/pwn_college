import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
	# Modulus operation
    mov rax, rdi
	mov rbx, rsi
	div rbx
	mov rcx, rax
	mov rax, rdx

	int 0x80

    """))
print(process.readallS())
