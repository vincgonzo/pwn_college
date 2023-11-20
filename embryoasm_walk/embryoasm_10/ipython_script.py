import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    # Memory reads
    mov rax, [0x404000]

    int 0x80
    """))
print(process.readallS())
