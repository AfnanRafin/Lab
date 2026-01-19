.model small
.stack 100h
.data
    num db 7
    even_msg db 'Even$'
    odd_msg db 'Odd$'
.code
main proc
MOV AH, 01h   ; Input number (0-99)
INT 21h
MOV BH, AL
INT 21h
MOV BL, AL

CMP BH, BL
JE PALIN
MOV DL, 'N'
JMP DISPLAY

PALIN:
MOV DL, 'Y'

DISPLAY:
MOV AH, 02h
INT 21h
;RET
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main