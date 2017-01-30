.model	small
.stack	100h
.data

		MSG	db	'Zeeshan', '$'
		
.code
main proc

		mov AX, @data
		mov DS, AX
		lea DX, MSG
		mov	AH, 09h
		int 21h
		mov Ah, 4Ch
		int	21h
		
	main endp
end main