.MODEL SMALL
.STACK 100h
.DATA
    myName DB 'My Favourite Cricketer is Virat Kohli$'

.CODE
MAIN PROC
    MOV AX, @DATA  ; Load data segment address
    MOV DS, AX
    LEA DX, myName ; Load address of string
    MOV AH, 9      ; DOS interrupt to print string
    INT 21h

    MOV AH, 4Ch    ; DOS interrupt to terminate
    MOV AL, 0
    INT 21h

    RET            ; Return before ending the procedure
MAIN ENDP
END MAIN
