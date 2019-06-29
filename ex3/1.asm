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
mov byte[count],0
mov byte[i],0
check:
mov cl,byte[len]
cmp byte[i],cl
jnb print_count
mov edx,string
mov eax,0
mov al,byte[i]
add edx,eax
mov bl,byte[edx]
mov byte[temp],bl
cmp byte[temp],'a'
je counter
cmp byte[temp],'e'
je counter
cmp byte[temp],'i'
je counter
cmp byte[temp],'o'
je counter
cmp byte[temp],'u'
je counter
cmp byte[temp],'A'
je counter
cmp byte[temp],'E'
je counter
cmp byte[temp],'I'
je counter
cmp byte[temp],'O'
je counter
cmp byte[temp],'U'
je counter
inc byte[i]
jmp check

counter:
inc byte[count]
inc byte[i]
jmp check


print_count:
cmp byte[count],0
je print0
r:
cmp byte[count],0
je print1
mov al,byte[count]
mov bl,10
mov ah,0
div bl
mov dh,0
movzx dx,ah
push dx
mov byte[count],al
inc byte[nod]
jmp r
print1:
cmp byte[nod],0
je exit
pop dx
mov byte[temp],dl
add byte[temp],30h
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
dec byte[nod]
jmp print1
print0:
mov byte[temp],0
add byte[temp],30h
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
jmp exit

print:
mov byte[i],0
p:
mov cl,byte[len]
cmp byte[i],cl
jnb exit
mov edx,string
mov eax,0
mov al,byte[i]
add edx,eax
mov cl,byte[edx]
mov byte[temp],cl
mov eax,4
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
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