.MODEL SMALL
.STACK 100H
.DATA
    	
.CODE
MAIN PROC
	MOV AX, -1234H
	CMP AX, 0
	JL NEGATIVE
	JG POSITIVE
	JMP ZERO
	ZERO:
		MOV BX, 0
		JMP DONE

	NEGATIVE:
		MOV BX, 0FFFFH
		JMP DONE
	POSITIVE:
		MOV BX, 0001H
	DONE:
		MOV AH, 4CH
		INT 21H
MAIN ENDP
	END MAIN