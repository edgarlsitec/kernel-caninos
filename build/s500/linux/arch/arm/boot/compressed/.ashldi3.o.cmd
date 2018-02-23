cmd_arch/arm/boot/compressed/ashldi3.o := arm-linux-gnueabihf-gcc -Wp,-MD,arch/arm/boot/compressed/.ashldi3.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -I/home/edgar/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/kernel-caninos/linux/include -I./include -I/home/edgar/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/kernel-caninos/linux/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ -fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -DCC_HAVE_ASM_GOTO -DZIMAGE   -c -o arch/arm/boot/compressed/ashldi3.o arch/arm/boot/compressed/ashldi3.S

source_arch/arm/boot/compressed/ashldi3.o := arch/arm/boot/compressed/ashldi3.S

deps_arch/arm/boot/compressed/ashldi3.o := \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/cpu/v7m.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/edgar/kernel-caninos/linux/include/linux/linkage.h \
  /home/edgar/kernel-caninos/linux/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/edgar/kernel-caninos/linux/include/linux/stringify.h \
  /home/edgar/kernel-caninos/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/linkage.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/ptrace.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/hwcap.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/hwcap.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/opcodes-virt.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/page.h \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm/lpae.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/getorder.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/edgar/kernel-caninos/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \

arch/arm/boot/compressed/ashldi3.o: $(deps_arch/arm/boot/compressed/ashldi3.o)

$(deps_arch/arm/boot/compressed/ashldi3.o):
