.model small
.stack 100h
.data
    num db 7
    even_msg db 'Even$'
    odd_msg db 'Odd$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov al, num
    test al, 1      ; Test LSB
    jz even_num
    
odd_num:
    mov ah, 09h
    lea dx, odd_msg
    int 21h
    jmp exit
    
even_num:
    mov ah, 09h
    lea dx, even_msg
    int 21h
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main