boot.bin: boot.asm
	nasm boot.asm -f bin -o boot.bin

q-boot: boot.bin
	qemu-system-i386 -drive file=boot.bin,format=raw,index=0,media=disk