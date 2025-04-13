.MODEL SMALL
.STACK 100H
.DATA
    str1 DB 'HELLO$'
    str2 DB 6 DUP (?)   ; 5 for 'HELLO', 1 for '$' terminator
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; Copy 5 characters from str1 to str2
    LEA SI, str1
    LEA DI, str2
    MOV CX, 5
    CLD
    REP MOVSB

    ; Append '$' to the end of str2
    MOV AL, '$'
    MOV [DI], AL

    ; Display str2
    LEA DX, str2
    MOV AH, 9
    INT 21H

    ; Exit to DOS
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
