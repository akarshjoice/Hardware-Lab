section .text
global _start:
_start:
mov byte[i],0
read:
mov eax,3
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
cmp byte[temp],10
je end_read
mov edx,string
mov eax,0
mov al,byte[i]
add edx,eax
mov bl,byte[temp]
mov byte[edx],bl
inc byte[i]
jmp read

end_read:
mov al,byte[i]
mov byte[len],al
mov edx,string
mov eax,0
mov al,byte[i]
add edx,eax
mov byte[edx],30h

program:
mov byte[i],0
p:
mov al,byte[i]
cmp al,byte[len]
jnb printyes
mov edx,string
mov eax,0
mov al,byte[i]
add edx,eax
mov cl,byte[edx]
mov byte[n1],cl
mov edx,string
mov eax,0
mov al,byte[len]
sub al,byte[i]
sub al,1
add edx,eax
mov cl,byte[edx]
mov byte[n2],cl

cmp cl,byte[n1]
jne printno
inc byte[i]
jmp p

printyes:
mov eax,4
mov ebx,1
mov ecx,p1
mov edx,l1
int 80h
jmp exit

printno:
mov eax,4
mov ebx,1
mov ecx,p2
mov edx,l2
int 80h
exit:
mov eax,1
mov ebx,0
int 80h
section .bss
string:resb 100
i:resb 1
temp:resb 1
len:resb 1
count:resb 1
nod:resb 1
n1:resb 1
n2:resb 1
section .data
p1:db 'YES',10
l1:equ $-p1
p2:db 'NO',10
l2:equ $-p2