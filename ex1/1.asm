section .text
global _start:
_start:
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
mov bl,10
mul bl
add al,byte[digit2]
mov byte[a],al


mov eax,4
mov ebx,1
mov ecx,m2
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
mov bl,10
mul bl
add al,byte[digit2]
mov byte[b],al

mov eax,4
mov ebx,1
mov ecx,m3
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
mov ah,0
mov al,byte[digit1]
mov bl,10
mul bl
add al,byte[digit2]
mov byte[size],al
mov byte[size1],al
mov eax,4
mov ebx,1
mov ecx,ma
mov edx,lenma
int 80h

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
mov bl,10
mov ah,0
mul bl
add al,byte[digit2]
pop ebx
mov byte[ebx],al
add ebx,1
sub byte[size1],1
cmp byte[size1],0
jne read
cmp byte[a],0
je exit
cmp byte[b],0
je exit

mov edx,array
check1:
mov ah,0
mov al,byte[edx]
cmp al,0
je l
mov bl,byte[a]
div bl
mov bl,0
cmp ah,bl
je check2
l:
sub byte[size],1
add edx,1
cmp byte[size],0
jne check1
jmp exit
check2:
mov ah,0
mov al,byte[edx]
mov bl,byte[b]
div bl
mov bl,0
cmp ah,bl
je print
jmp l
;pop ecx
;add edx,1
;cmp byte[ecx],0
;jne l 
;jmp exit
print:
push edx
mov ah,0
mov al,byte[edx]
mov bl,10
div bl
mov byte[digit1],al
mov byte[digit2],ah
add byte[digit1],30h
add byte[digit2],30h
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
mov ecx,space
mov edx,ls
int 80h
pop edx
jmp l
;pop ecx
;add edx,1
;cmp byte[ecx],0
;jne l
;jmp exit
exit:
mov eax,1
mov ebx,0
int 80h

section .bss
digit1:resb 1
digit2:resb 1
a:resb 1
b:resb 1
temp:resb 1
size:resb 1
size1:resb 1
array:resb 100
section .data
m1:db 'enter a',0Ah
l1:equ $- m1
m2:db 'enter b',0Ah
l2:equ $- m2
m3:db 'enter n',0Ah
l3:equ $- m3
space:db ' '
ls:equ $- space
ma:db 'Enter The array: ',0Ah
lenma:equ $- ma

                                                                  
