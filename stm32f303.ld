/* Define the end of RAM and limit the stack  memory */
/* (48KB SRAM on STM32f303 lin3, 48000 = 0xBB80 */
/* RAM starts at address 0x20000000) */
_estack = 0x2000BB80;

MEMORY
{
    FLASH ( rx )      : ORIGIN = 0x08000000, LENGTH = 256K
    RAM ( rxw)        : ORIGIN = 0x20000000, LENGTH = 48K
}
