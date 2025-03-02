.MODEL SMALL
.STACK 100H
.DATA
    PROMPT  DB '?'              ; Prompt character
    INIT1   DB ?                ; First initial
    INIT2   DB ?                ; Second initial
    INIT3   DB ?                ; Third initial
    BOX     DB '***********', 0Dh, 0Ah  ; Row 1
            DB '***********', 0Dh, 0Ah  ; Row 2
            DB '***********', 0Dh, 0Ah  ; Row 3
            DB '***********', 0Dh, 0Ah  ; Row 4
            DB '***********', 0Dh, 0Ah  ; Row 5
            DB '****'                    ; Row 6 (middle): Left part
            DB ?, ?, ?                  ; Space for 3 initials
            DB '****', 0Dh, 0Ah         ; Right part + newline
            DB '***********', 0Dh, 0Ah  ; Row 7
            DB '***********', 0Dh, 0Ah  ; Row 8
            DB '***********', 0Dh, 0Ah  ; Row 9
            DB '***********', 0Dh, 0Ah  ; Row 10
            DB '***********', '$'       ; Row 11 (ends with $)

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; (a) Display "?"
    MOV DL, PROMPT
    MOV AH, 2
    INT 21H

    ; (b) Read three initials
    MOV AH, 1
    INT 21H             ; Read first initial
    MOV INIT1, AL
    INT 21H             ; Read second initial
    MOV INIT2, AL
    INT 21H             ; Read third initial
    MOV INIT3, AL

    ; Place initials in the middle row of the box
    MOV AL, INIT1
    MOV BOX+5*13+4, AL  ; Row 6, position 5 (after 5 rows of 13 chars each)
    MOV AL, INIT2
    MOV BOX+5*13+5, AL  ; Row 6, position 6
    MOV AL, INIT3
    MOV BOX+5*13+6, AL  ; Row 6, position 7

    ; (c) Display the 11x11 box with initials
    LEA DX, BOX
    MOV AH, 9
    INT 21H

    ; (d) Beep the computer
    MOV DL, 07H         ; ASCII bell character
    MOV AH, 2
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
    END MAIN