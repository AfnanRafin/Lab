.model small
.stack 100h
.data
    STR DB 'SOS$'
    MSG DB 'Result: $'
    RES DB ?           ; storage for result char
    NL  DB 0Dh,0Ah,'$'
.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, STR
    lea di, STR

; Find end
FIND_END:
    cmp byte ptr [di], '$'
    je  FOUND_END
    inc di
    jmp FIND_END

FOUND_END:
    dec di

; Check palindrome
CHECK_PAL:
    cmp si, di
    jae PALINDROME
    mov al, [si]
    cmp al, [di]
    jne NOT_PAL
    inc si
    dec di
    jmp CHECK_PAL

PALINDROME:
    mov RES, 'Y'
    jmp DISPLAY

NOT_PAL:
    mov RES, 'N'

DISPLAY:
    mov ah, 09h
    lea dx, MSG
    int 21h

    mov dl, RES    ; ? load saved result char
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, NL
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main
