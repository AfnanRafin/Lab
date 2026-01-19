.model small
.stack 100h
.data
    year dw 2028
    leap_msg db 'Leap year!$'
    not_leap_msg db 'Not leap year!$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, year
    mov bx, 400
    xor dx, dx
    div bx
    cmp dx, 0
    je leap        ; Divisible by 400
    
    mov ax, year
    mov bx, 4
    xor dx, dx
    div bx
    cmp dx, 0
    jne not_leap   ; Not divisible by 4
    
    mov ax, year
    mov bx, 100
    xor dx, dx
    div bx
    cmp dx, 0
    je not_leap    ; Divisible by 100 but not 400
    
leap:
    mov ah, 09h
    lea dx, leap_msg
    int 21h
    jmp exit
    
not_leap:
    mov ah, 09h
    lea dx, not_leap_msg
    int 21h
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main