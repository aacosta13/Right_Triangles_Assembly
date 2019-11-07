#/bin/bash

#Author: A. Acosta
#Assignment 5

rm *.o

rm *.out

echo "Compile main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Assemble geometry.asm"
nasm -f elf64 -l asm.lis -o geo.o geometry.asm

echo "Link the two o files."
gcc -m64 -Wall -fno-pie -no-pie -o geofinal.out main.o geo.o

echo "Run this program"
./geofinal.out

echo "Goodbye"

