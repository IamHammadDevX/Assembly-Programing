.MODEL SMALL
.STACK 100H
.DATA
	CR EQU 0DH
	LF EQU 0AH
	MSG DB 'Enter a Uppercase character: $'
	MSG1 DB CR, LF, 'In Lowercase is: $'
	CHAR DB ?, '$'
.CODE
MAIN PROC
	;display msg
	MOV AX, @DATA
	MOV DS, AX
	LEA DX, MSG
	MOV AH, 9
	INT 21H
	;IP CHAR
	MOV AH, 1
	INT 21H
	MOV BL, AL
	ADD BL, 32
	MOV CHAR, BL
	;OP DISPLAY
	LEA DX, MSG1
	MOV AH, 9
	INT 21H
	MOV DL, CHAR
	;DISPLAY
	MOV AH, 2
	INT 21H
	;DOS
	MOV AH, 4CH
	INT 21H
MAIN ENDP
	END MAIN
	