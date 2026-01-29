
# compile simply assembly
```bash
    as file.s -o file.o
```

# link to make it binary
```bash
    ld -o binary file.o
```


# copy .text section as shellcode
```bash
    objcopy --dump-section .text=shellcode binary
```


# efficient one way 
```bash
    gcc -nostdlib -static -o binary file.o
```

# pwntool way of doing it
```python
from pwn import *
context.arch = "amd64"
shellcode = asm("""
    mav rax, 0x1337
""")
#display bytes
print(disasm(shellcode))
```
