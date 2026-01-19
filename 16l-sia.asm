.model small
.stack 100h
.data
    ARR DB 3, 9, 1, 7, 5  ; Array must be in data segment
    min DB ?               ; Variable to store min
    max DB ?               ; Variable to store max
.code
main proc
    mov ax, @data
    mov ds, ax          ; Initialize data segment
    
    lea si, ARR         ; Load array address
    mov cx, 5           ; Array size
    mov al, [si]        ; Initialize min (AL) with first element
    mov bl, [si]        ; Initialize max (BL) with first element
    dec cx              ; Adjust counter (first element already loaded)

CHECK:
    inc si              ; Move to next array element
    mov dl, [si]        ; Load next element
    
    ; Check for new minimum
    cmp dl, al
    jb NEW_MIN
    
    ; Check for new maximum
    cmp dl, bl
    ja NEW_MAX
    jmp NEXT

NEW_MIN:
    mov al, dl          ; Update min
    jmp NEXT

NEW_MAX:
    mov bl, dl          ; Update max

NEXT:
    loop CHECK

    ; Store results
    mov min, al
    mov max, bl

    ; Display min value
    mov dl, al
    add dl, '0'         ; Convert to ASCII
    mov ah, 02h
    int 21h

    ; Display space separator
    mov dl, ' '
    int 21h

    ; Display max value
    mov dl, bl
    add dl, '0'         ; Convert to ASCII
    int 21h

exit:
    mov ah, 4Ch
    int 21h
main endp
end main