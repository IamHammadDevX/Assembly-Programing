.MODEL SMALL
.STACK 100H

.DATA
    msg         DB 'Enter your name: $'
    newline     DB 0Dh, 0Ah, '$'
    showmsg     DB 'Copied name is: $'

    my_name     DB 6 DUP(?)   
    copy_name   DB 6 DUP(?)          

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; Show prompt
    LEA DX, msg
    MOV AH, 9
    INT 21H

    ; Read characters one by one
    MOV CX, 6                ; Max 5 characters
    LEA SI, my_name          ; Source string
    LEA DI, copy_name        ; Destination string
input_loop:
    MOV AH, 1
    INT 21H                  ; Read character into AL
    MOV [SI], AL             ; Store character in my_name
    MOVSB                    ; Copy it to copy_name
    INC SI                   ; Increment pointer
    LOOP input_loop          ; Repeat until all 5 characters are entered

    ; Add newline
    LEA DX, newline
    MOV AH, 9
    INT 21H

    ; Show copied message
    LEA DX, showmsg
    MOV AH, 9
    INT 21H

    ; Print copied name
    LEA DX, copy_name
    MOV AH, 9
    INT 21H

    ; Exit program
    MOV AH, 4Ch
    INT 21H
MAIN ENDP
END MAIN
