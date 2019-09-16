; This bootloader wil be loaded into memory by the BIOS at address 0x7c00.
[org 0x7c00]


; https://en.wikipedia.org/wiki/BIOS_interrupt_call

; Clear the screen by setting the video mode.
mov al, 0x3
mov ah, 0x00
int 0x10
int 0x10
int 0x10

; Setup to use the bios teletype interupt
mov ah, 0x0e

mov al, 'H'
int 0x10
mov al, 'e'
int 0x10
mov al, 'l'
int 0x10
mov al, 'l'
int 0x10
mov al, 'o'
int 0x10

; The org directive means the assembler will add that offset to labels,
; so we can use internal labels without having to manually calculate
; the final memory address. This works as long as this program is loaded
; at the address given in the org directive on line 2.
mov al, [the_secret]
int 0x10


; Loop forever
jmp $

the_secret:
    db "!"

times 510-($-$$) db 0

dw 0xaa55
