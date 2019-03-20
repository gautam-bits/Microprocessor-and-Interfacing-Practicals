.model tiny
.486
.data
msg1	db	"Enter User Name", 0ah, 0dh, '$'
max1	db	15
count1  db	?
username_input	db	16 dup('$')
msg2	db	"Enter Password", 0ah, 0dh, '$'
max2	db	15
count2	db	?
pass_input	db	16 dup('$')
msg3	db	"Hello$"
nextline db 0ah, 0dh, '$'
username	db	"ighosh$"
password	db	"randpass$"
.code
.startup
		lea		dx,msg1
		mov 	ah,09h
		int 	21h
		lea		dx,max1
		mov		ah,0ah
		int 	21h
		lea		si,username
		lea 	di,username_input
		mov 	bx, 00h
		mov 	cx,06h
x1:		mov 	bl, byte ptr[si]
		cmp  	byte ptr[di],bl
		jne		xf
		inc		si
		inc		di
		loop 	x1		
		lea 	dx,msg2
		mov		ah,09h
		int 	21h
		lea		dx,max2
		mov		ah,0ah
		int     21h
		lea		si,password
		lea		di,pass_input
		mov		bx,00h
		mov		cx,08h
x2:		mov	bl, byte ptr[si]
		cmp		byte ptr[di],bl
		jne		xf
		inc 	si
		inc 	di
		loop	x2	
		lea		dx,msg3
		mov		ah,09h
		int 	21h
		lea 	dx,username_input	
		mov		ah,09h
		int 	21h
xf:
.exit
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
.model tiny
.386
.data

dat1 db 'Enter User Name',0dh,0ah,'$'

dat2 db 0dh,0ah,'Enter Password',0dh,0ah,'$'

dat3 db 'ankitpatra12$'

dat4 db 13 dup('$')

dat5 db 9 dup('$')

dat6 db '20160605'

dat7 db 'Hello',' ','$'

dat8 db 0dh,0ah,'$'	
	
	
	
	
	x1:	int 21h

	stosb

	loop x1

	mov cx,12

	lea si,dat3

	lea di,dat4

  repe  cmpsb

	cmp cx,0

	jne x3

	lea dx,dat2

	mov ah,09h

	int 21h

	mov cx,8

	lea di,dat5
