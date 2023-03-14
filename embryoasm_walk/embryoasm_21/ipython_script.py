import pwn

pwn.context.update(arch="amd64")
process=pwn.process("/challenge/run")
process.write(pwn.asm("""
   int3
   mov rax, 0
   cmp rdi , 0
   je done

   loop:
   mov rbx, 0
   mov bl, [rdi]
   cmp bl, 0
   je done
   add rax, 1
   add rdi, 1
   jmp loop

   done: 
   int3
   """))
print(process.readallS())

