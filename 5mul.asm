.model small
.stack 100h
.data
    num1 db 9
    num2 db 7
    result db 10 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Multiplication
    mov al, num1
    mul num2       ; Result in AX
    
    ; Convert to 2-digit string
    aam            ; Split AX into AH/AL
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