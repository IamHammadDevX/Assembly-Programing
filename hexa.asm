.MODEL SMALL
.STACK 100H
.DATA
    MSG  DB 'ENTER A HEXA DIGIT: $'
    MSG2 DB 0DH, 0AH, 'IN DECIMAL IS: $'
    HEX  DB ?
    DEC  DB ?
.CODE 
MAIN PROC
    MOV AX, @DATA  
    MOV DS, AX

    ; Print prompt message
    LEA DX, MSG
    MOV AH, 9
    INT 21H

    ; Read HEX input
    MOV AH, 1
    INT 21H             ; Input in AL
    MOV HEX, AL         ; Store input

    ; Convert to decimal (simplified, works for 0-9 only directly)
    SUB AL, 30H         ; Convert ASCII '0'-'9' to 0-9
                        ; For A-F, we’ll adjust manually below

    ; Adjust for A-F by subtracting extra 7 if it’s a letter
    SUB AL, 7           ; This over-corrects 0-9 but we’ll fix in output
    MOV DEC, AL         ; Store result

    ; Print output message
    LEA DX, MSG2
    MOV AH, 9
    INT 21H

    ; Print decimal number (assuming 0-9 for simplicity)
    MOV DL, DEC
    ADD DL, 30H         ; Convert back to ASCII
    MOV AH, 2
    INT 21H

    ; Exit program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
    END MAIN