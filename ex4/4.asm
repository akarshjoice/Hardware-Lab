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
mov al,' '
stosb
mov al,0
stosb
mov byte[big],0
mov byte[small],50

program2:
mov byte[len],0
mov byte[j],0
r1:
mov esi,string
mov eax,0
mov al,byte[j]
add esi,eax
mov al,byte[esi]
mov byte[temp],al
cmp byte[temp],0
je program1
cmp byte[temp],' '
je check1
mov edx,string1
mov eax,0
mov al,byte[len]
add edx,eax
mov cl,byte[temp]
mov byte[edx],cl
inc byte[len]
inc byte[j]
jmp r1

check1:
mov al,byte[len]
cmp al,byte[big]
ja change_big1
T1:
mov al,byte[len]
cmp al,byte[small]
jb change_small1
p1:
mov byte[len],0
inc byte[j]
jmp r1

change_big1:
mov cl,byte[len]
mov byte[big],cl
jmp T1

change_small1:
mov cl,byte[len]
mov byte[small],cl
jmp p1



program1:
mov byte[len],0
mov byte[j],0
r:
mov esi,string
mov eax,0
mov al,byte[j]
add esi,eax
mov al,byte[esi]
mov byte[temp],al
cmp byte[temp],0
je program3
cmp byte[temp],' '
je check
mov edx,string1
mov eax,0
mov al,byte[len]
add edx,eax
mov cl,byte[temp]
mov byte[edx],cl
inc byte[len]
inc byte[j]
jmp r

check:
mov al,byte[len]
cmp al,byte[big]
je change_big
p:
mov byte[len],0
inc byte[j]
jmp r

change_big:
mov esi,string1
mov edi,string2
mov ecx,0
mov cl,byte[len]
copy:
movsb
loop copy
mov byte[edi],0
printlol:
mov esi,string2

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
jmp p

program3:
mov eax,4
mov ebx,1
mov ecx,line
mov edx,1
int 80h
mov byte[len],0
mov byte[j],0
r2:
mov esi,string
mov eax,0
mov al,byte[j]
add esi,eax
mov al,byte[esi]
mov byte[temp],al
cmp byte[temp],0
je exit
cmp byte[temp],' '
je check2
mov edx,string1
mov eax,0
mov al,byte[len]
add edx,eax
mov cl,byte[temp]
mov byte[edx],cl
inc byte[len]
inc byte[j]
jmp r2

check2:
mov al,byte[len]
cmp al,byte[small]
je change_small
p2:
mov byte[len],0
inc byte[j]
jmp r2

change_small:
mov esi,string1
mov edi,string2
mov ecx,0
mov cl,byte[len]
copy2:
movsb
loop copy2
mov byte[edi],0
printlol2:
mov esi,string2

print2:
cld
lodsb
mov byte[temp],al
cmp byte[temp],0
je end_print2
mov eax,4
mov ebx,1
mov ecx,temp
mov edx,1
int 80h
jmp print2
end_print2:
mov eax,4
mov ebx,1
mov ecx,space
mov edx,1
int 80h
jmp p2


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
big:resb 1
small:resb 1
section .data
space:db ' '
line:db 0ah