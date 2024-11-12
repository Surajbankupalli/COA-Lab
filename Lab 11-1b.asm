.model small
.stack 100h
.data
    prompt db 'Enter a single digit number (1-9) for n: $'
    result_msg db 0Dh,0Ah,'The nth Fibonacci number is: $'
    fib dw 0       
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
    mov cl, al     
    cmp cl, 1
    jbe single_digit_fib
    mov ax, 0      
    mov bx, 1      
fib_loop:
    dec cl         
    jz store_result 
    add ax, bx     
    xchg ax, bx    
    jmp fib_loop   
store_result:
    mov fib, ax    
single_digit_fib:
    cmp cl, 0
    je show_fib0
    mov fib, bx    
    jmp display_result
show_fib0:
    mov fib, ax    
display_result:         
    mov ah, 09h
    lea dx, result_msg
    int 21h
    mov ax, fib        
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