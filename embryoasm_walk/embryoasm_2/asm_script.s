.global _start
.intel_syntax noprefix

_start:
	# Multiples registers 
	mov rax, 0x1337
        mov r12, 0xCAFED00D1337BEEF
        mov rsp, 0x31337
        int3

        int 0x80 # for some reason U have to cut the script with this.
