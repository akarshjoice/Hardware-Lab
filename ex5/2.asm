section .text
global _start:
_start:

call read_num
cmp word[num],0
je t
mov word[sum],0
call print
mov word[j],1
p:
mov ax,word[j]
mov word[i],ax
call fibo
mov ax,word[sum]
cmp ax,word[num]
ja exit
call print
inc word[j]
mov word[sum],0
jmp p

r:
call print
exit:
mov eax,1
mov ebx,0
int 80h
t:
mov word[sum],0
jmp r

fibo:
cmp word[i],0
je return_zero
cmp word[i],1
je return_one
mov dx,word[i]
push dx
sub word[i],1
call fibo
pop dx
mov word[i],dx
sub word[i],2
call fibo
ret

return_one:
add word[sum],1
ret
return_zero:
add word[sum],0
ret
read_num:
pusha
read:
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
cmp byte[temp],10
je end_read
mov dx,0
mov ax,word[num]
mov bx,10
mul bx
mov bx,0
sub byte[temp],30h
mov bl,byte[temp]
add ax,bx
mov word[num],ax
jmp read
end_read:
popa
ret

print:
pusha
cmp word[sum],0
je print0
extract:
cmp word[sum],0
je print1
mov dx,0
mov ax,word[sum]
mov bx,10
div bx
push dx
inc byte[nod]
mov word[sum],ax
jmp extract
print1:
cmp byte[nod],0
je end_print
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
mov byte[temp],30h
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
end_print:
mov eax,4
mov ebx,1
mov ecx,space
mov edx,1
int 80h
popa
ret

section .bss

nod:resb 1
num:resw 1
temp:resb 1
sum:resw 1
i:resb 1
n:resb 1
j:resb 1
section .data
space:db ' '