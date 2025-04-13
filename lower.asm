.MODEL SMALL
.STACK 100H
.DATA
    MSGIP DB 'Enter an Uppercase Letter: $'
    MSGOP DB 0DH, 0AH, 'In lowercase is: $'  ; Added new line before text
    CHAR DB ?, '$'  ; Variable to store the input character
.CODE 
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print Input Prompt
    LEA DX, MSGIP
    MOV AH, 9
    INT 21H

    ; Read Uppercase Character
    MOV AH, 1
    INT 21H
    MOV BL, AL  ; Store input character

    ; Convert Uppercase to Lowercase
    ADD BL, 32
    MOV CHAR, BL  ; Store the lowercase character

    ; Print Output Message
    LEA DX, MSGOP
    MOV AH, 9
    INT 21H

    ; Print Converted Character
    MOV DL, CHAR
    MOV AH, 2
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
    END MAIN
