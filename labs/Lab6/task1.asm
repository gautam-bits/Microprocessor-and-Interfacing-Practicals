.model tiny
.data
filename	db	'nameID.txt',0
handle		dw	?
myname		db	'ighosh'
nextline	db	0dh,0ah
id			db	'2016B1A7938P'
nextline1	db	0dh,0ah
.code
.startup
	mov		ah,3ch
	lea		dx,filename
	mov		cl,01h
	int		21h
	mov 	handle,ax
	
	mov 	ah,3dh
	mov		al,02h
	lea 	dx,filename
	int 	21h
	
	mov 	bx,ax
	mov 	ah,40h
	mov		cx,22
	lea		dx,myname
	int		21h
	
	mov 	ah,40h
	mov		cx,22
	lea		dx,myname
	int		21h
	
	mov		ah,3eh
	int		21h
	
.exit
end
