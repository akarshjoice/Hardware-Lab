section .text
global _start:
_start:
mov word[sum],0
mov byte[i],0
p:
cmp byte[i],10
jnb k
mov word[num],0
call read_num
call find_square_sum
inc byte[i]
jmp p

k:
call print
mov eax,1
mov ebx,0
int 80h





find_square_sum:
pusha
mov ax,word[num]
mov bx,word[num]
mul bx
mov bx,word[sum]
add ax,bx
mov word[sum],ax
popa
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
popa
ret

section .bss
nod:resb 1
num:resw 1
temp:resb 1
sum:resw 1
i:resb 1
