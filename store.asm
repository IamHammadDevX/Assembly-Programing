.MODEL SMALL
.STACK 100H
.DATA
    STRING1 DB 'HELLO$' ; Original string
    CHAR    DB 'A'         ; Character to store
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX       ; Set ES segment (needed for STOSB)

    ; Initialize pointers and character
    LEA DI, STRING1  ; DI points to start of string
    MOV AL, CHAR     ; AL contains 'A'
    CLD              ; Clear Direction Flag (forward movement)

    ; First STOSB - replaces 'H' with 'A'
    STOSB            ; [DI] ← AL, then DI++

    ; Second STOSB - replaces 'E' with 'A'
    STOSB            ; [DI] ← AL, then DI++

    ; Exit to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN