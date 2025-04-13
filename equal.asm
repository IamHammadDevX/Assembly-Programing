.MODEL SMALL
.STACK 100H

.DATA
    str1    DB 'hello$'
    str2    DB 'hello$'
    equalMsg    DB 0Dh,0Ah,'Strings are equal.$'
    notEqualMsg DB 0Dh,0Ah,'Strings are not equal.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; Set up pointers
    LEA SI, str1       ; Source string
    LEA DI, str2       ; Destination string

compare_loop:
    LODSB              ; Load byte from str1 into AL
    SCASB              ; Compare AL with byte in str2
    JNE not_equal      ; If not equal, jump

    CMP AL, '$'        ; End of string?
    JE equal           ; If both ended at $, they are equal
    JMP compare_loop   ; Otherwise, keep comparing

equal:
    LEA DX, equalMsg
    MOV AH, 9
    INT 21H
    JMP exit

not_equal:
    LEA DX, notEqualMsg
    MOV AH, 9
    INT 21H

exit:
    MOV AH, 4Ch
    INT 21H
MAIN ENDP
END MAIN
