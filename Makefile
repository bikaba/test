test.elf: test.o
	arm-none-eabi-ld -static -T test.lds -o test.elf test.o
	arm-none-eabi-objdump -DS test.elf > test_elf.log

test.o: test.c
	arm-none-eabi-gcc -Wall -O3 -mcpu=cortex-m4 -fPIC -c test.c
	arm-none-eabi-objdump -DS test.o > test_o.log
