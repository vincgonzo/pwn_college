.global _start
.intel_syntax noprefix

_start:
        jmp my_label
        .rept 0x51
        	nop
        .endr
my_label:
        pop rdi
        mov rbp, 0x403000
        jmp rbp

