.model small
.stack 100h
.data
    celsius db 25
    fahr db ?
    result db 10 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; F = (C * 9/5) + 32
    mov al, celsius
    mov bl, 9
    mul bl          ; AX = C*9
    mov bl, 5
    div bl          ; AL = quotient (C*9/5)
    add al, 32     ; AL = Fahrenheit
    
    ; Convert to string
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