cmd_arch/arm/lib/delay-loop.o := arm-linux-gnueabihf-gcc -Wp,-MD,arch/arm/lib/.delay-loop.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/repo/kernel-caninos/linux/include -I./include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/repo/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/repo/kernel-caninos/linux/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ -fno-PIE -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -DCC_HAVE_ASM_GOTO   -c -o arch/arm/lib/delay-loop.o /home/edgar/repo/kernel-caninos/linux/arch/arm/lib/delay-loop.S

source_arch/arm/lib/delay-loop.o := /home/edgar/repo/kernel-caninos/linux/arch/arm/lib/delay-loop.S

deps_arch/arm/lib/delay-loop.o := \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/cpu/v7m.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/linkage.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stringify.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/linkage.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/ptrace.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/hwcap.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/hwcap.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/opcodes-virt.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/page.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/getorder.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/delay.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/xip/kernel.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/xip/phys/addr.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/const.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/sizes.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pfn.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/param.h \

arch/arm/lib/delay-loop.o: $(deps_arch/arm/lib/delay-loop.o)

$(deps_arch/arm/lib/delay-loop.o):
