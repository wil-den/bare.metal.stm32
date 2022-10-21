// These instructions define the attributes of our chip and
// the assembly language we will use
.syntax unified
//.fpu hard
.cpu cortex-m4
.thumb

//Global memory locations
.global vtable
.global reset_handler

/*
* The actual vector table.
* Only the size of RAM and 'reset' handler are
* included for simplicity
*/

.type vtable, %object
vtable:
    .word _estack
    .word reset_handler
.size vtable, .-vtable


/*
* The reset handler. Called on reset
*/

.type reset_handler, %function
reset_handler:
    // Set the stack pointer ro rhe end of the stack
    // the '_estack' value is defined in the linker script
    LDR r0, =_estack
    MOV sp, r0

    // Set some dummy values. When we see these values
    // in our debugger we'll know that the program is loaded
    // on the chip and working
    LDR r7, =0xDEADBEEF
    MOV r0, #0
    main_loop:
        // Add 1 to register r0
        ADDS r0, r0, #1
        // loop back
        B   main_loop
.size reset_handler, .-reset_handler
