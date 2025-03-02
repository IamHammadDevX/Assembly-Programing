.MODEL SMALL
.STACK 100H
.DATA	
.CODE

MAIN PROC
	; single character input
	MOV AH, 1
	INT 21H
	MOV DL, AL
	; single character output
	MOV AH, 2
	INT 21H
	; Return to DOS
	MOV AH, 4CH
	INT 21H
MAIN ENDP
END MAIN
	