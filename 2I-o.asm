include 'emu8086.inc'
.model small
.stack 100h
.data
.code

main proc
    
     print 'Enter a character:'  
     
     mov ah, 1h
     int 21h
     mov bl, al
     
     mov dl, 13d
     mov ah, 2h
     int 21h  
     
     mov dl, 10d
     mov ah, 2h
     int 21h
     
     print 'You entered:'
     
     mov dl, bl
     mov ah, 2h
     int 21h
     
     
     
     mov ah,4ch
     int 21h
  end main   