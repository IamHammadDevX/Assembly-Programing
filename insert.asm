.MODEL SMALL
.STACK 100H
.DATA
	arr DW 10, 20, 40, 50, 60, ?
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	MOV ES, AX
	LEA SI, arr + 8
	LEA DI, arr + 10
	MOV CX, 3
	STD
	REP MOVSW
	MOV WORD PTR[arr+4], 30
	MOV AH, 4CH
	INT 21H
MAIN ENDP
	END MAIN
	