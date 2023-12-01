import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    mov rax, 0
    mov rcx, rsi

    cmp rcx, 0
    je calc_average

calc_sum:
    int3
    add rax, [rdi]
    add rdi, 8
    loop calc_sum # loop implicitly decrement rcx

calc_average:
    int3
    cqo
    int3
    idiv rsi
    int3

verify: # this is useless but the previous code doesn't work without this ...
    cqo
    idiv rcx

    mov eax, 60
    xor edi, edi
    syscall

    """))
print(process.readallS())

