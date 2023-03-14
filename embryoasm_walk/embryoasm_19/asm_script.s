.intel_syntax noprefix
# if [x] is 0x7f454c46:
#   y = [x+4] + [x+8] + [x+12]
# else if [x] is 0x5A4D:
#   y = [x+4] - [x+8] - [x+12]
# else:
#   y = [x+4] * [x+8] * [x+12]

_start:
    mov ecx, DWORD PTR [rdi]
    mov ebx, DWORD PTR [rdi + 0x4]
    mov edx, DWORD PTR [rdi + 0x8]
    mov esi, DWORD PTR [rdi + 0x12]
    int3
    cmp ecx, 0x7f454c46
    je calc_sum
    sub cx, 0x5A4D 
    je calc_diff
    jmp calc_product

calc_sum:
    mov eax, [ebx]
    add eax, [edx]
    add eax, [esi]
    int3

calc_diff:
    mov eax, [ebx]
    sub eax, [edx]
    sub eax, [esi]
    int3

calc_product:
    mov rax, rbx
    imul rax, rdx
    cmp rsi, 0x0
    jz exit
    imul rax, rsi
    int3

exit:
    nop
    int 0x80

