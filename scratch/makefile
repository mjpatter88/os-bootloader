jumps.bin: jumps.asm
	nasm jumps.asm -f bin -o jumps.bin

q-jumps: jumps.bin
	qemu-system-i386 -drive file=jumps.bin,format=raw,index=0,media=disk