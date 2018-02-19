cmd_lib/errno.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/.errno.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -Iinclude  -I/home/edgar/kernel-caninos/uboot/include -I/home/edgar/kernel-caninos/uboot/arch/arm/include -include /home/edgar/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/kernel-caninos/uboot/lib -Ilib -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(errno)"  -D"KBUILD_MODNAME=KBUILD_STR(errno)" -c -o lib/errno.o /home/edgar/kernel-caninos/uboot/lib/errno.c

source_lib/errno.o := /home/edgar/kernel-caninos/uboot/lib/errno.c

deps_lib/errno.o := \

lib/errno.o: $(deps_lib/errno.o)

$(deps_lib/errno.o):
