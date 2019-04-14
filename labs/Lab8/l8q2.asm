.model tiny
.486
.data
	Len			equ	100		
	Wid			equ	80		
	IniX		equ	80		
	IniY		equ	70		
	VidMode1	db	12h		
	VidMode2	db	03h		
	RowDisp		db	00		
	ColumnDisp	db	00
	PageNum	db	00
	PixelColor	db	0Ch		
	PixelRow	dw	70
	PixelColumn	dw	80
.code
.startup
	mov	ah,	00h			;Set Display Mode
	mov	al,	VidMode1
	int	10h
	mov	bx,	Len		
x1:	mov	ah,	0Ch			
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	inc PixelColumn
	mov	dx,	PixelRow
	int	10h
	dec	bx
	jnz	x1
	mov	bx,	Wid		
x2:	inc	PixelRow
	mov	PixelColumn,IniX
	mov	ah,	0Ch			;
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	add PixelColumn,Len
	mov	dx,	PixelRow
	int	10h
	mov	ah,	0Ch			
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	mov	dx,	PixelRow
	int	10h
	dec	bx
	jnz	x2
	mov	bx,	Len		
	inc PixelRow
	mov	PixelColumn,IniX
x3:	mov	ah,	0Ch			
	mov	al,	PixelColor
	mov	cx,	PixelColumn
	inc PixelColumn
	mov	dx,	PixelRow
	int	10h
	dec	bx
	jnz	x3
	mov ah,07h			
x4:	int 21h
	cmp	al,	'%'
	jnz x4
	mov	ah,	00h			
	mov	al,	VidMode2
	int	10h
	mov ah, 02h			
	mov dh, RowDisp
	mov dl,	ColumnDisp
	mov	bh, PageNum
	int	10h
.exit
end