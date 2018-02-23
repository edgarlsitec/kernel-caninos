cmd_lib/zlib_inflate/inflate.o := arm-linux-gnueabihf-gcc -Wp,-MD,lib/zlib_inflate/.inflate.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/repo/kernel-caninos/linux/include -I./include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/repo/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/repo/kernel-caninos/linux/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate -Ilib/zlib_inflate -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -fno-inline-functions-called-once -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time    -DKBUILD_BASENAME='"inflate"'  -DKBUILD_MODNAME='"zlib_inflate"' -c -o lib/zlib_inflate/.tmp_inflate.o /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/inflate.c

source_lib/zlib_inflate/inflate.o := /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/inflate.c

deps_lib/zlib_inflate/inflate.o := \
  /home/edgar/repo/kernel-caninos/linux/include/linux/zutil.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/zlib.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/zconf.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/types.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/types.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/int-ll64.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/uapi/asm/bitsperlong.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/bitsperlong.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/posix_types.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stddef.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/stddef.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/posix_types.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/posix_types.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/smp.h) \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/barrier.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stdarg.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/string.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/string.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/linkage.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stringify.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/linkage.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/bitops.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/bitops.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/typecheck.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/irqflags.h \
    $(wildcard include/config/cpu/v7m.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/hwcap.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/hwcap.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/irqflags.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/non-atomic.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/fls64.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/sched.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/hweight.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/arch_hweight.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/const_hweight.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/lock.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/le.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/byteorder.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/byteorder/little_endian.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/swab.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/swab.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/swab.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/swab.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/byteorder/generic.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kern_levels.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/kernel.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/sysinfo.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/build_bug.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/div64.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/compiler.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/div64.h \
  /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/inftrees.h \
  /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/inflate.h \
  /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/inffast.h \
  /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/infutil.h \
  /home/edgar/repo/kernel-caninos/linux/lib/zlib_inflate/inffixed.h \

lib/zlib_inflate/inflate.o: $(deps_lib/zlib_inflate/inflate.o)

$(deps_lib/zlib_inflate/inflate.o):
