.MODEL SMALL
.STACK 100H
.DATA
    	;define constants
    	CR EQU 0DH
    	LF EQU 0AH
    	MSG1 DB 'My name is: HAMMAD $'
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	LEA DX, MSG1
	MOV AH, 9
	INT 21H
	;EXIT
	MOV AH, 4CH
	INT 21H	
MAIN ENDP
END MAIN