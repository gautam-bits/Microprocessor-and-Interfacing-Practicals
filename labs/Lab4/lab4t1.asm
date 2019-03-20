.model tiny
.486
.data
dat1 db 'math', 'have', '    ', 'bury', 'mine', 'dine', '    ' , 'hell', 'deep', 'tree'
cnt1 db 0AH
.code 
.startup
	lea si,dat1
	lea bx, cnt1
	mov cx, [bx]
	mov bx,00h
	x1: mov eax,[si]
		cmp eax, '    '
		jz x2
		cmp bx,00h
		jz x3
		bswap eax
		mov [si],eax
		jmp x3
	x2: xor bx,01h
	x3:  add si,4
		dec cx
		jnz x1
.exit
end