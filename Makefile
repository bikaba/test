all: test.axf

test.axf: test.o test2.o
	armlink.exe --cpu=Cortex-m4f --rwpi --entry=ml_func4 test.o test2.o --map --symbols --list test.map -o test.axf
	fromelf.exe --text -dc test.axf > test_axf.log

test.elf: test.o
	arm-none-eabi-ld -static -T test.lds -o test.elf test.o
	arm-none-eabi-objdump -DS test.elf > test_elf.log

test.o: test.c
#	arm-none-eabi-gcc -Wall -O3 -mcpu=cortex-m4 -fPIC -c test.c
	armcc.exe -W -O1 -g --cpu=Cortex-m4f --apcs=/rwpi -c test.c
	armcc.exe -W -O1 -g --cpu=Cortex-m4f --apcs=/rwpi -c test2.c
#	/mnt/c/Keil_v5_29//ARM/ARMCC/bin/armcc.exe -W -O0 --cpu=Cortex-m4f --apcs=/fpic/rwpi/ropi -c test.c
#	/mnt/c/Keil_v5_29/ARM/ARMCLANG/bin/armclang.exe -W -O0 --target=arm-arm-none-eabi -mcpu=Cortex-m4f -fpic -frwpi -fropi -c test.c
#	/mnt/c/Keil_v5_29/ARM/ARMCLANG/bin/armclang.exe -W -O0 --target=arm-arm-none-eabi -march=armv7 -fbare-metal-pie -c test.c
	arm-none-eabi-objdump -DS test.o > test_o.log

clean:
	rm -rf *.o *.elf *.axf
