.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter a single digit number: $'
    MSG_NEG DB 'Negative$'
    MSG_POS DB 'Positive$'
    CR EQU 0DH  ; Carriage Return
    LF EQU 0AH  ; Line Feed
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt the user to enter a single digit number
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Read a character from user
    MOV AH, 1
    INT 21H
    SUB AL, '0'      ; Convert ASCII to integer

    ; Check if number is negative (not needed for single-digit input)
    CMP AL, 0
    JL PRINT_NEG
    JGE PRINT_POS

PRINT_NEG:
    ; Print new line
    MOV DL, CR
    MOV AH, 2
    INT 21H
    MOV DL, LF
    INT 21H
    ; Print "Negative"
    LEA DX, MSG_NEG
    MOV AH, 9
    INT 21H
    JMP DONE

PRINT_POS:
    ; Print new line
    MOV DL, CR
    MOV AH, 2
    INT 21H
    MOV DL, LF
    INT 21H
    ; Print "Positive"
    LEA DX, MSG_POS
    MOV AH, 9
    INT 21H

DONE:
    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
