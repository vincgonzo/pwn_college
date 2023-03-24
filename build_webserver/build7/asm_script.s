.intel_syntax noprefix
.global _start

.section .text

_start:
        mov rdi, 2 # SYS_SOCKET
        mov rsi, 1
        mov rdx, 0
        mov rax, 0x29
        syscall

        mov rdi, 3 # SYS_BIND 
        lea rsi, [rip + sockaddr] # pointer 
        mov rdx, 16
        mov rax, 0x31
        syscall

        mov rdi, 3 # SYS_LISTEN
        mov rsi, 0 
        mov rax, 0x32
        syscall

        mov rdi, 3 # SYS_ACCEPT
        mov rsi, 0x0
        mov rdx, 0x0
        mov rax, 0x2B
        syscall

        mov rdi, 4 # SYS_READ 
        lea rsi, file_read
        mov rdx, 256
        mov rax, 0
        syscall

        mov r8, rsi # result of our last syscall into r8
first_e:
        mov al, [r8]
        cmp al, ' '
        je continue
        add r8, 1
        jmp first_e

continue:
        add r8, 1
        mov r10, r8
        mov r9, 0
second_e:
        mov al, [r10]
        cmp al, ' '
        je finish
        add r10, 1
        add r9, 1
        jmp second_e
finish:
        mov BYTE PTR [r10], 0 # doing the NULL Byte
        test rax, rax
        js error
        mov rdi, r8 # gives a hexa instead of filePath
        mov rsi, 0 
        mov rdx, 0
        mov rax, 2
        syscall

        mov rcx, rax
        push rcx
        mov rdi, rcx
        mov rsi, r8
        mov rdx, 1024
        mov rax, 0 # SYS_READ
        syscall

        mov r12, rax
        pop rdi
        mov rax, 0x3
        syscall

        mov rdi, 4  # SYS_WRITE
        lea rsi, http_resp
        mov rdx, 19
        mov rax, 1
        syscall

        mov rdi, 4
        mov rsi, r8
        mov rdx, r12 #count from return SYS_READ
        mov rax, 1
        syscall

        mov rdi, 4
        mov rax, 0x3
        syscall

        mov rdi, 0
        mov rax, 60
        syscall

error:
        mov rdi, 4  # SYS_WRITE
        lea rsi, error_code
        mov rdx, 19
        mov rax, 1
	syscall

.section .data
http_resp: .ascii "HTTP/1.0 200 OK\r\n\r\n"
error_code: .ascii "Error during the transmit"
file_read: .ascii "GET /tmp/tmpzvxse8y0 HTTP/1.1\r\n\r\n"
sockaddr:
        .2byte 2
        .2byte 0x5000 # careful with big endianess
        .4byte 0
        .8byte 0
addrlen:
        .quad 16
