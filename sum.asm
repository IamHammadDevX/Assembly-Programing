.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB '?', '$'                    ; Prompt for input
    MSG2 DB 0DH, 0AH, 'The SUM of ', '$' ; Newline + Message Start
    MSG3 DB ' and ', '$'                 ; ' and ' message
    MSG4 DB ' is ', '$'                  ; ' is ' message
    NUM1 DB ?, '$'  ; Variable to store first digit
    NUM2 DB ?, '$'  ; Variable to store second digit
    SUM  DB ?, '$'  ; Variable to store sum
.CODE 
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display "?"
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Read First Digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H   ; Convert ASCII to Number
    MOV NUM1, AL  ; Store First Digit

    ; Read Second Digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H   ; Convert ASCII to Number
    MOV NUM2, AL  ; Store Second Digit

    ; Compute SUM
    MOV AL, NUM1
    ADD AL, NUM2
    MOV SUM, AL   ; Store SUM

    ; Convert back to ASCII
    ADD NUM1, 30H
    ADD NUM2, 30H
    ADD SUM, 30H

    ; Print Newline + Message
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Print First Digit
    MOV DL, NUM1
    MOV AH, 2
    INT 21H

    ; Print " and "
    LEA DX, MSG3
    MOV AH, 9
    INT 21H

    ; Print Second Digit
    MOV DL, NUM2
    MOV AH, 2
    INT 21H

    ; Print " is "
    LEA DX, MSG4
    MOV AH, 9
    INT 21H

    ; Print Sum
    MOV DL, SUM
    MOV AH, 2
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
    END MAIN
