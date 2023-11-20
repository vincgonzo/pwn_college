import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    # Bitwise shift
    mov rcx, rdi
    shr rcx, 0x20
    mov al, cl

    int 0x80
    """))
print(process.readallS())
