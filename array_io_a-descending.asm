     .model small
.stack 100h

.data
ARR DB 5 DUP(?)
NL  DB 0Dh, 0Ah, '$'   ; New line

.code
main proc
    mov ax, @data
    mov ds, ax

; -------- INPUT 5 CHARACTERS --------
    mov cx, 5
    lea si, ARR

INPUT:
    mov ah, 01h
    int 21h
    mov [si], al
    inc si
    loop INPUT

; -------- SORT ARRAY (ASCENDING) --------
    mov cx, 4          ; Outer loop (n-1)

OUTER:
    lea si, ARR
    mov bx, cx         ; Inner loop counter

INNER:
    mov al, [si]
    mov dl, [si+1]
    cmp al, dl
    jbe NOSWAP

    ; Swap
    mov [si], dl
    mov [si+1], al

NOSWAP:
    inc si
    dec bx
    jnz INNER
    loop OUTER

; -------- PRINT NEW LINE --------
    lea dx, NL
    mov ah, 09h
    int 21h

; -------- OUTPUT (DESCENDING ORDER) --------
    mov cx, 5
    lea si, ARR
    add si, 4          ; Point to last element

OUTPUT:
    mov dl, [si]
    mov ah, 02h
    int 21h
    dec si
    loop OUTPUT

; -------- EXIT --------
    mov ah, 4Ch
    int 21h
main endp
end main
