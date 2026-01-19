.model small
.stack 100h
.data
    STR DB 'HELLO$'   ; Define string in data segment
.code
main proc
    mov ax, @data
    mov ds, ax        ; Initialize data segment
    
    lea si, STR       ; Load start address of string
    lea di, STR       ; DI will find end of string

; Find end of string (locate '$' terminator)
FIND_END:
    cmp [di], '$'     ; Check for terminator
    je  REVERSE       ; Found terminator
    inc di            ; Move to next character
    jmp FIND_END

REVERSE:
    dec di            ; Point to last character before '$'
    
    ; Reverse string by swapping characters
    REVERSE_LOOP:
    cmp si, di        ; Check if pointers have met/crossed
    jae DONE          ; If yes, we're done
    mov al, [si]     ; Swap characters
    xchg al, [di]
    mov [si], al
    inc si            ; Move pointers inward
    dec di
    jmp REVERSE_LOOP

DONE:
    ; Display reversed string
    mov ah, 09h
    lea dx, STR
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main