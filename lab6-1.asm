ORG 100h           
            
            
MOV DX, OFFSET input_message  
MOV AH, 09h
int 21h
            


MOV AH,01h        
INT 21h            
MOV DL,AL   
MOV BL,AL 
      


MOV DX, OFFSET output_message
MOV AH, 09h
int 21h


MOV DL,BL
MOV AH,02h        
INT 21h            


MOV AH,4Ch        
INT 21h  

input_message  DB 'Enter a character: $'
output_message DB 0Dh, 0Ah, 'The entered character is: $'         

END               


 