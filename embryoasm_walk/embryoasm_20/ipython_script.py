import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    jmp my_label
        .rept 0x51
        	nop
        .endr
    my_label:
        pop rdi
        mov rbp, 0x403000
        jmp rbp

    """))
print(process.readallS())

