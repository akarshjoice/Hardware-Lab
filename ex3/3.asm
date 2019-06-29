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
mov al,byte[len]
cmp byte[i],al
jnb exit
mov edx,string
mov eax,0
mov al,byte[i]
add edx,eax
mov cl,byte[edx]
mov byte[temp],cl
cmp byte[temp],'A'
je next
cmp byte[temp],'I'
je next
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
inc byte[i]
jmp p
next:
inc byte[i]
jmp p

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