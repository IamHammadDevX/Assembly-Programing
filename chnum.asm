.MODEL SMALL
.STACK 100H
.DATA
    	;define constants
    	CR EQU 0DH
    	LF EQU 0AH
    	MSG1 DB 'Enter the character: $'
	MSG2 DB CR, LF, 'in decimal is: $'
	num DB ?
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	;display
	LEA DX, MSG1
	MOV AH, 9
	INT 21H
	;read
	MOV AH, 1
	INT 21H
	SUB AL, 30H
	MOV num, AL
	;display
	LEA DX, MSG2
	MOV AH, 9
	INT 21H
	MOV BL, num
	;ADD BL, 30H
	MOV DL, BL
	MOV AH, 2
	INT 21H
	;EXIT
	MOV AH, 4CH
	INT 21H	
MAIN ENDP
END MAIN