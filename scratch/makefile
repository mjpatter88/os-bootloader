jumps.bin: jumps.asm
	nasm jumps.asm -f bin -o jumps.bin

q-jumps: jumps.bin
	qemu-system-i386 -drive file=jumps.bin,format=raw,index=0,media=disk

prints.bin: boot_print.asm print_string.asm
	nasm boot_print.asm -f bin -o prints.bin

q-prints: prints.bin
	qemu-system-i386 -drive file=prints.bin,format=raw,index=0,media=disk