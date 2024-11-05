ORG 100h                  

mov cx, 26                
mov al, 'A'               

print_loop:
                          
    mov dl, al            
    
    mov ah, 02h                
    int 21h               

    inc al                
    loop print_loop       


mov ah, 4Ch               
int 21h                   
