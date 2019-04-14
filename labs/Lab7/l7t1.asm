.model tiny
.data
string db 'DOLL'
count db 4
.code 
.startup
	mov ah, 00h ; set display model
	mov al,3
	int 10h
	lea si,string
	mov dl,40 ; initialize column
	
	x1:	mov ah,02h
		mov bh,0
		mov dh,12
		int 10h
		mov al,[si]; Character to be displayed
		mov ah,09h
		mov bl,8fh
		mov bh,0
		mov cx,1
		int 10h
		inc si
		inc dl ; move the cursor forward
		dec byte ptr count
		jnz x1
		; end loop
		;begin blocking
		mov ah,07h
	x2:	int 21h
		cmp al,'%'
		jnz x2
.exit 
end
	