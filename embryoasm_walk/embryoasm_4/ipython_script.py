import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
	# divide operation
	mov rax, rdi
	mov rbx, rsi
	div rbx

	int 0x80

    """))
print(process.readallS())
