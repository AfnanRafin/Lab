.model small
.stack 100h
.data
.code
main proc
  MOV CX, 5     ; Array size
LEA SI, ARR

INPUT:
MOV AH, 01h
INT 21h
MOV [SI], AL
INC SI
LOOP INPUT

MOV CX, 5
LEA SI, ARR

OUTPUT:
MOV DL, [SI]
MOV AH, 02h
INT 21h
INC SI
LOOP OUTPUT
;RET

ARR DB 5 DUP(?)
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main