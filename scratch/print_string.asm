print_string:
    pusha
    mov ah, 0x0e
    start:
        mov al, [bx]
        int 0x10

        add bx, 1
        cmp al, 0
        jne start ; Keep looping until we hit the string null terminator (0)
    end:
        popa
        ret