import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
	# Register sizes for Modulus operation
    mov rcx, rdi
    mov al, cl
    mov rdx, rsi
    mov bx, dx #mov part of registrers to % values

    int 0x80

    """))
print(process.readallS())
