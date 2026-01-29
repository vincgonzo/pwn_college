.intel_syntax noprefix
.globl _start


_start:
  mov rax, 60
  mov rdi, 1337
  syscall
