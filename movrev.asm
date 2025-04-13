.MODEL SMALL
.STACK 100H
.DATA
    str1 DB 'HELLO$'
    str2 DB 6 DUP (?)    ; 5 letters + '$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; Reverse copy from str1 to str2 using loop
    LEA SI, str1 + 4     ; Point SI to last char 'O'
    LEA DI, str2         ; Point DI to start of str2
    MOV CX, 5            ; Copy 5 letters
    STD                 ; Set direction flag (for reverse)

MOVSTR:
    MOVSB               ; Move 1 byte from [SI] to [DI], SI-- and DI--
    ADD DI, 2           ; Undo DI-- and advance to next position
    LOOP MOVSTR         ; Repeat

    CLD                 ; Reset direction flag to forward

    ; Add '$' terminator at end
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
