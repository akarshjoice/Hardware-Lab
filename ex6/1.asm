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
call read
fstp qword[float1]
call read
fstp qword[float2]
call read
fstp qword[float3]
fld qword[float2]
fmul qword[float2]
fstp qword[float2sq]
fld1
fadd st0
fadd st0

fmul qword[float1]
fmul qword[float3]
fsubr qword[float2sq]
fst qword[b24ac]
;fldz
;fcom qword[b24ac]
;FSTSW
;SAHF
;je oneroot
fsqrt
fstp qword[b24ac]
fld qword[float1]
fadd qword[float1]
fdivr qword[b24ac]
fstp qword[sec]
fld qword[float1]
fadd qword[float1]
fstp qword[float1]
fld qword[float2]
fchs
fdiv qword[float1]
fstp qword[one]
fld qword[one]
fadd qword[sec]
call print
ffree st0
fld qword[one]
fsub qword[sec]
call print
mov eax,1
mov ebx,0
int 80h







section .data
format1: db "%lf",0
format2: db "The root are : %lf",10
;msg1: db "Enter the radius : "
;len1: equ $-msg1
section .bss
num: resb 1
num2: resw 1
float1:resq 1
float2:resq 1
float3:resq 1
float2sq:resq 1
b24ac:resq 1
one:resq 1
sec:resq 1
