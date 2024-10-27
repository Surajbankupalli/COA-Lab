ORG 100h

mov ah, 09h              
lea dx, msg1             
int 21h                  

mov ah, 01h              
int 21h                  
mov bl, al               
                

mov al, bl               
mov ah, 00               
mov dl, 02               
div dl                   

cmp ah, 0                
je even                  
jmp odd                  

even:
    mov ah, 09h          
    lea dx, even_msg     
    int 21h              
    jmp done             

odd:
    mov ah, 09h          
    lea dx, odd_msg      
    int 21h              
    jmp done             
    
done:
    mov ah, 4Ch          
    int 21h              

msg1 db 'Enter a number: $'        
even_msg db 0Dh, 0Ah, 'Even', 0Dh, 0Ah, '$'   
odd_msg db 0Dh, 0Ah, 'Odd', 0Dh, 0Ah, '$'     
