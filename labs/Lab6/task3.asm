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
	
	mov		ah,3fh
	mov		cx,51
	lea		dx,data
	int		21h
	
	lea		dx,data
	mov		ah, 09h
	int		21h
	
	mov		ah,3eh
	int		21h
	
.exit
end