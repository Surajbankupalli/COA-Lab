org 100h



start:
    mov al,21h
    sub al,19h

mov bl,al

mov ah,al
and ah,0f0h
shr ah,4
add ah,30h
cmp ah,39h   
jle print_first_digit

add ah,7  

print_first_digit: 
    mov dl,ah
    mov ah,02h
    int 21h

mov ah,bl
and ah,0Fh
add ah,30h
cmp ah,39h  
jle print_second_digit


add ah,7
print_second_digit: 
    mov dl,ah
    mov ah,02h
    int 21h

mov ah,4Ch
int 21h     



