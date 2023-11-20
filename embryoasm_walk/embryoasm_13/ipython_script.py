import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    # Absolute jump 
    mov rdx, 0x403000
    jmp rdx

    int 0x80
    """))
print(process.readallS())
