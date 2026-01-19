.model small
.stack 100h
.data
    num db -5
    pos_msg db 'Positive$'
    neg_msg db 'Negative$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, num
    or al, al
    jns positive   ; Jump if sign flag=0
    
negative:
    mov ah, 09h
    lea dx, neg_msg
    int 21h
    jmp exit
    
positive:
    mov ah, 09h
    lea dx, pos_msg
    int 21h
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main