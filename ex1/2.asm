section .text
global _start:
_start:
;sizeofarray
mov eax,4
mov ebx,1
mov ecx,m1
mov edx,l1
int 80h
mov eax,3
mov ebx,0
mov ecx,digit1
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,digit2
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
sub byte[digit1],30h
sub byte[digit2],30h
mov al,byte[digit1]
mov ah,0
mov bl,10
mul bl
add al,byte[digit2]
mov byte[size],al
mov byte[size1],al
cmp byte[size],0
je exit
mov eax,4
mov ebx,1
mov ecx,ma
mov edx,lenma
int 80h
;inputing array
mov ebx,array
read:
push ebx
mov eax,3
mov ebx,0
mov ecx,digit1
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,digit2
mov edx,1
int 80h
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
sub byte[digit1],30h
sub byte[digit2],30h
mov al,byte[digit1]
mov ah,0
mov bl,10
mul bl
add al,byte[digit2]
pop ebx
mov byte[ebx],al
add ebx,1
sub byte[size1],1
cmp byte[size1],0
jne read
;counting
mov edx,array
mov byte[odd],0
mov byte[even],0
l:
mov al,byte[edx]
mov bl,2
mov ah,0
div bl
cmp ah,0
je evencount
add byte[odd],1
next:
add edx,1
sub byte[size],1  
cmp byte[size],0
jne l
jmp print

evencount:
add byte[even],1
jmp next

print:
mov al,byte[even]
mov ah,0
mov bl,10
div bl
mov byte[digit1],al
mov byte[digit2],ah
add byte[digit1],30h
add byte[digit2],30h
mov eax,4
mov ebx,1
mov ecx,noeven
mov edx,le
int 80h
mov eax,4
mov ebx,1
mov ecx,digit1
mov edx,1
int 80h
mov eax,4
mov ebx,1
mov ecx,digit2
mov edx,1
int 80h

mov eax,4
mov ebx,1
mov ecx,line
mov edx,ll
int 80h

mov al,byte[odd]
mov ah,0
mov bl,10
div bl
mov byte[digit1],al
mov byte[digit2],ah
add byte[digit1],30h
add byte[digit2],30h
mov eax,4
mov ebx,1
mov ecx,noodd
mov edx,lo
int 80h
mov eax,4
mov ebx,1
mov ecx,digit1
mov edx,1
int 80h
mov eax,4
mov ebx,1
mov ecx,digit2
mov edx,1
int 80h
exit:
mov eax,1
mov ebx,0
int 80h


section .bss
digit1:resb 1
digit2:resb 1
size:resb 1
array:resb 100
temp:resb 1
odd:resb 1
even:resb 1
size1:resb 1
section .data
m1:db 'enter n',0Ah
l1:equ $- m1
noeven:db 'no of even:'
le:equ $- noeven
noodd:db 'no of odd:'
lo:equ $- noodd
line:db 0Ah
ll:equ $- line
ma:db 'Enter The array: ',0Ah
lenma:equ $- ma














