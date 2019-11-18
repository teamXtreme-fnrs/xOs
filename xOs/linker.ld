ENTRY(loader)
OUTPUT_FORMAT(elf32-i386)
OUTPUT_ARCH(i386:i386)
SEARCH_DIR("=/usr/local/lib/i386-linux-gnu"); SEARCH_DIR("=/lib/i386-linux-gnu"); SEARCH_DIR("=/usr/lib/i386-linux-gnu"); SEARCH_DIR("=/usr/local/lib32"); SEARCH_DIR("=/lib32"); SEARCH_DIR("=/usr/lib32"); SEARCH_DIR("=/usr/local/lib"); SEARCH_DIR("=/lib"); SEARCH_DIR("=/usr/lib"); SEARCH_DIR("=/usr/i386-linux-gnu/lib32"); SEARCH_DIR("=/usr/x86_64-linux-gnu/lib32"); SEARCH_DIR("=/usr/i386-linux-gnu/lib");
SECTIONS
{
    . = 0x0100000;

    
    .text   :
    {
        *(.multiboot)
        *(.text*)
        *(.rodata)
    }
    .data   :
    {
        start_ctors = .;
        KEEP(*(.init_array));
        KEEP(*(SORT_BY_INIT_PRIORITY( .init_array.*)));
        end_ctors = .;
        
        *(.data)
    }
    .bss    :
    {
        *(.bss)
    }
    /DISCARD/   :   {*(.fini_array*) *(.comment)}
}
