section .text
global main
extern scanf
extern printf
print:
push ebp
mov ebp, esp
sub esp, 8
fst qword[ebp-8]
push format2
call printf
mov esp, ebp
pop ebp
ret
read:
push ebp
mov ebp, esp
sub esp, 8
lea eax, [esp]
push eax
push format1
call scanf
fld qword[ebp-8]
mov esp, ebp
pop ebp
ret
main:
fldpi
fld1
fld1
fadd
fmul
call read
fmul

call print
mov eax,1
mov ebx,0
int 80h

section .data
format1: db "%lf",0
format2: db "The Perimeter is : %lf",10
msg1: db "Enter the radius : "
len1: equ $-msg1
section .bss
num: resb 1
num2: resw 1

