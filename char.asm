.MODEL SMALL
.STACK 100H
.DATA	
.CODE
<<<<<<< HEAD
=======

>>>>>>> 950e0e0ba3352ba16b06ef2d202d9fcab0170199
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
<<<<<<< HEAD
END MAINP
	END MAIN
=======
MAIN ENDP
END MAIN
>>>>>>> 950e0e0ba3352ba16b06ef2d202d9fcab0170199
	