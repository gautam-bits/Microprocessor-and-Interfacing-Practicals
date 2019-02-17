.model tiny
.386
.data
dat1 db 1H,2H,3H,6H,1H
dat2 db 1H,1H,1H,1H,1H
.code
.startup
LEA SI,offset dat1
LEA DI, offset dat2
MOV BX,5H
X1:	MOV AL,[SI]
	MOV CL,[DI]
	ADD AL,CL
	MOV [DI+20D],AL
	INC SI
	INC DI
	DEC BX
	JNZ X1
.exit
END 

