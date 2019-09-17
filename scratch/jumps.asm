; Question 3 - page 19
; Convert the following psuedocode to assembly code.
;
; mov bx , 30
; if (bx <= 4) {
;   mov al , ’A ’
; } else if (bx < 40) {
;   mov al , ’B ’
; } else {
;   mov al , ’C ’
; }
; mov ah , 0 x0e ; int =10/ ah =0 x0e -> BIOS tele - type output
; int 0 x10 ; print the character in al
;
; jmp $
;
; ; Padding and magic number.
; times 510 -( $ - $$ ) db 0
; dw 0 xaa55

mov bx, 30

cmp bx, 4
jle first_if

cmp bx, 40
jl else_if

mov al, 'C'
jmp end


first_if:
    mov al, 'A'
    jmp end

else_if:
    mov al, 'B'
    jmp end


end:
    mov ah, 0x0e
    int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55