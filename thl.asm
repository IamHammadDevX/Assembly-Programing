.MODEL SMALL
.STACK 100H
.DATA
    	;define constants
    	CR EQU 0DH
    	LF EQU 0AH
    	MSG1 DB 'Enter the three letters of your name: $'
    	ch1 DB ?
	ch2 DB ?
	ch3 DB ?
    
.CODE
MAIN PROC
	MOV AX, @DATA
	MOV DS, AX
	;display
	LEA DX, MSG1
	MOV AH, 9
	INT 21H
	;read 1st ch
	MOV AH, 1
	INT 21H
	MOV ch1, AL
	;read 2ND ch
	MOV AH, 1
	INT 21H
	MOV ch2, AL
	;read 3RD ch
	MOV AH, 1
	INT 21H
	MOV ch3, AL
	; Display first initial
    MOV DL, CR          ; Carriage return
    MOV AH, 2
    INT 21H
    MOV DL, LF          ; Line feed
    INT 21H
    MOV DL, ch1         ; Display first character
    INT 21H
    
    ; Display second initial
    MOV DL, CR          ; Carriage return
    MOV AH, 2
    INT 21H
    MOV DL, LF          ; Line feed
    INT 21H
    MOV DL, ch2         ; Display second character
    INT 21H
    
    ; Display third initial
    MOV DL, CR          ; Carriage return
    MOV AH, 2
    INT 21H
    MOV DL, LF          ; Line feed
    INT 21H
    MOV DL, ch3         ; Display third character
    INT 21H
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN