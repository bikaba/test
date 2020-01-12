OUTPUT_FORMAT(elf32-littlearm)
OUTPUT_ARCH(arm)
ENTRY(ml_func3)

MEMORY {
    ROM          (rx)  : ORIGIN = 0x18000000, LENGTH = 128M
    SYSTEM_RAM   (rwx) : ORIGIN = 0x20020000, LENGTH = 0x04000
    STACK        (rw)  : ORIGIN = 0x20024000, LENGTH = 0x14000
    CACHED_RAM   (rw)  : ORIGIN = 0x20039000, LENGTH = 0x100000
    UNCACHED_RAM (rw)  : ORIGIN = 0x60139000, LENGTH = 0x100000
}

SECTIONS {
    .text : {
        */test.o (.text .text.*)

        * (CONST_BASIC_SETUP)
        */test.o (.rodata .rodata.*)

    } > ROM
    .data : {
        */test.o (.bss .bss.*)
        */test.o (.rw .rw.*)
    } > SYSTEM_RAM
}