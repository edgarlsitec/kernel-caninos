cmd_drivers/misc/misc-info/mi_debug.o := arm-linux-gnueabihf-gcc -Wp,-MD,drivers/misc/misc-info/.mi_debug.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -Iinclude  -I/home/edgar/repo/kernel-caninos/uboot/include -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/include -include /home/edgar/repo/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/uboot/drivers/misc/misc-info -Idrivers/misc/misc-info -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(mi_debug)"  -D"KBUILD_MODNAME=KBUILD_STR(mi)" -c -o drivers/misc/misc-info/mi_debug.o /home/edgar/repo/kernel-caninos/uboot/drivers/misc/misc-info/mi_debug.c

source_drivers/misc/misc-info/mi_debug.o := /home/edgar/repo/kernel-caninos/uboot/drivers/misc/misc-info/mi_debug.c

deps_drivers/misc/misc-info/mi_debug.o := \

drivers/misc/misc-info/mi_debug.o: $(deps_drivers/misc/misc-info/mi_debug.o)

$(deps_drivers/misc/misc-info/mi_debug.o):
