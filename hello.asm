<<<<<<< HEAD
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
=======
.model small
.stack 100h
.data
    hello db 'Hello, World My Favourite Cricketer is Virat Kohli$'  ; '$' is used as a string terminator in DOS

.code
main proc
    mov ax, @data   ; Load data segment
    mov ds, ax

    ; Print the string
    mov dx, offset hello  ; Load address of string
    mov ah, 09h           ; DOS function to print string
    int 21h               ; Call DOS interrupt

    ; Exit program
    mov ah, 4Ch           ; DOS exit function
    int 21h               ; Call DOS interrupt
main endp
end main
>>>>>>> 950e0e0ba3352ba16b06ef2d202d9fcab0170199
