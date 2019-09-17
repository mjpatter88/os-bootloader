# Building a simple bootloader

http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf


Progress:
3.4.6 Calling Functions
pdf page 19 (or 23 in the viewer)



### x86 boot process
- The CPU is hardwired to begin execution at address `0xFFFFFFF0`.
- This address contains a jump instruction to the BIOS.
- The BIOS searches for a bootable device by looking for a "magic number" that all bootable devices must have.
    - It does so by loading the first 512 bytes, the boot sector, of each device and looking at the last two bytes.
    - If these bytes are 0x55 and 0xAA, then the BIOS considers this a bootable device.
- The BIOS copies the device's first sector into RAM at `0x7c00` and then jumps/executes that code.
- At this point, the CPU is in 16-bit "real mode" meaning no memory protections, direct access to BIOS functions, etc.
- This piece of code is called a bootloader, and it is responsible for doing several things:
    - Loading the kernel from disk (usually at memory address `0x100000`).
    - Setting up a basic GDT.
    - Disabling the interrupts
    - Setting the first bit in the CPU control register cr0. (Enabling 32-bit protected mode.)
    - Performing a "far jump" in order to flush the pipeline.
    - Jumping to the location of the kernel code in memory, usually `0x100000`
- In order to write a kernel, we just need to make sure the linker loads our binary at address 0x100000.
- Our bootloader can only be 512 bytes. If this is too small, we can use a multistage bootloader.


### Memory Layout
- 0x0 - Interrupt Vector Table (setup by BIOS)
- 0x400 - Bios Data
- 0x7c00 - Loaded Boot Sector (512 Bytes)
- 0x9fc00 - Extended Bios Data
- 0xA0000 - Video Memory (128k KB)
- 0xC0000 - BIOS (256 KB)
- 0x100000 - Free


### References
- http://www.cs.virginia.edu/~evans/cs216/guides/x86.html