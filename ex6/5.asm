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
fldz
fstp qword[l]

mov byte[odd],1
fldz
fstp qword[sum]
call read

fstp qword[x]

for:
mov byte[i],0
fld1
fori:
mov al,byte[i]
cmp al,byte[odd]
je go_fact
fmul qword[x]
inc byte[i]
jmp fori

go_fact:
fstp qword[power]
fld1
fstp qword[one]
fld1
fstp qword[s]
fld1
mov byte[j],1
facti:
mov al,byte[j]
cmp al,byte[odd]
ja program
fmul qword[s]
fstp qword[fact]
fld qword[s]
fadd qword[one]
fstp qword[s]
fld qword[fact]
inc byte[j]
jmp facti

program:

fld qword[power]
fdiv qword[fact]
fstp qword[term]
ffree st0
fld qword[term]
fldz
fcomip st1
je next
ffree st0 

;fld qword[sum]
fld1
fld qword[l]
fcomip st1
je subi
ffree st0
fld qword[sum]
fadd qword[term]
fstp qword[sum]
fld1
fstp qword[l]
add byte[odd],2
jmp for

subi:
ffree st0
fld qword[sum]
fsub qword[term]
fstp qword[sum]
fldz
fstp qword[l]
add byte[odd],2
jmp for



next:
ffree st0
fld qword[sum]
call print
mov eax,1
mov ebx,0
int 80h



section .data
format1: db "%lf",0
format2: db "%lf",10

section .bss
num: resb 1
num2: resw 1
A:resq 1
B:resq 1
C:resq 1
D:resq 1
D1:resq 1
i:resb 1
j:resb 1
odd:resb 1
x:resq 1
sum:resq 1
power:resq 1
fact:resq 1
term:resq 1
s:resq 1
one:resq 1
l:resq 1

























