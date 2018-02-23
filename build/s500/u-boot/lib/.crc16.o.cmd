cmd_lib/crc16.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/.crc16.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -Iinclude  -I/home/edgar/repo/kernel-caninos/uboot/include -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/include -include /home/edgar/repo/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/uboot/lib -Ilib -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(crc16)"  -D"KBUILD_MODNAME=KBUILD_STR(crc16)" -c -o lib/crc16.o /home/edgar/repo/kernel-caninos/uboot/lib/crc16.c

source_lib/crc16.o := /home/edgar/repo/kernel-caninos/uboot/lib/crc16.c

deps_lib/crc16.o := \
  /home/edgar/repo/kernel-caninos/uboot/include/crc.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/use/stdint.h) \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/posix_types.h \
  /home/edgar/repo/kernel-caninos/uboot/include/linux/stddef.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/posix_types.h \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/include/asm/types.h \
    $(wildcard include/config/arm64.h) \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stdbool.h \

lib/crc16.o: $(deps_lib/crc16.o)

$(deps_lib/crc16.o):
