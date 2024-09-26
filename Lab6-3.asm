ORG 100h

start:
    MOV DX, OFFSET msg_input    
    MOV AH, 09h                 
    INT 21h                     

    MOV CX, 10                  
    MOV DI, OFFSET buffer
    
           

input_loop:
    MOV AH, 01h                 
    INT 21h                     
    CMP AL, 0Dh                 
    JE display                  

    STOSB                       
    LOOP input_loop             
    
    
    
display:
    MOV BYTE PTR [DI], '$'      

    MOV DX, OFFSET msg_output   
    MOV AH, 09h                 
    INT 21h                     

    MOV DX, OFFSET buffer       
    MOV AH, 09h                 
    INT 21h                     

    MOV AH, 4Ch                 
    INT 21h 
    
    
                        

msg_input  DB 'Enter characters: $'
msg_output DB 0Dh, 0Ah, 'The entered characters are: $'
buffer     DB 11 DUP (?)        

END start