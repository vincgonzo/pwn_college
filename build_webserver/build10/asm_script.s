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

        mov r11, rax
        push r11

        mov rax, 0x39 # SYS_FORK
        syscall

        cmp rax, 0 #if condition
        je child

parent:
        mov rdi, [rsp]
        mov rax, 0x3
        syscall

        mov rdi, 3 # SYS_ACCEPT
        mov rsi, 0x0
        mov rdx, 0x0
	mov rax, 0x2B
        syscall

        mov rax, 0x60
        syscall
child:
        mov rdi, 0x3
        mov rax, 0x3
        syscall

        mov rdi, [rsp] # SYS_READ 
        lea rsi, file_read
        mov rdx, 1024
        mov rax, 0
        syscall

        mov r12, rax
        push r12 # KEEP_SIZE CONTENT IN STACK

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
        mov rsi, 0x41 # O_WRONGLY|O_CREAT
        mov rdx, 0x38+0x1c0+0x7 # perm 0777
        mov rax, 2 #SYS_OPEN 
        syscall

	pop rdx #SIZE OF READ for futur SYS_WRITE 
        #mov rcx, rax
        push rax

compare_still:
        #mov eax, [r10]
        cmp DWORD PTR [r10], 0x0a0d0a0d #search for '\r\n\r\n' in str /!\ endianess
        je got_content
        add r10, 1
        add r9, 1
        jmp compare_still

got_content:
        add r10, 4
        add r9, 9
        pop rdi
        mov rsi, r10
        mov rbx, rdx #Calculation for difference the length and the content to read on file
        sub rbx, r9
        mov rdx, rbx
        mov rax, 1 #SYS_WRITE
        syscall

        #mov rdi, rcx
        mov rax, 0x3 #SYS_CLOSE
        syscall


        pop rdi  # SYS_WRITE
        lea rsi, http_resp
        mov rdx, 19
        mov rax, 1
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
random_text: .ascii "hello"
error_code: .ascii "Error during the transmit"
file_read: .ascii "GET /tmp/tmpzvxse8y0 HTTP/1.1\r\n\r\n"
sockaddr:
        .2byte 2
        .2byte 0x5000 # careful with big endianess
        .4byte 0
        .8byte 0
addrlen:
        .quad 16

