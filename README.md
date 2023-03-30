# pwn_college

Training into pwn collge Arizona University WalkThrough Challenges
I'll try to classified for each modules codes 

## Resources
Two website necessary to construct asm programs with syscalls [Ray Chapman][rchapman] and a clean [x64_syscall.sh][syscalls] or for details explanations on asm instructions look @[FelixCloutier][cloutier].

#### ASM

differents ways of compiling asm code

```sh
as -o server.o server.s && ld -o server.o server
```
or 
```sh
gcc --nostdlib -o out source.s
```
It's also possible to get the value of constants throw iptyhon > pwn tools like this (example with AF_INET) :

```python
import pwn
print(int(pwn.constants.AF_INET))
>> 2
```
## License

GPL

**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [syscalls]: <https://x64.syscall.sh/>
   [cloutier]: <https://www.felixcloutier.com/x86/>
   [rchapman]: <https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/>
