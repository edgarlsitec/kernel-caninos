cmd_lib/fdt_empty_tree.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/.fdt_empty_tree.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -I/home/edgar/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/kernel-caninos/linux/include -I./include -I/home/edgar/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/kernel-caninos/linux/include/linux/kconfig.h  -I/home/edgar/kernel-caninos/linux/lib -Ilib -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -I/home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt    -DKBUILD_BASENAME='"fdt_empty_tree"'  -DKBUILD_MODNAME='"fdt_empty_tree"' -c -o lib/.tmp_fdt_empty_tree.o /home/edgar/kernel-caninos/linux/lib/fdt_empty_tree.c

source_lib/fdt_empty_tree.o := /home/edgar/kernel-caninos/linux/lib/fdt_empty_tree.c

deps_lib/fdt_empty_tree.o := \
  /home/edgar/kernel-caninos/linux/include/linux/libfdt_env.h \
  /home/edgar/kernel-caninos/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/edgar/kernel-caninos/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/edgar/kernel-caninos/linux/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/edgar/kernel-caninos/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/types.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/types.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/int-ll64.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/bitsperlong.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/posix_types.h \
  /home/edgar/kernel-caninos/linux/include/linux/stddef.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/stddef.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/posix_types.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/posix_types.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/smp.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/barrier.h \
  /home/edgar/kernel-caninos/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include/stdarg.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/string.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/string.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/byteorder.h \
  /home/edgar/kernel-caninos/linux/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/byteorder/little_endian.h \
  /home/edgar/kernel-caninos/linux/include/linux/swab.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/swab.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/swab.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/swab.h \
  /home/edgar/kernel-caninos/linux/include/linux/byteorder/generic.h \
  /home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt/fdt_empty_tree.c \
  /home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt/libfdt_env.h \
  /home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt/fdt.h \
  /home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt/libfdt.h \
  /home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt/fdt.h \
  /home/edgar/kernel-caninos/linux/lib/../scripts/dtc/libfdt/libfdt_internal.h \

lib/fdt_empty_tree.o: $(deps_lib/fdt_empty_tree.o)

$(deps_lib/fdt_empty_tree.o):
