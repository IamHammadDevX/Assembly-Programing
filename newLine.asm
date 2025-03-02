.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
	MOV AH, 1 ;single character i/p
	INT 21H
	MOV BL, AL ;move the character from AL to BL
	MOV AH, 2 ;o/p
	MOV DL, 0DH ;Carriage return
	INT 21H
	MOV DL, 0AH ;line feed
	INT 21H
	MOV DL, BL
	INT 21H
	; RETURN CONTROL TO DOS
	MOV AH, 4CH
	INT 21H
MAIN ENDP
END MAIN