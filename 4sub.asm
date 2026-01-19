.model small
.stack 100h
.data
    num1 db 50
    num2 db 17
    result db 10 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Subtraction
    mov al, num1
    sub al, num2
    
    ; Convert to 2-digit string
    aam
    add ax, 3030h
    mov result, ah
    mov result+1, al
    mov result+2, '$'
    
    ; Print result
    mov ah, 09h
    lea dx, result
    int 21h
    
    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main