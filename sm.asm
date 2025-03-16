.MODEL SMALL
.STACK 100H
.DATA
    ;define constants
    CR EQU 0DH
    LF EQU 0AH
    MSG1 DB 'Enter two decimal digits: $'
    MSG2 DB CR,LF,'Sum is: $'
    dig1 DB ?
    dig2 DB ?
    sum DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    ; Read first digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H         ; Convert ASCII to number
    MOV dig1, AL
    
    ; Read second digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H         ; Convert ASCII to number
    MOV dig2, AL
    
    ; Calculate sum
    MOV AL, dig1        ; Load first digit
    ADD AL, dig2        ; Add second digit
    MOV sum, AL         ; Store sum
    
    ; Display "Sum is: "
    LEA DX, MSG2        ; Fixed missing comma
    MOV AH, 9
    INT 21H
    
    ; Display sum
    MOV DL, sum         ; Load sum to DL
    ADD DL, 30H         ; Convert back to ASCII
    MOV AH, 2
    INT 21H
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN