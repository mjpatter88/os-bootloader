boot.bin: boot.asm
	nasm boot.asm -f bin -o boot.bin

q-boot: boot.bin
	qemu-system-i386 boot.bin