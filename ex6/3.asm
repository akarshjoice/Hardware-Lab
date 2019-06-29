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

mov eax,3
mov ebx,0
mov ecx,t
mov edx,1
int 80h

mov eax,3
mov ebx,0
mov ecx,te
mov edx,1
int 80h


sub byte[t],30h


mov byte[i],0
mov al,byte[t]
mov ah,0
mov bl,8
mul bl
mov byte[t],al




for2:

mov edx,A
mov eax,0
mov al,byte[i]
add edx,eax
push edx
call read
pop edx
fstp qword[edx]

add byte[i],8
mov al,byte[t]
cmp byte[i],al
jb for2

program:
mov byte[i],0
fori:
mov al,byte[t]
cmp byte[i],al
jnb print_array
mov byte[j],0
forj:
mov al,byte[t]
sub al,8
cmp byte[j],al
jnb inci
mov edx,A
mov eax,0
mov al,byte[j]
add edx,eax
fld qword[edx]

mov edx,A
mov eax,0
mov al,byte[j]
add al,8
add edx,eax
fld qword[edx]

fcomi st1
jb switch
p:
ffree st0
ffree st1
add byte[j],8
jmp forj

inci:
add byte[i],8
jmp fori

switch:

mov edx,A
mov eax,0
mov al,byte[j]
add edx,eax
fstp qword[edx]

mov edx,A
mov eax,0
mov al,byte[j]
add al,8
add edx,eax
fstp qword[edx]
jmp p 


print_array:
mov byte[i],0
printarray:
mov al,byte[t]
cmp byte[i],al
jnb exit

mov edx,A
mov eax,0
mov al,byte[i]
add edx,eax

fld qword[edx]
call print
ffree st0
add byte[i],8
jmp printarray
exit:
mov eax,1
mov ebx,0
int 80h


section .data
format1: db "%lf",0
format2: db "%lf",10

section .bss
num: resb 1
num2: resw 1
A:resq 100
t:resb 1
te:resb 1
i:resb 1
j:resb 1
digit:resb 1
size:resw 1
