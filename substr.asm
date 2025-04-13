.MODEL SMALL
.STACK 100H

.DATA
    mainStr     DB 'hello world$'      ; Main string
    subStr      DB 'world$'            ; Substring to search
    foundMsg    DB 0Dh, 0Ah, 'Substring found!$'
    notFoundMsg DB 0Dh, 0Ah, 'Substring not found.$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    LEA SI, mainStr        ; Point to main string
    LEA BX, subStr         ; Point to substring (fixed)

next_char:
    MOV DI, BX             ; Restart DI to beginning of subStr
    PUSH SI                ; Save current SI

match_check:
    MOV AL, [SI]
    CMP AL, '$'
    JE not_found           ; End of main string

    CMP AL, [DI]
    JNE restore_si         ; Mismatch, restore SI and try next

    CMP BYTE PTR [DI], '$'
    JE found               ; Substring fully matched

    INC SI
    INC DI
    JMP match_check

restore_si:
    POP SI                 ; Restore saved position
    INC SI                 ; Move to next character in mainStr
    JMP next_char

found:
    LEA DX, foundMsg
    MOV AH, 9
    INT 21H
    JMP exit

not_found:
    LEA DX, notFoundMsg
    MOV AH, 9
    INT 21H

exit:
    MOV AH, 4Ch
    INT 21H
MAIN ENDP
END MAIN
