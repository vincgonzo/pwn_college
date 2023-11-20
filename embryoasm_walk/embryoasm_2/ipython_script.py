import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    mov rax, 0x1337
    mov r12, 0xCAFED00D1337BEEF
    mov rsp, 0x31337
    int3

    int 0x80
    """))
print(process.readallS())
