#!/bin/bash

echo '[+] Assembling with Nasm ...'
nasm -f elf64 -o $1.o -g $1.nasm

echo '[+] Linking ...'
ld -o $1 $1.o

echo '[+] Done!'
