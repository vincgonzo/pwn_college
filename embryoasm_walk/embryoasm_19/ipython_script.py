import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    int3
    cmp di, 3
    int3
    jna default
    mov rdi, 4
    
    default:
        lea rax, [rsi + rdi *8]
        mov rax, [rax]
        jmp rax
    int3

    """))
print(process.readallS())

