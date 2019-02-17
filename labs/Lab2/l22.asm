.model tiny
.386
.data
array1 db 50 dup(50h)
org array1+60d
array2 db 50 DUP(?)
N db 32h
.code
.startup
	mov si,offset array1
	mov di, offset array2
	mov cl,N
x1:	mov al,[si]
	mov [di],al
	inc si
	inc di
	dec cl
	jnz x1
.exit
end
	