.MODEL SMALL
.STACK 100H
.DATA
	MSGIP DB 'Enter a LowerCase Letter: $'
	MSGOP DB 0DH, 0AH, 'In uppercase is: $'  ; Corrected newline format
	CHAR DB ?, '$'  ; Variable to store input character

.CODE 
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX

	; Print input prompt
	LEA DX, MSGIP
	MOV AH, 9
	INT 21H

	; Take character input
	MOV AH, 1
	INT 21H
	MOV BL, AL

	; Convert lowercase to uppercase
	SUB BL, 32
	MOV CHAR, BL  ; Store in CHAR

	; Print newline and message
	LEA DX, MSGOP
	MOV AH, 9  ; Corrected from 2 to 9 (for string printing)
	INT 21H

	; Print converted uppercase character
	MOV DL, CHAR
	MOV AH, 2
	INT 21H

	; Exit program
	MOV AH, 4CH
	INT 21H

MAIN ENDP
	END MAIN
