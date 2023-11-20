import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    # Memory reads & write 
    mov edx, [edi]
    add rdi, 8
    mov rcx, [rdi]
    mov rax, rsi
    mov [rsi], rcx
    add [rsi], rdx

    int 0x80
    """))
print(process.readallS())
