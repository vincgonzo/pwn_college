.intel_syntax noprefix
_start:
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

