.model small
.stack 100h
.data
    num db 7
    even_msg db 'Even$'
    odd_msg db 'Odd$'
.code
main proc
     MOV AH, 01h   ; Input number
INT 21h
SUB AL, '0'
MOV BL, AL
CMP BL, 2
JB NOT_PRIME

MOV CL, 2     ; Divisor
LOOP_START:
CMP CL, BL
JE IS_PRIME
MOV AL, BL
XOR AH, AH
DIV CL
CMP AH, 0
JE NOT_PRIME
INC CL
JMP LOOP_START

IS_PRIME:
MOV DL, 'Y'
JMP DISP

NOT_PRIME:
MOV DL, 'N'

DISP:
MOV AH, 02h
INT 21h
;RET
exit:
    mov ah, 4Ch
    int 21h
main endp
end main