include "emu8086.inc"
.model small
.stack 100h
.data
.code
main proc

   print "hello assembly"

    mov ah, 4Ch       ; Exit program
    int 21h
main endp
end main  


