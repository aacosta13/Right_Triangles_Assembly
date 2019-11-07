;Assembly program calculating hypotenuse values - Assignment 5.
;Armando Acosta
;CPSC240-03

;Assemble: nasm -f elf64 -l asm.lis -o geo.o geometry.asm

global geometry
extern printf
extern scanf

segment .data
emptyline db " ",10,0
intro db "Welcome to Right Triangle Analyzer.",10,0
prompt db "Enter the lengths of the two legs of a right triangle separated by whitespace and press enter.",10,0
floatformat db "%lf %lf",0
length db "The length of the sides of the triangle are %lf and %lf.",10,0
area db "The area of the triangle is %lf units squared.",10,0
hypotenuse db "The hypotenuse has length %lf.",10,0
areaDiv dq 2.0
goodbye db "The program will now return the hypotenuse to the caller.",10,0

segment .bss

segment .text
geometry:
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf

;Intro
mov rax, 0
mov rdi, intro
call printf

;Prompt user to type in lengths
mov rax, 0
mov rdi, prompt
call printf

;Grab user floats
push rax
mov rdi, floatformat
mov rsi, rsp
push rax					;Prepare another push to be able to read second input
mov rdx, rsp
call scanf
pop rax
;Move numbers being pointed to by rsp into xmm registers
movsd xmm15, [rsp]
movsd xmm14, [rsp-8]
pop rax

;Print numbers out in calling convention fashion
movsd xmm0, xmm15
movsd xmm1, xmm14
mov rdi, length
call printf

;Calculate area
movsd xmm9, qword [areaDiv] ;areaDiv holds value 2.0
movsd xmm11, xmm15			;Move lengths into temp registers
movsd xmm10, xmm14
mulsd xmm11, xmm10			;Base x Height
divsd xmm11, xmm9			;Divide by 2.0
movsd xmm0, xmm11

;Print area
mov rdi, area
call printf

;Calculate hypotenuse
movsd xmm11, xmm15			;Reset temp registers to hold lengths
movsd xmm10, xmm14

mulsd xmm11, xmm11			;a^2+b^2=c^2
mulsd xmm10, xmm10
addsd xmm11, xmm10
sqrtsd xmm11, xmm11
movsd xmm0, xmm11			;sqrt(c^2)

;Print hypotenuse
mov rdi, hypotenuse
call printf

;Leave
mov rdi, goodbye
call printf

movsd xmm0, xmm11

popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp

ret

