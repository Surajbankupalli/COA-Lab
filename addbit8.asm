org 100h

mov ax, 0b800h 
mov ds, ax


mov al, 03h  
mov bl, 02h 
add al, bl  


add al, 30h  
                   

mov ah, 0Eh 
int 10h      
ret