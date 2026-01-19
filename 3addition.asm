.model small
.stack 100h
.data
    num1 db 10
    num2 db 8
    result db 10 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Addition
    mov al, num1
    add al, num2
    
    ; Convert to 2-digit string
    aam            ; Split AL into AH (tens) and AL (units)
    add ax, 3030h  ; Convert to ASCII
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