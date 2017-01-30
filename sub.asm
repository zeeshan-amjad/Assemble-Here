.model small
.stack 100h
.data

	A	db 	-10h
	B 	db 	30h
	ans dw 	?
	
.code

main proc

	mov	AX,	@data
	mov DS,	AX
	mov AL,	A
	mov BL,	B
	neg BL
	cmp	AL, 0
	JB	L1
	
	cmp BL, 0
	jb	L2
	
	add AL,	BL
	mov AH, 4Ch
	int 21h
	
	L1:	cmp BL, 0
		jb	L3
		neg	AL
		add AL, BL
		
	L3:	add	AL, BL
	
	L2:	neg	BL
		add AL, BL
	
	main endp
end main