# NASM training 

Training from security ASM course

## Resources
Two website necessary to construct asm programs with syscalls [Ray Chapman][rchapman] and a clean [x64_syscall.sh][syscalls] or for details explanations on asm instructions look @[FelixCloutier][cloutier].

#### ASM

two ways to compile to get a binary from NASM code

```sh
nasm -f elf64 -o <object_file>.o -g <code_source_file>.nasm && ld -o <output_file>.o
```
or using compile.sh which details previous command 
```sh
chmod +x compile.sh && ./compile.sh
```

GPL

**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [syscalls]: <https://x64.syscall.sh/>
   [cloutier]: <https://www.felixcloutier.com/x86/>
   [rchapman]: <https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/>
