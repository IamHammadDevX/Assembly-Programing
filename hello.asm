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
