#!make
compile:
	arm-none-eabi-gcc -x assembler-with-cpp -c -O0 -mcpu=cortex-m4 -mthumb -Wall core.s -o core.o  

link:
	arm-none-eabi-gcc core.o -mcpu=cortex-m4 -mthumb -Wall -nostdlib -lgcc -T./stm32f303.ld -o main.elf

clean:
	rm -rf *.o && rm main.elf

.PHONY: clean
.PHONY: compile
.PHONY: link