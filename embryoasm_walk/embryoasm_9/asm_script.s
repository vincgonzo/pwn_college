.global _start
.intel_syntax noprefix

# Using only the following instructions:
#  and, or, xor

# Implement the following logic:
#  if x is even then
#    y = 1
#  else
#    y = 0

# where:
#  x = rdi
#  y = rax

_start:
	# Bitwise logic 
 	and rdx, 1
	
	xor rax, rdi
 	and rax, 1
	
	int 0x80
