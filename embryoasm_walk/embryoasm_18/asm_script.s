.intel_syntax noprefix

_start:
    mov eax, DWORD PTR [rdi]
    mov ebx, DWORD PTR [rdi + 4]
    mov ecx, DWORD PTR [rdi + 8]
    mov edx, DWORD PTR [rdi + 12]
    mov edi, 0
    int3

    cmp eax, 0x7f454c46
    je calc_sum
    cmp ax, 0x5A4D
    je calc_diff
    jmp calc_product
    
calc_sum: 
    add ebx, ecx
    add ebx, edx
    mov eax, ebx
    jmp exit

calc_diff: 
    sub ebx, ecx
    sub ebx, edx
    mov eax, ebx
    jmp exit

calc_product: 
    imul ebx, ecx
    imul ebx, edx
    mov eax, ebx
    jmp exit

exit:  
    int3

