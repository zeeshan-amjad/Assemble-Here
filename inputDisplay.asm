.model small
.stack 100h
.data

	String	db	26 	dup('$')
	Msg		db 	'Enter your name: $'
	Msg2	db 	'Your name is: $'

.code

main proc

	mov AX, @data
	mov DS, AX
	
	;display message
	lea DX, Msg
	mov AH, 09h
	int 21h
	
	;accept string
	lea DX, String
	mov AH, 3Fh
	int 21h
	
	;display message
	lea DX, Msg2
	mov AH, 09h
	int 21h
	
	;dislay input string
	lea DX, String
	mov AH, 09h
	int 21h
	
	mov AH, 4Ch
	int 21h
	
	main endp
end main
