.global _start
.intel_syntax noprefix

# Now, we will combine the two prior levels and perform the following:
#  Create a two jump trampoline:
#    Make the first instruction in your code a jmp
#    Make that jmp a relative jump to 0x51 bytes from its current position
#    At 0x51 write the following code:
#      Place the top value on the stack into register rdi
#      jmp to the absolute address 0x403000

# We will now set the following in preparation for your code:
#  Loading your given code at: 0x400026
#  (stack) [0x7fffff1ffff8] = 0x2e
#

_start:
        jmp my_label
        .rept 0x51
        	nop
        .endr
my_label:
        pop rdi
        mov rbp, 0x403000
        jmp rbp

