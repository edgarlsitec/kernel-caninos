cmd_arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o := arm-linux-gnueabihf-gcc -Wp,-MD,arch/arm/cpu/armv7/owl/.pinctrl_data-atm7059.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -Iinclude  -I/home/edgar/repo/kernel-caninos/uboot/include -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/include -include /home/edgar/repo/kernel-caninos/uboot/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/uboot/arch/arm/cpu/armv7/owl -Iarch/arm/cpu/armv7/owl -D__KERNEL__ -D__UBOOT__ -DCONFIG_SYS_TEXT_BASE=0x08000040 -Wall -Wstrict-prototypes -Wno-format-security -fno-builtin -ffreestanding -Os -fno-stack-protector -g -fstack-usage -Wno-format-nonliteral -D__ARM__ -marm -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations -mno-unaligned-access -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -msoft-float -pipe -march=armv7-a    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(pinctrl_data_atm7059)"  -D"KBUILD_MODNAME=KBUILD_STR(pinctrl_data_atm7059)" -c -o arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o /home/edgar/repo/kernel-caninos/uboot/arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.c

source_arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o := /home/edgar/repo/kernel-caninos/uboot/arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.c

deps_arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o := \
  /home/edgar/repo/kernel-caninos/uboot/arch/arm/cpu/armv7/owl/pinctrl_data-owl.h \

arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o: $(deps_arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o)

$(deps_arch/arm/cpu/armv7/owl/pinctrl_data-atm7059.o):
