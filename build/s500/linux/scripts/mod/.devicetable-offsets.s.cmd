cmd_scripts/mod/devicetable-offsets.s := arm-linux-gnueabihf-gcc -Wp,-MD,scripts/mod/.devicetable-offsets.s.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/repo/kernel-caninos/linux/include -I./include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/repo/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/repo/kernel-caninos/linux/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/linux/scripts/mod -Iscripts/mod -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time    -DKBUILD_BASENAME='"devicetable_offsets"'  -DKBUILD_MODNAME='"devicetable_offsets"'  -fverbose-asm -S -o scripts/mod/devicetable-offsets.s /home/edgar/repo/kernel-caninos/linux/scripts/mod/devicetable-offsets.c

source_scripts/mod/devicetable-offsets.s := /home/edgar/repo/kernel-caninos/linux/scripts/mod/devicetable-offsets.c

deps_scripts/mod/devicetable-offsets.s := \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kbuild.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mod_devicetable.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/types.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/types.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/int-ll64.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitsperlong.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/bitsperlong.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/posix_types.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stddef.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/stddef.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/posix_types.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/posix_types.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/uuid.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/uuid.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/smp.h) \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/barrier.h \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stdarg.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/string.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/string.h \

scripts/mod/devicetable-offsets.s: $(deps_scripts/mod/devicetable-offsets.s)

$(deps_scripts/mod/devicetable-offsets.s):
