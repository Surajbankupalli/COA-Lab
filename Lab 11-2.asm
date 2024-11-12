.model small
.stack 100h
.data
    prompt db 'Enter a single digit number (0-9): $'
    result_msg db 0Dh,0Ah,'The factorial is: $'
    factorial dw 1    
.code
main proc
    mov ax, @data
    mov ds, ax
    mov ah, 09h
    lea dx, prompt
    int 21h
    mov ah, 01h
    int 21h
    sub al, '0'        
    mov bl, al         
    cmp bl, 0
    jne calculate_factorial
    mov factorial, 1
    jmp display_result
calculate_factorial:
    mov cx, bx         
    mov ax, 1          
factorial_loop:
    mul cx            
    loop factorial_loop 
    mov factorial, ax  
display_result:
    mov ah, 09h
    lea dx, result_msg
    int 21h
    mov ax, factorial  
    call print_number  
    mov ah, 4Ch
    int 21h
main endp
print_number proc
    mov cx, 10        
    mov bx, 0         
reverse_digits:
    xor dx, dx        
    div cx            
    push dx           
    inc bx            
    test ax, ax       
    jnz reverse_digits
display_digits:
    pop dx            
    add dl, '0'       
    mov ah, 02h       
    int 21h           
    dec bx            
    jnz display_digits
    ret
print_number endp
end main