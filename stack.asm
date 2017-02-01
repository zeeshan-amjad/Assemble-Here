.model small
.stack 100h
.data

	String db "Zeeshan Amjad", '$'
	C db 0

.code 

main proc

	mov AX, @data
	mov DS, AX
	mov DI, offset String
	mov BL, C

	pushloop:
		mov AL, [DI]
		cmp BYTE PTR[DI], '$'
		je poploop
		push AX
		inc DI
		inc BL
		jmp pushloop

	poploop:
		cmp BL, 0
		je done
		pop DX
		dec BL

		mov AH, 02h
		int 21h
		jmp poploop

	done:
		mov AH, 4Ch
		int 21h

	main endp
end main