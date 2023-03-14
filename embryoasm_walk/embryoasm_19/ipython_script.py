import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
    mov ecx, DWORD PTR [rdi]
    mov ebx, DWORD PTR [rdi + 0x4]
    mov edx, DWORD PTR [rdi + 0x8]
    mov esi, DWORD PTR [rdi + 0x12]
    mov eax, ebx
    int3

    cmp ecx, 0x7f454c46
    je calc_sum
    cmp cx, 0x5A4D
    je calc_diff
    jmp calc_product
    calc_sum: 
        add rax, rdx
        add rax, rsi
        jmp exit
    calc_diff: 
        sub eax, edx
        sub eax, esi
        jmp exit
    calc_product: 
        imul rax, rdx
        imul rax, rsi
        jmp exit
    exit:  
        int3
    """))
print(process.readallS())

