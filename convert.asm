.model	small
.stack 	100h
.data

	Msg1 	db 	0Ah,	"Enter an integer:  ",	"$"
	Msg2	db 	0Ah,	"Decimal: ", "$"
	Msg3 	db 	0Ah,	"Binary: ", "$"
	Msg4 	db 	0Ah,	"Hexadecimal: ", "$"
	Deci 	Dw 	?

.code
main proc
	
	mov 	AX, @data
	mov 	DS, AX

	lea 	DX, Msg1
     	mov 	AH, 9d
     	int	21h

	call	INPUT
	
	mov	Deci, BX	
	
	call	DECIMAL
	call	BINARY
	call	HEXADECIMAL

	mov	Ah, 4Ch
	int	21h

main endp

INPUT proc
	xor	BX, BX
	xor 	CX, CX
LOOPi:	
	mov	AH, 01h
	int 	21h

	cmp 	AL, 13d
	je 	ENDINPUT

	and 	AX, 000Fh
 	mov 	CX, AX
	mov 	AX, 10                  
     	mul 	BX                       
     	mov 	BX, AX                   
	add 	BX, CX 
	jmp	LOOPi

ENDINPUT:
	ret

INPUT endp

DECIMAL proc
	lea	DX, Msg2
     	mov	AH, 9d
     	int	21h

	mov	AX, Deci
	xor	CX,CX
LOOPd:
	mov	DX, 0h
	mov	BX, 0Ah
	div	BX
	or 	DX, 30h
	push	DX
	inc	CX
	cmp	AX, 0d
	jne	LOOPd
PRINTd:
	pop	DX
	mov	AH, 02h
	int	21h
	loop	PRINTd
ENDDECIMAL:
	ret

DECIMAL endp

BINARY proc
	lea	DX, Msg3
     	mov	AH, 9d
     	int	21h

	mov	AX, Deci
	xor	CX, CX
LOOPb:
	mov	DX, 0h
	mov	BX, 02h
	div	BX
	or	DX, 30h
	push	DX
	inc	CX
	cmp	AX, 0d
	jne	LOOPb

PRINTb:
	pop	DX
	mov	AH, 02H
	int	21H
	loop	PRINTb
EXIT_BINARY:
	ret

BINARY endp

HEXADECIMAL proc
	lea	DX, Msg4
      	mov	AH, 9d
     	int	21h

	mov	AX, Deci
	xor	CX, CX

	mov	CX, '$'
	push	CX

	xor	CX,CX
LOOP4:
	mov	DX,0H
	mov	BX,10H
	div	BX
	or	DX, 30H
	push	DX
	inc	CX
	cmp	AX, 0
	jne	LOOP4
PRINTh:
	pop	DX
	cmp 	DX, '$'
	je	ENDHEXADECIMAL
	cmp	DX, 57
	jg	CONVERT
	mov	AH, 02h
	int 	21h
	jmp	PRINTh

CONVERT:
	add	DX, 7d
	mov	AH, 02h
	int 	21h
	jmp	PRINTh

ENDHEXADECIMAL:
	ret

HEXADECIMAL endp

end main	
