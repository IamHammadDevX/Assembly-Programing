.MODEL SMALL
.STACK 100H
.DATA
    BOX DB '**********', 0Dh, 0Ah  ; Row 1
        DB '**********', 0Dh, 0Ah  ; Row 2
        DB '**********', 0Dh, 0Ah  ; Row 3
        DB '**********', 0Dh, 0Ah  ; Row 4
        DB '**********', 0Dh, 0Ah  ; Row 5
        DB '**********', 0Dh, 0Ah  ; Row 6
        DB '**********', 0Dh, 0Ah  ; Row 7
        DB '**********', 0Dh, 0Ah  ; Row 8
        DB '**********', 0Dh, 0Ah  ; Row 9
        DB '**********', '$'       ; Row 10 (ends with $)
.CODE
MAIN PROC
    ; Initialize data segment
    MOV AX, @DATA
    MOV DS, AX

    ; Display the box
    LEA DX, BOX          ; Load address of BOX string
    MOV AH, 9            ; DOS function 9h: print string
    INT 21H              ; Call DOS interrupt

    ; Exit program
    MOV AH, 4CH          ; DOS function 4Ch: terminate program
    INT 21H
MAIN ENDP
    END MAIN