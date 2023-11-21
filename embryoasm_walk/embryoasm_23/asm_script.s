.global _start
.intel_syntax noprefix

# Jump tables
# A jump table is a contiguous section of memory that holds addresses of places to jump.

# In the above example, the jump table could look like:
#  [0x1337] = address of do_thing_0
#  [0x1337+0x8] = address of do_thing_1
#  [0x1337+0x10] = address of do_thing_2
#  [0x1337+0x18] = address of do_default_thing

# Using the jump table, we can greatly reduce the amount of cmps we use.

# Now all we need to check is if `number` is greater than 2.

# If it is, always do:
#  jmp [0x1337+0x18]
# Otherwise:
#  jmp [jump_table_address + number * 8]

# Using the above knowledge, implement the following logic:
#  if rdi is 0:
#    jmp 0x40304d
#  else if rdi is 1:
#    jmp 0x403125
#  else if rdi is 2:
#    jmp 0x4031e6
#  else if rdi is 3:
#    jmp 0x403294
#  else:
#    jmp 0x403369

# Please do the above with the following constraints:
#  Assume rdi will NOT be negative
#  Use no more than 1 cmp instruction
#  Use no more than 3 jumps (of any variant)
#  We will provide you with the number to 'switch' on in rdi.
#  We will provide you with a jump table base address in rsi.

# Here is an example table:
#  [0x404192] = 0x40304d (addrs will change)
#  [0x40419a] = 0x403125
#  [0x4041a2] = 0x4031e6
#  [0x4041aa] = 0x403294
#  [0x4041b2] = 0x403369

.intel_syntax noprefix
_start:
    cmp di, 3
    jna default
    mov rdi, 4
    
    default:
        lea rax, [rsi + rdi *8]
        mov rax, [rax]
        jmp rax
