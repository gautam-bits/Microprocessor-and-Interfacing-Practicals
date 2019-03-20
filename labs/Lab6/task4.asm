.model tiny
.data
filename	db	'nameID.txt',0
data		db	100 dup('$')
.code
.startup
	mov 	ah,3dh
	mov		al,02h
	lea 	dx,filename
	int 	21h
	
	mov 	bx,ax
	
	lea		dx, data
x:	mov 	cx,01h
	mov 	ah,3fh
	int 	21h
	inc 	dx
	cmp		ax,00h
	jnz		x
	
	mov		ah,09h
	lea		dx,data
	int 	21h
	
	mov 	ah,3eh
	int 	21h
.exit
end