import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    # Bitwise logic 
    and rdx, 1
	xor rax, rdi
 	and rax, 1

    int 0x80
    """))
print(process.readallS())
