.model small
.stack 100h
.data
    MSG1 DB 'Enter Marks (0-99): $'
    NL   DB 0Dh,0Ah,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt
    mov ah, 09h
    lea dx, MSG1
    int 21h

    ; Read first digit
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al          ; BL = tens

    ; Read second digit
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, al          ; BH = ones

    ; Make number in AL
    mov al, bl
    mov bl, 10
    mul bl              ; AL = tens * 10
    add al, bh          ; AL = marks
    mov bl, al          ; BL = marks

    ; Grade decision
    cmp bl, 80
    jae A_PLUS
    cmp bl, 70
    jae A
    cmp bl, 60
    jae A_MINUS
    cmp bl, 50
    jae B
    cmp bl, 40
    jae C
    mov dl, 'F'
    jmp DISP

A_PLUS:
    mov dl, 'A'
    call PUTCH
    mov dl, '+'
    jmp DISP

A:
    mov dl, 'A'
    jmp DISP

A_MINUS:
    mov dl, 'A'
    call PUTCH
    mov dl, '-'
    jmp DISP

B:
    mov dl, 'B'
    jmp DISP

C:
    mov dl, 'C'

DISP:
    call PUTCH

    ; newline
    mov ah, 09h
    lea dx, NL
    int 21h

    ; exit to DOS
    mov ah, 4Ch
    int 21h

; ---- local subroutine (NOT a PROC) ----
PUTCH:
    mov ah, 02h
    int 21h
    ret

main endp
end main
