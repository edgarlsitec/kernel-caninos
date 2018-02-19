cmd_lib/crc8.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/.crc8.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -Iinclude  -I/home/edgar/kernel-caninos/uboot/include -I/home/edgar/kernel-caninos/uboot/arch/arm/include -include /home/edgar/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/kernel-caninos/uboot/lib -Ilib -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(crc8)"  -D"KBUILD_MODNAME=KBUILD_STR(crc8)" -c -o lib/crc8.o /home/edgar/kernel-caninos/uboot/lib/crc8.c

source_lib/crc8.o := /home/edgar/kernel-caninos/uboot/lib/crc8.c

deps_lib/crc8.o := \
  /home/edgar/kernel-caninos/uboot/include/linux/crc8.h \

lib/crc8.o: $(deps_lib/crc8.o)

$(deps_lib/crc8.o):
