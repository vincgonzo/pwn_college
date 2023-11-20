import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    # Bitwise and operation
    and rdi, rsi
    xor rax, rax
    add rax, rdi

    int 0x80
    """))
print(process.readallS())
