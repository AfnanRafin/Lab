include 'emu8086.inc'
.stack 100h
.model small

.data  

.code

   main proc   
    
    
     mov al,30
     mov bl,2
     
     div bl
     
     mov bx,ax
     
     print 'R : '
     mov dl,bh
     add dl,48
     mov ah,02h
     int 21h
     
     
     mov dl,10
     mov ah,02h
     int 21h
     
     mov dl,13
     mov ah,02h
     int 21h
     
     print 'Q : '
     mov dl,bl
     add dl,48
     mov ah,02h
     int 21h
     
     mov ah,4ch
     int 21h
     
   main endp
   
end main   