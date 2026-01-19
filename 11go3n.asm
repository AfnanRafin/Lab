.stack 100h
.data
.code
main proc
    MOV AH, 01h   ; Input first number
    INT 21h
    SUB AL, '0'
    MOV BL, AL

    INT 21h       ; Input second number
    SUB AL, '0'
    MOV CL, AL

    INT 21h       ; Input third number
    SUB AL, '0'
    MOV DL, AL

    MOV AL, BL    ; Compare BL and CL
    CMP AL, CL
    JAE CHECK1
    MOV AL, CL

CHECK1:
    CMP AL, DL    ; Compare max(BL,CL) with DL
    JAE DISPLAY
    MOV AL, DL 
    
DISPLAY:
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02h   ; Display result
    INT 21h
    ;RET
exit:
    mov ah, 4Ch
    int 21h
main endp
end main
