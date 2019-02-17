.model tiny
.386
.data
DAT1 dw 0EF45H, 4554H, 0F456H, 9999H, 8F98H, 8766H, 2354H, 5678H,9900H, 9C44H
COUNT db 0AH
NEG1 db ?
.code
.startup
mov si,offset dat1
lea di,neg1
mov cl,count
mov bx,0000h
mov dl,00h
x2:	cmp [si],bx
	jl x1
	dec dl
x1:	inc dl
	inc si
	inc si
	dec cl
	jnz x2
	mov [di],dl
.exit
end
