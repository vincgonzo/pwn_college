.global _start
.intel_syntax noprefix

# Conditional branches
# Implementing the above logic with jmps can be done like so:
; assume rdi = x, rax is output
; rdx = rdi mod 2
#  mov rax, rdi
#  mov rsi, 2
#  div rsi
; remainder is 0 if even
#  cmp rdx, 0
; jump to not_even code is its not 0
#  jne not_even
; fall through to even code
#  mov rbx, 1
#  jmp done
; jump to this only when not_even
#  not_even:
#  mov rbx, 0
; done:
#  mov rax, rbx

_start:
    mov eax, DWORD PTR [rdi]
    mov ebx, DWORD PTR [rdi + 4]
    mov ecx, DWORD PTR [rdi + 8]
    mov edx, DWORD PTR [rdi + 12]
    mov edi, 0
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
