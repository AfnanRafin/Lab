.model small
.stack 100h
.data
.code
main proc
    ; Input first number
    call INPUT
    mov BL, AL     ; First number in BL

    ; Input second number
    call INPUT
    mov CL, AL     ; Second number in CL

    ; Perform addition
    call ADDITION

    ; Perform subtraction
    call SUBTRACTION

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

; ---------------- Procedures ----------------
INPUT proc
    mov ah, 01h
    int 21h        ; read char from keyboard ? AL
    sub al, '0'    ; convert ASCII ? number
    ret
INPUT endp

ADDITION proc
    ; print newline first
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h

    ; calculate and print result
    mov al, BL
    add al, CL
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    ret
ADDITION endp

SUBTRACTION proc
    ; print newline first
    mov dl, 0Dh
    mov ah, 02h
    int 21h
    mov dl, 0Ah
    mov ah, 02h
    int 21h

    ; calculate and print result
    mov al, BL
    sub al, CL
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h
    ret
SUBTRACTION endp

end main
