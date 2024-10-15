
ORG 100h

MOV DX, OFFSET input_message  
MOV AH, 09h        
INT 21h            

MOV AH, 01h        
INT 21h            
MOV BL, AL         

CMP AL, '0'        
JL NotDigit        
CMP AL, '9'        
JG NotDigit        


SUB BL, '0'        
MOV AH, 01h        
INT 21h            
MOV BH, AL         

CMP AL, '0'        
JL NotDigit        
CMP AL, '9'        
JG NotDigit        


SUB BH, '0'
SUB BL, BH         
MOV DX, OFFSET output_message  
MOV AH, 09h        
INT 21h            

JNC PositiveResult  
NEG BL              
MOV DL, '-'         
MOV AH, 02h        
INT 21h            

PositiveResult:
ADD BL, '0'        
MOV DL, BL         
MOV AH, 02h        
INT 21h            
JMP EndProgram     

NotDigit:
MOV DX, OFFSET error_message  
MOV AH, 09h        
INT 21h            
EndProgram:
MOV AH, 4Ch        
INT 21h            

input_message  DB 'Enter two digits: $'
output_message DB 0Dh, 0Ah, 'The result is: $'  
error_message  DB 0Dh, 0Ah, 'The entered digits are invalid $'  
END