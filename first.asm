	.Model small
	.stack 100h
	.data
	X DB '2'
	Y DB '1'
	.code
	Main Proc
	Mov AX, @Data
	Mov DS, AXF
	Mov DX, 0
	ADD DX, X
	ADD DX, Y
	Mov Ah, 2
	int 21h
	Mov Ah, 4ch
	Main endp
	End Main
