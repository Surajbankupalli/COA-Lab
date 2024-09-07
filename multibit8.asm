org 100h 


num1 db 11h
num2 db 12h
mov al,num1
mul num2
mov bx,ax
AND ax,0F000h
shr ax, 12
add ax,30h
cmp ax,39h
jle bit_1
add ax,7h
bit_1: mov dl,al
       mov ah,02h
       int 21h 
       
mov ax,bx
and ax,0F00h
shr ax,8
add ax,30h
cmp ax,39h
jle bit_2
add ax,7h
bit_2: mov dl,al
       mov ah,02h
       int 21h  
mov ax,bx
and ax,00F0h
shr ax,4
add ax,30h
cmp ax,39h
jle bit_3
add ax,7h
bit_3: mov dl,al
       mov ah,02h
       int 21h  
mov ax,bx
and ax,000Fh
add ax,30h
cmp ax,39h
jle bit_4
add ax,7h
bit_4: mov dl,al
       mov ah,02h
       int 21h
ret