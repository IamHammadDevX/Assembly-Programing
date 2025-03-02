.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER THREE INITIALS: $'  ; Prompt message
    NEWLINE DB 0DH, 0AH, '$'           ; New line sequence
.CODE 
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX

    ; Print Prompt Message
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; Read First Initial
    MOV AH, 1
    INT 21H
    MOV DL, AL  ; Store in DL for printing
    MOV AH, 2
    INT 21H

    ; Print New Line
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H

    ; Read Second Initial
    MOV AH, 1
    INT 21H
    MOV DL, AL  ; Store in DL for printing
    MOV AH, 2
    INT 21H

    ; Print New Line
    LEA DX, NEWLINE
    MOV AH, 9
    INT 21H

    ; Read Third Initial
    MOV AH, 1
    INT 21H
    MOV DL, AL  ; Store in DL for printing
    MOV AH, 2
    INT 21H

    ; Exit Program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
    END MAIN
