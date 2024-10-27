ORG 100h

mov ah, 09h              
lea dx, msg1             
int 21h                  

mov ah, 01h              
int 21h                  
mov bl, al               

mov ah, 09h              
lea dx, msg2             
int 21h                  

mov ah, 01h              
int 21h                  

cmp bl, al               
je equal                 
jmp not_equal            

equal:
    mov ah, 09h          
    lea dx, equal_msg    
    int 21h              
    jmp done             

not_equal:
    mov ah, 09h          
    lea dx, not_equal_msg
    int 21h              
    jmp done             

done:
    mov ah, 4Ch          
    int 21h              

msg1 db 'Enter first number: $'          
msg2 db 0Dh, 0Ah, 'Enter second number: $' 
equal_msg db 0Dh, 0Ah, 'Equal', 0Dh, 0Ah, '$' 
not_equal_msg db 0Dh, 0Ah, 'Not Equal', 0Dh, 0Ah, '$' 
                 
                 
