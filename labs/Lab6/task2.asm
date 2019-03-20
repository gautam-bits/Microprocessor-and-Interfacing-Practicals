.model tiny
.data
filename	db	'nameID.txt',0
hostelroom		db	'VY 159'
.code
.startup
	mov 	ah,3dh
	mov		al,02h
	lea 	dx,filename
	int 	21h
	
	mov 	bx,ax
	
	mov 	ah,42h
	mov		al,00h
	mov		cx,00h
	mov		dx,44
	int		21h
	
	mov 	ah,40h
	mov		cx,06h
	lea		dx,hostelroom
	int		21h
		
	mov		ah,3eh
	int		21h
	
.exit
end
