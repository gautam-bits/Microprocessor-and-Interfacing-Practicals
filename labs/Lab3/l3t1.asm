.model tiny
.data
ARRAY1 db 45H, 54H, 0F4H, 56H, 99H, 0F9H, 0F0H, 87H, 66H, 23H, 54H, 0F3H, 0F6H, 9CH,0FEH
GREAT1 db ?
.code
.startup
	lea si,ARRAY1
	mov cl,0EH
	lea di,GREAT1
	mov al,[si]
	inc si
X2:	cmp al,[si]
	jae X1
	mov al,[si]
X1:	inc si
	dec cl
	jnz x2
mov [di],al
.exit
end

	



