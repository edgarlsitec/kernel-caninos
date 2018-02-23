cmd_lib/ldiv.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/.ldiv.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -Iinclude  -I/home/edgar/repo/kernel-caninos/uboot/include -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/include -include /home/edgar/repo/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/uboot/lib -Ilib -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ldiv)"  -D"KBUILD_MODNAME=KBUILD_STR(ldiv)" -c -o lib/ldiv.o /home/edgar/repo/kernel-caninos/uboot/lib/ldiv.c

source_lib/ldiv.o := /home/edgar/repo/kernel-caninos/uboot/lib/ldiv.c

deps_lib/ldiv.o := \

lib/ldiv.o: $(deps_lib/ldiv.o)

$(deps_lib/ldiv.o):
