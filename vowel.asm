.MODEL SMALL
.STACK 100H

.DATA
    inputStr    DB 'Hello Assembly Language$' ; Input string
    vowelsStr   DB 30 DUP('$')                ; To store vowels
    newline     DB 0Dh, 0Ah, '$'
    msg         DB 'Vowels found: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV ES, AX

    ; SI -> source, DI -> destination
    LEA SI, inputStr
    LEA DI, vowelsStr

check_loop:
    LODSB                  ; Load next char from inputStr into AL
    CMP AL, '$'            ; End of string?
    JE done_check

    ; Check for vowels (both uppercase and lowercase)
    CMP AL, 'A'
    JE store
    CMP AL, 'E'
    JE store
    CMP AL, 'I'
    JE store
    CMP AL, 'O'
    JE store
    CMP AL, 'U'
    JE store
    CMP AL, 'a'
    JE store
    CMP AL, 'e'
    JE store
    CMP AL, 'i'
    JE store
    CMP AL, 'o'
    JE store
    CMP AL, 'u'
    JE store

    JMP check_loop         ; Not a vowel, check next character

store:
    STOSB                  ; Store vowel in vowelsStr
    JMP check_loop

done_check:
    ; Add $ to terminate vowelsStr
    MOV AL, '$'
    STOSB

    ; Print newline
    LEA DX, newline
    MOV AH, 9
    INT 21H

    ; Print message
    LEA DX, msg
    MOV AH, 9
    INT 21H

    ; Print vowels string
    LEA DX, vowelsStr
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AH, 4Ch
    INT 21H
MAIN ENDP
END MAIN
