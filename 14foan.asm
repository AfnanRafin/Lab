.model small
.stack 100h
.data
.code
main proc
   MOV AH, 01h   ; Input number (0-5)
INT 21h
SUB AL, '0'
MOV CL, AL
MOV AL, 1

FACT_LOOP:
MUL CL        ; AX = AL * CL
DEC CL
JNZ FACT_LOOP

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