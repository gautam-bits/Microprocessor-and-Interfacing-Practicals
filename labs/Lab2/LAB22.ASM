.model	tiny
.data
array1	db		50 dup(11h)
array   db		60 dup(0)
array2	db		50 dup(?)
N		db		32h
.code
.startup
		mov		si,offset array1
		mov		di,offset array2
		mov		cl,N
	l1:	mov		al,[si]
		mov		[di],al
		inc si
		inc di
		dec cl
		jnz l1
.exit
end	