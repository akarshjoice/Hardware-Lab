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
mov byte[s],al
mov byte[size2],al
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
mov byte[i],0
mov byte[j],0
sub byte[size2],1
for1:
 mov ecx,array
 mov edx,array
 cmp byte[size],1
 jne for2
 jmp print
for2:

 mov al,byte[j]
 cmp al,byte[size2]
 jb o
 jmp p
o:
 add edx,1
 mov al,byte[edx]
 cmp byte[ecx],al
 jb swap
change:
 add byte[j],1
 add ecx,1
 jmp for2
p:
mov byte[j],0
sub byte[size],1
;sub byte[size1],1
jmp for1
swap:
;mov dh,byte[array + bl + 1]
mov al,byte[edx]
mov bl,byte[ecx]
mov byte[edx],0
mov byte[ecx],0
mov ah,0
mov bh,0
mov byte[edx],bl
mov byte[ecx],al
jmp change
;printing
print:
mov edx,array
l:
push edx
mov al,byte[edx]
mov ah,0
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
add edx,1
sub byte[s],1
cmp byte[s],0
jne l
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
size1:resb 1
size2:resb 1
s:resb 1
i:resb 1
j:resb 1
section .data
m1:db 'enter n',0Ah
l1:equ $- m1
space:db ' '
ls:equ $- space
ma:db 'Enter The array: ',0Ah
lenma:equ $- ma


