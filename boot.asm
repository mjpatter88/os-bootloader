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

; Loop forever
jmp$

times 510-($-$$) db 0

dw 0xaa55
