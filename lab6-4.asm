ORG 100h     

     
MOV DX, OFFSET msg_input  
MOV AH, 09h        
INT 21h    

        
MOV AH, 01h        
INT 21h            
MOV DL, AL 
MOV BL,AL   

    
CMP AL, 'a'        
JL NotLowerCase    
CMP AL, 'z'        
JG NotLowerCase

    
SUB BL, 20h

        
MOV DX, OFFSET msg_output  
MOV AH, 09h        
INT 21h

MOV DL, BL            
MOV AH, 02h        
INT 21h            
JMP EndProgram     

NotLowerCase:
MOV DX, OFFSET msg_error  
MOV AH, 09h        
INT 21h            

EndProgram:
MOV AH, 4Ch        
INT 21h            

msg_input  DB 'Enter an lowercase letter: $'
msg_output DB 0Dh, 0Ah, 'The uppercase letter is: $'
msg_error  DB 0Dh, 0Ah, 'Error: Not a lowercase letter! $'

END