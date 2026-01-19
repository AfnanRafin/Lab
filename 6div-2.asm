include 'emu8086.inc'
.model small
.stack 100h
.data
    dividend db 57
    divisor db 8
    msg_quot db 'Q: $'
    msg_rem db ' R: $'
    tens db ?
    units db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ; Division (corrected)
    mov al, dividend
    xor ah, ah        ; Clear AH (AX = dividend)
    div divisor       ; AL = quotient, AH = remainder
    
    ; Save results
    mov bl, al        ; quotient in BL
    mov bh, ah        ; remainder in BH
    
    ; Print quotient
    mov ah, 09h
    lea dx, msg_quot
    int 21h
    
    ; Convert quotient to ASCII
    mov al, bl
    aam               ; Split into tens (AH) and units (AL)
    add ax, 3030h     ; Convert to ASCII
    mov tens, ah
    mov units, al
    
    ; Print quotient digits
    mov ah, 02h
    mov dl, tens
    int 21h
    mov dl, units
    int 21h
    
    ; Print remainder
    mov ah, 09h
    lea dx, msg_rem
    int 21h
    
    ; Convert remainder to ASCII
    mov al, bh
    aam               ; Split into tens (AH) and units (AL)
    add ax, 3030h     ; Convert to ASCII
    mov tens, ah
    mov units, al
    
    ; Print remainder digits
    mov ah, 02h
    mov dl, tens
    int 21h
    mov dl, units
    int 21h
    
    ; Exit
    mov ah, 4Ch
    int 21h
main endp
end main