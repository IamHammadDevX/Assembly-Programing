.MODEL SMALL
.STACK 100H
.DATA
    CR EQU 0DH          ; Carriage Return
    LF EQU 0AH          ; Line Feed
    MSG1 DB 'Enter first digit: $'
    MSG2 DB CR,LF,'Enter second digit: $'
    num1 DB ?           ; Store first number
    num2 DB ?           ; Store second number
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display first prompt
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
    
    ; Read first digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H        ; Convert ASCII to number
    MOV num1, AL       ; Store first digit
    
    ; Display second prompt
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
    
    ; Read second digit
    MOV AH, 1
    INT 21H
    SUB AL, 30H        ; Convert ASCII to number
    MOV num2, AL       ; Store second digit
    
    ; Compare numbers
    MOV AL, num1
    CMP AL, num2
    JAE FIRST_LARGER   ; Jump if num1 >= num2
    
    ; If here, num2 is larger
    MOV BL, num2
    JMP DISPLAY
    
FIRST_LARGER:
    MOV BL, num1       ; num1 is larger or equal
    
DISPLAY:
    ; Print newline
    MOV AH, 2
    MOV DL, CR         ; Carriage return
    INT 21H
    MOV DL, LF         ; Line feed
    INT 21H
    
    ; Display larger number
    MOV DL, BL
    ADD DL, 30H        ; Convert back to ASCII
    INT 21H
    
    ; Exit program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN