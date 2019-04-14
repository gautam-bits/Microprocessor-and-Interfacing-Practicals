.model tiny

.data
	presvid db ?
	curscol1 db 0
	curscol2 db 0
	cursrow1 db 0		
	cursrow2 db 12
	noc db 0
	columns db 80
	prev db ?
	store1 db '#'
	store2 db '$'
.code
.startup
	mov cl,columns

	mov ah,0fh		;getting video mode
	int 10h
	
	mov presvid,al
	
	mov ah,0		;Setting video mode
	mov al,03h
	int 10h
	
x1:	mov ah,01h		;Input character
	int 21h
	
	cmp al,'#'
	jz x3;
	
x5:	inc noc			;Number of characters

	mov ah,02h		;Cursor position 1
	mov dl,curscol1
	mov dh,cursrow1
	mov bh,0
	int 10h
	
	mov ah,09h		;Character at position 1
	mov bh,0
	mov bl,1eh
	mov cx,1
	int 10h

	mov ah,02h		;Cursor position 2
	mov dl,curscol2
	mov dh,cursrow2
	mov bh,0
	int 10h

	mov ah,09h		;Character at position 2
	mov bh,0
	mov bl,7ah
	mov cx,1
	int 10h
	
x3:	cmp prev,'$'
	jz x4;
	
	
	mov prev,al
;	cmp noc,cl
;	jge x2;
	inc curscol1
	inc curscol2
	jmp x1;

;x2:	mov noc,0
;	inc cursrow1
;	inc cursrow2
;	mov curscol1,0
;	mov curscol2,0

;	jmp x1;

x4:
	mov ah,0
	mov al,presvid
	int 10h

.exit
end