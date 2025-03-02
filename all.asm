.MODEL SMALL
.STACK 100H
.CODE
START:
    ; Task 1: ADD Operations
    MOV AX, 512Ch
    MOV BX, 4185h
    ADD AX, BX    ; AX = 92B1h

    MOV AX, FE12h
    MOV BX, 1ACBh
    ADD AX, BX    ; AX = 04DDh

    MOV AX, E1E4h
    MOV BX, DAB3h
    ADD AX, BX    ; AX = BC97h

    MOV AX, 7132h
    MOV BX, 7000h
    ADD AX, BX    ; AX = E132h

    MOV AX, 6389h
    MOV BX, 1176h
    ADD AX, BX    ; AX = 74FFh

    ; Task 2: SUB Operations
    MOV AX, 2143h
    MOV BX, 1986h
    SUB AX, BX    ; AX = 07BDh

    MOV AX, 81FEh
    MOV BX, 1986h
    SUB AX, BX    ; AX = 6888h

    MOV AX, 19BCh
    MOV BX, 81FEh
    SUB AX, BX    ; AX = 97BEh

    MOV AX, 0002h
    MOV BX, FE0Fh
    SUB AX, BX    ; AX = 0203h

    MOV AX, 8BCDh
    MOV BX, 71ABh
    SUB AX, BX    ; AX = 1A22h

    HLT  ; Halt program
END START
