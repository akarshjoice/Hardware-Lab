section .text
global _start:
_start:
mov edi,string
cld
read_string:
mov byte[l],0
read:
mov eax,3
mov ebx,0
mov ecx,temp
mov edx,1
int 80h
cmp byte[temp],10
je end_read
mov al,byte[temp]
stosb
inc byte[l]
jmp read
end_read:
mov al,0
stosb


program1:
mov esi,string
mov eax,0
mov al,byte[l]
add esi,eax
sub esi,1
mov byte[i],0

reverse:
std
mov bl,byte[i]
cmp bl,byte[l]
jnb end_reverse
lodsb
mov byte[temp],al
mov edx,string1
mov eax,0
mov al,byte[i]
add edx,eax
mov cl,byte[temp]
mov byte[edx],cl
inc byte[i]
jmp reverse
end_reverse:
mov edx,string1
mov eax,0
mov al,byte[i]
add edx,eax
mov byte[edx],' '
add edx,1
mov byte[edx],0
inc byte[l]

reverse_word:
mov byte[len],0
mov byte[j],0
r:
mov esi,string1
mov eax,0
mov al,byte[j]
add esi,eax
mov al,byte[esi]
mov byte[temp],al
cmp byte[temp],0
je exit
cmp byte[temp],' '
je rev_print1
mov edx,string2
mov eax,0
mov al,byte[len]
add edx,eax
mov cl,byte[temp]
mov byte[edx],cl
inc byte[len]
inc byte[j]
jmp r

rev_print1:
mov esi,string2
mov eax,0
mov al,byte[len]
add esi,eax
sub esi,1
mov byte[i],0
std
reverse1:

mov bl,byte[i]
cmp bl,byte[len]
jnb end_reverse1
lodsb
mov byte[temp],al
mov edx,string3
mov eax,0
mov al,byte[i]
add edx,eax
mov cl,byte[temp]
mov byte[edx],cl
inc byte[i]
jmp reverse1
end_reverse1:
mov edx,string3
mov eax,0
mov al,byte[i]
add edx,eax
mov byte[edx],0



print1:
mov esi,string3

print:
cld
lodsb
mov byte[temp],al
cmp byte[temp],0
je end_print
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
jmp print
end_print:
mov eax,4
mov ebx,1
mov ecx,space
mov edx,1
int 80h
mov byte[len],0
inc byte[j]
jmp r
exit:
mov eax,1
mov ebx,0
int 80h

section .bss
string:resb 100
l:resb 1
temp:resb 1
string1:resb 100
i:resb 1
len:resb 1
string2:resb 100
string3:resb 100
j:resb 1
section .data
space:db ' '