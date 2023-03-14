import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    jmp next
    .rept 0x51
    nop
    .endr

    next:
    mov rdi, [rsp]
    mov r12, 0x403000
    jmp r12
    """))
print(process.readallS())
