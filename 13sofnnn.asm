.model small
.stack 100h
.data
.code
main proc
   MOV AH, 01h   ; Input N
   INT 21h
   SUB AL, '0'
   MOV CL, AL
   XOR AX, AX    ; Sum in AX

SUM_LOOP:
   ADD AL, CL
   DEC CL
   JNZ SUM_LOOP

   ADD AL, '0'
   MOV DL, AL
   MOV AH, 02h   ; Display sum
   INT 21h
;RET
    
exit:
    mov ah, 4Ch
    int 21h
main endp
end main