cmd_arch/arm/kernel/setup.o := arm-linux-gnueabihf-gcc -Wp,-MD,arch/arm/kernel/.setup.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include -I/home/edgar/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/kernel-caninos/linux/include -I./include -I/home/edgar/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/kernel-caninos/linux/include/linux/kconfig.h  -I/home/edgar/kernel-caninos/linux/arch/arm/kernel -Iarch/arm/kernel -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init    -DKBUILD_BASENAME='"setup"'  -DKBUILD_MODNAME='"setup"' -c -o arch/arm/kernel/.tmp_setup.o /home/edgar/kernel-caninos/linux/arch/arm/kernel/setup.c

source_arch/arm/kernel/setup.o := /home/edgar/kernel-caninos/linux/arch/arm/kernel/setup.c

deps_arch/arm/kernel/setup.o := \
    $(wildcard include/config/fpe/nwfpe.h) \
    $(wildcard include/config/fpe/fastfpe.h) \
    $(wildcard include/config/outer/cache.h) \
    $(wildcard include/config/cpu/v7m.h) \
    $(wildcard include/config/debug/ll.h) \
    $(wildcard include/config/arm/patch/idiv.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/arch/phys/addr/t/64bit.h) \
    $(wildcard include/config/vga/console.h) \
    $(wildcard include/config/dummy/console.h) \
    $(wildcard include/config/efi.h) \
    $(wildcard include/config/kexec.h) \
    $(wildcard include/config/arm/virt/ext.h) \
    $(wildcard include/config/multi/irq/handler.h) \
    $(wildcard include/config/vt.h) \
    $(wildcard include/config/have/proc/cpu.h) \
  /home/edgar/kernel-caninos/linux/include/linux/efi.h \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/efi/esrt.h) \
    $(wildcard include/config/efi/fake/memmap.h) \
    $(wildcard include/config/efi/pcdp.h) \
    $(wildcard include/config/tables.h) \
    $(wildcard include/config/efi/dev/path/parser.h) \
    $(wildcard include/config/efi/vars.h) \
    $(wildcard include/config/efi/runtime/map.h) \
    $(wildcard include/config/reset/attack/mitigation.h) \
  /home/edgar/kernel-caninos/linux/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
    $(wildcard include/config/strict/module/rwx.h) \
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
  /home/edgar/kernel-caninos/linux/include/asm-generic/barrier.h \
  /home/edgar/kernel-caninos/linux/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
  /home/edgar/kernel-caninos/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include/stdarg.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/string.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/string.h \
  /home/edgar/kernel-caninos/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/edgar/kernel-caninos/linux/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/kernel.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/sysinfo.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/edgar/kernel-caninos/linux/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/edgar/kernel-caninos/linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/preempt.h) \
  /home/edgar/kernel-caninos/linux/include/linux/typecheck.h \
  /home/edgar/kernel-caninos/linux/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/edgar/kernel-caninos/linux/include/linux/linkage.h \
  /home/edgar/kernel-caninos/linux/include/linux/stringify.h \
  /home/edgar/kernel-caninos/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/linkage.h \
  /home/edgar/kernel-caninos/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/edgar/kernel-caninos/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/const.h \
  /home/edgar/kernel-caninos/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/edgar/kernel-caninos/linux/include/linux/bitops.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/bitops.h \
  /home/edgar/kernel-caninos/linux/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/irqflags.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/ptrace.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/hwcap.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/hwcap.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/irqflags.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/non-atomic.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/fls64.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/sched.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/hweight.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/arch_hweight.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/const_hweight.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/lock.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/le.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/byteorder.h \
  /home/edgar/kernel-caninos/linux/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/byteorder/little_endian.h \
  /home/edgar/kernel-caninos/linux/include/linux/swab.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/swab.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/swab.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/swab.h \
  /home/edgar/kernel-caninos/linux/include/linux/byteorder/generic.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/edgar/kernel-caninos/linux/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/edgar/kernel-caninos/linux/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/edgar/kernel-caninos/linux/include/linux/kern_levels.h \
  /home/edgar/kernel-caninos/linux/include/linux/build_bug.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/div64.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/compiler.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/div64.h \
  arch/arm/include/generated/asm/preempt.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/preempt.h \
  /home/edgar/kernel-caninos/linux/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/debug/kmemleak.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /home/edgar/kernel-caninos/linux/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/edgar/kernel-caninos/linux/include/linux/restart_block.h \
    $(wildcard include/config/compat.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/glue.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/pgtable-2level-types.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/memory.h \
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
  /home/edgar/kernel-caninos/linux/include/linux/sizes.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/edgar/kernel-caninos/linux/include/linux/pfn.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/getorder.h \
  /home/edgar/kernel-caninos/linux/include/linux/bottom_half.h \
  /home/edgar/kernel-caninos/linux/include/linux/spinlock_types.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/spinlock_types.h \
  /home/edgar/kernel-caninos/linux/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rwlock_types.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/spinlock.h \
  /home/edgar/kernel-caninos/linux/include/linux/prefetch.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/binfmt/elf/fdpic.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/hw_breakpoint.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rwlock.h \
  /home/edgar/kernel-caninos/linux/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/edgar/kernel-caninos/linux/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/atomic.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/cmpxchg-local.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/atomic-long.h \
  /home/edgar/kernel-caninos/linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/edgar/kernel-caninos/linux/include/linux/time64.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/time.h \
  /home/edgar/kernel-caninos/linux/include/linux/time32.h \
  /home/edgar/kernel-caninos/linux/include/linux/proc_fs.h \
    $(wildcard include/config/proc/fs.h) \
  /home/edgar/kernel-caninos/linux/include/linux/fs.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
  /home/edgar/kernel-caninos/linux/include/linux/wait_bit.h \
  /home/edgar/kernel-caninos/linux/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/current.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/wait.h \
  /home/edgar/kernel-caninos/linux/include/linux/kdev_t.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/kdev_t.h \
  /home/edgar/kernel-caninos/linux/include/linux/dcache.h \
  /home/edgar/kernel-caninos/linux/include/linux/rculist.h \
  /home/edgar/kernel-caninos/linux/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/edgar/kernel-caninos/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/edgar/kernel-caninos/linux/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/edgar/kernel-caninos/linux/include/linux/bitmap.h \
  /home/edgar/kernel-caninos/linux/include/linux/rcutree.h \
  /home/edgar/kernel-caninos/linux/include/linux/rculist_bl.h \
  /home/edgar/kernel-caninos/linux/include/linux/list_bl.h \
  /home/edgar/kernel-caninos/linux/include/linux/bit_spinlock.h \
  /home/edgar/kernel-caninos/linux/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  include/generated/bounds.h \
  /home/edgar/kernel-caninos/linux/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/edgar/kernel-caninos/linux/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/edgar/kernel-caninos/linux/include/linux/path.h \
  /home/edgar/kernel-caninos/linux/include/linux/stat.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/stat.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/stat.h \
  /home/edgar/kernel-caninos/linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/edgar/kernel-caninos/linux/include/linux/highuid.h \
  /home/edgar/kernel-caninos/linux/include/linux/list_lru.h \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/slob.h) \
  /home/edgar/kernel-caninos/linux/include/linux/nodemask.h \
    $(wildcard include/config/numa.h) \
  /home/edgar/kernel-caninos/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/edgar/kernel-caninos/linux/include/linux/shrinker.h \
  /home/edgar/kernel-caninos/linux/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/edgar/kernel-caninos/linux/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rbtree.h \
  /home/edgar/kernel-caninos/linux/include/linux/pid.h \
  /home/edgar/kernel-caninos/linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /home/edgar/kernel-caninos/linux/include/linux/osq_lock.h \
  /home/edgar/kernel-caninos/linux/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/edgar/kernel-caninos/linux/include/linux/err.h \
  arch/arm/include/generated/uapi/asm/errno.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/errno.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/errno-base.h \
  arch/arm/include/generated/asm/rwsem.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/rwsem.h \
  /home/edgar/kernel-caninos/linux/include/linux/mm_types.h \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hmm.h) \
  /home/edgar/kernel-caninos/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/edgar/kernel-caninos/linux/include/linux/auxvec.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/auxvec.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/auxvec.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/auxvec.h \
  /home/edgar/kernel-caninos/linux/include/linux/completion.h \
  /home/edgar/kernel-caninos/linux/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /home/edgar/kernel-caninos/linux/include/linux/errno.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/errno.h \
  /home/edgar/kernel-caninos/linux/include/linux/page-flags-layout.h \
  /home/edgar/kernel-caninos/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/edgar/kernel-caninos/linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/edgar/kernel-caninos/linux/include/linux/ktime.h \
  /home/edgar/kernel-caninos/linux/include/linux/jiffies.h \
  /home/edgar/kernel-caninos/linux/include/linux/timex.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/timex.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/param.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/param.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/timex.h \
  include/generated/timeconst.h \
  /home/edgar/kernel-caninos/linux/include/linux/timekeeping.h \
  /home/edgar/kernel-caninos/linux/include/linux/timekeeping32.h \
  /home/edgar/kernel-caninos/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
    $(wildcard include/config/vdso.h) \
  /home/edgar/kernel-caninos/linux/include/linux/capability.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/capability.h \
  /home/edgar/kernel-caninos/linux/include/linux/semaphore.h \
  /home/edgar/kernel-caninos/linux/include/linux/fcntl.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/fcntl.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/fcntl.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/fcntl.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/fiemap.h \
  /home/edgar/kernel-caninos/linux/include/linux/migrate_mode.h \
  /home/edgar/kernel-caninos/linux/include/linux/percpu-rwsem.h \
  /home/edgar/kernel-caninos/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/edgar/kernel-caninos/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/edgar/kernel-caninos/linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/smp.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/percpu.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/percpu.h \
  /home/edgar/kernel-caninos/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/virtualization.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rcuwait.h \
  /home/edgar/kernel-caninos/linux/include/linux/rcu_sync.h \
  /home/edgar/kernel-caninos/linux/include/linux/delayed_call.h \
  /home/edgar/kernel-caninos/linux/include/linux/uuid.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/uuid.h \
  /home/edgar/kernel-caninos/linux/include/linux/errseq.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/fs.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/limits.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/ioctl.h \
  arch/arm/include/generated/uapi/asm/ioctl.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/ioctl.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/ioctl.h \
  /home/edgar/kernel-caninos/linux/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/edgar/kernel-caninos/linux/include/linux/percpu_counter.h \
  /home/edgar/kernel-caninos/linux/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /home/edgar/kernel-caninos/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/edgar/kernel-caninos/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/edgar/kernel-caninos/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/edgar/kernel-caninos/linux/include/linux/notifier.h \
  /home/edgar/kernel-caninos/linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/edgar/kernel-caninos/linux/include/linux/rcu_segcblist.h \
  /home/edgar/kernel-caninos/linux/include/linux/srcutree.h \
  /home/edgar/kernel-caninos/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/edgar/kernel-caninos/linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/edgar/kernel-caninos/linux/include/linux/arch_topology.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/topology.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/dqblk_xfs.h \
  /home/edgar/kernel-caninos/linux/include/linux/dqblk_v1.h \
  /home/edgar/kernel-caninos/linux/include/linux/dqblk_v2.h \
  /home/edgar/kernel-caninos/linux/include/linux/dqblk_qtree.h \
  /home/edgar/kernel-caninos/linux/include/linux/projid.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/quota.h \
  /home/edgar/kernel-caninos/linux/include/linux/nfs_fs_i.h \
  /home/edgar/kernel-caninos/linux/include/linux/rtc.h \
    $(wildcard include/config/rtc/intf/dev/uie/emul.h) \
    $(wildcard include/config/rtc/hctosys/device.h) \
  /home/edgar/kernel-caninos/linux/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/irq/timings.h) \
  /home/edgar/kernel-caninos/linux/include/linux/irqreturn.h \
  /home/edgar/kernel-caninos/linux/include/linux/irqnr.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/irqnr.h \
  /home/edgar/kernel-caninos/linux/include/linux/hardirq.h \
  /home/edgar/kernel-caninos/linux/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /home/edgar/kernel-caninos/linux/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/edgar/kernel-caninos/linux/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /home/edgar/kernel-caninos/linux/include/linux/static_key.h \
  /home/edgar/kernel-caninos/linux/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/hardirq.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
  /home/edgar/kernel-caninos/linux/include/linux/irq_cpustat.h \
  /home/edgar/kernel-caninos/linux/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/edgar/kernel-caninos/linux/include/linux/timerqueue.h \
  /home/edgar/kernel-caninos/linux/include/linux/kref.h \
  /home/edgar/kernel-caninos/linux/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/sections.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/sections.h \
  /home/edgar/kernel-caninos/linux/include/linux/nvmem-provider.h \
    $(wildcard include/config/nvmem.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/rtc.h \
  /home/edgar/kernel-caninos/linux/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/edgar/kernel-caninos/linux/include/linux/ioport.h \
  /home/edgar/kernel-caninos/linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/edgar/kernel-caninos/linux/include/linux/sysfs.h \
  /home/edgar/kernel-caninos/linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/edgar/kernel-caninos/linux/include/linux/idr.h \
  /home/edgar/kernel-caninos/linux/include/linux/kobject_ns.h \
  /home/edgar/kernel-caninos/linux/include/linux/klist.h \
  /home/edgar/kernel-caninos/linux/include/linux/pinctrl/devinfo.h \
    $(wildcard include/config/pm.h) \
  /home/edgar/kernel-caninos/linux/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/edgar/kernel-caninos/linux/include/linux/ratelimit.h \
  /home/edgar/kernel-caninos/linux/include/linux/sched.h \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/livepatch.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/sched.h \
  /home/edgar/kernel-caninos/linux/include/linux/sem.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/sem.h \
  /home/edgar/kernel-caninos/linux/include/linux/ipc.h \
  /home/edgar/kernel-caninos/linux/include/linux/rhashtable.h \
  /home/edgar/kernel-caninos/linux/include/linux/jhash.h \
  /home/edgar/kernel-caninos/linux/include/linux/unaligned/packed_struct.h \
  /home/edgar/kernel-caninos/linux/include/linux/list_nulls.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/ipc.h \
  arch/arm/include/generated/uapi/asm/ipcbuf.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/ipcbuf.h \
  arch/arm/include/generated/uapi/asm/sembuf.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/sembuf.h \
  /home/edgar/kernel-caninos/linux/include/linux/shm.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/shm.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm/include/generated/uapi/asm/shmbuf.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/shmbuf.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/shmparam.h \
  /home/edgar/kernel-caninos/linux/include/linux/kcov.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/kcov.h \
  /home/edgar/kernel-caninos/linux/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/edgar/kernel-caninos/linux/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/seccomp.h \
  /home/edgar/kernel-caninos/linux/include/linux/resource.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/resource.h \
  arch/arm/include/generated/uapi/asm/resource.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/resource.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/resource.h \
  /home/edgar/kernel-caninos/linux/include/linux/latencytop.h \
  /home/edgar/kernel-caninos/linux/include/linux/sched/prio.h \
  /home/edgar/kernel-caninos/linux/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/signal.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/signal.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/signal.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/signal-defs.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/uapi/asm/siginfo.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/siginfo.h \
  /home/edgar/kernel-caninos/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/arm/dma/use/iommu.h) \
    $(wildcard include/config/xen.h) \
    $(wildcard include/config/arch/omap.h) \
  /home/edgar/kernel-caninos/linux/include/linux/pm_wakeup.h \
  /home/edgar/kernel-caninos/linux/include/linux/seq_file.h \
  /home/edgar/kernel-caninos/linux/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/keys.h) \
  /home/edgar/kernel-caninos/linux/include/linux/key.h \
    $(wildcard include/config/sysctl.h) \
  /home/edgar/kernel-caninos/linux/include/linux/sysctl.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/sysctl.h \
  /home/edgar/kernel-caninos/linux/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/edgar/kernel-caninos/linux/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/edgar/kernel-caninos/linux/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/net.h) \
  /home/edgar/kernel-caninos/linux/include/linux/cdev.h \
  /home/edgar/kernel-caninos/linux/include/linux/poll.h \
  /home/edgar/kernel-caninos/linux/include/linux/uaccess.h \
  /home/edgar/kernel-caninos/linux/include/linux/kasan-checks.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/uaccess.h \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/uaccess/with/memcpy.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
  arch/arm/include/generated/asm/extable.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/extable.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/poll.h \
  arch/arm/include/generated/uapi/asm/poll.h \
  /home/edgar/kernel-caninos/linux/include/uapi/asm-generic/poll.h \
  /home/edgar/kernel-caninos/linux/include/linux/pstore.h \
    $(wildcard include/config/arm.h) \
  /home/edgar/kernel-caninos/linux/include/linux/kmsg_dump.h \
  /home/edgar/kernel-caninos/linux/include/linux/range.h \
  /home/edgar/kernel-caninos/linux/include/linux/reboot.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/reboot.h \
  arch/arm/include/generated/asm/emergency-restart.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/emergency-restart.h \
  /home/edgar/kernel-caninos/linux/include/linux/screen_info.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/screen_info.h \
  /home/edgar/kernel-caninos/linux/include/linux/delay.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/delay.h \
  /home/edgar/kernel-caninos/linux/include/linux/utsname.h \
    $(wildcard include/config/uts/ns.h) \
    $(wildcard include/config/proc/sysctl.h) \
  /home/edgar/kernel-caninos/linux/include/linux/nsproxy.h \
  /home/edgar/kernel-caninos/linux/include/linux/ns_common.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/utsname.h \
  /home/edgar/kernel-caninos/linux/include/linux/initrd.h \
  /home/edgar/kernel-caninos/linux/include/linux/console.h \
    $(wildcard include/config/hw/console.h) \
    $(wildcard include/config/tty.h) \
  /home/edgar/kernel-caninos/linux/include/linux/bootmem.h \
    $(wildcard include/config/have/arch/bootmem/node.h) \
    $(wildcard include/config/have/memblock.h) \
    $(wildcard include/config/have/arch/alloc/remap.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/dma.h \
    $(wildcard include/config/isa/dma/api.h) \
    $(wildcard include/config/pci.h) \
  /home/edgar/kernel-caninos/linux/include/linux/of_platform.h \
    $(wildcard include/config/of/address.h) \
    $(wildcard include/config/of/dynamic.h) \
  /home/edgar/kernel-caninos/linux/include/linux/mod_devicetable.h \
  /home/edgar/kernel-caninos/linux/include/linux/of_device.h \
  /home/edgar/kernel-caninos/linux/include/linux/cpu.h \
    $(wildcard include/config/pm/sleep/smp.h) \
  /home/edgar/kernel-caninos/linux/include/linux/node.h \
    $(wildcard include/config/memory/hotplug/sparse.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/edgar/kernel-caninos/linux/include/linux/cpuhotplug.h \
  /home/edgar/kernel-caninos/linux/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
  /home/edgar/kernel-caninos/linux/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/promtree.h) \
    $(wildcard include/config/of/kobj.h) \
    $(wildcard include/config/attach/node.h) \
    $(wildcard include/config/detach/node.h) \
    $(wildcard include/config/add/property.h) \
    $(wildcard include/config/remove/property.h) \
    $(wildcard include/config/update/property.h) \
    $(wildcard include/config/of/numa.h) \
    $(wildcard include/config/no/change.h) \
    $(wildcard include/config/change/add.h) \
    $(wildcard include/config/change/remove.h) \
    $(wildcard include/config/of/overlay.h) \
  /home/edgar/kernel-caninos/linux/include/linux/property.h \
  /home/edgar/kernel-caninos/linux/include/linux/fwnode.h \
  /home/edgar/kernel-caninos/linux/include/linux/kexec.h \
    $(wildcard include/config/kexec/core.h) \
    $(wildcard include/config/kexec/file.h) \
    $(wildcard include/config/kexec/verify/sig.h) \
    $(wildcard include/config/kexec/jump.h) \
  /home/edgar/kernel-caninos/linux/include/linux/crash_core.h \
  /home/edgar/kernel-caninos/linux/include/linux/elfcore.h \
  /home/edgar/kernel-caninos/linux/include/linux/user.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/user.h \
  /home/edgar/kernel-caninos/linux/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/magic.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/elf.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/vdso_datapage.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/elfcore.h \
  /home/edgar/kernel-caninos/linux/include/linux/signal.h \
  /home/edgar/kernel-caninos/linux/include/linux/ptrace.h \
  /home/edgar/kernel-caninos/linux/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
  /home/edgar/kernel-caninos/linux/include/linux/sched/jobctl.h \
  /home/edgar/kernel-caninos/linux/include/linux/sched/task.h \
    $(wildcard include/config/have/copy/thread/tls.h) \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
  /home/edgar/kernel-caninos/linux/include/linux/pid_namespace.h \
    $(wildcard include/config/pid/ns.h) \
  /home/edgar/kernel-caninos/linux/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/x86/intel/memory/protection/keys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/device/public.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
  /home/edgar/kernel-caninos/linux/include/linux/percpu-refcount.h \
  /home/edgar/kernel-caninos/linux/include/linux/page_ext.h \
    $(wildcard include/config/idle/page/tracking.h) \
  /home/edgar/kernel-caninos/linux/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /home/edgar/kernel-caninos/linux/include/linux/stackdepot.h \
  /home/edgar/kernel-caninos/linux/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/edgar/kernel-caninos/linux/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/edgar/kernel-caninos/linux/include/linux/tracepoint-defs.h \
  /home/edgar/kernel-caninos/linux/include/linux/memremap.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/proc-fns.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/cpu/pj4b.h) \
    $(wildcard include/config/cpu/v7.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/pgtable-nopud.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/pgtable-nop4d-hack.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/5level-fixup.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/pgtable-hwdef.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/tlbflush.h \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/fa.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/feroceon.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
    $(wildcard include/config/arm/errata/720789.h) \
    $(wildcard include/config/arm/errata/798181.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/pgtable-2level.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/pgtable.h \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /home/edgar/kernel-caninos/linux/include/linux/huge_mm.h \
  /home/edgar/kernel-caninos/linux/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/edgar/kernel-caninos/linux/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/edgar/kernel-caninos/linux/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/ptrace.h \
  /home/edgar/kernel-caninos/linux/include/linux/elf.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/elf.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/elf-em.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/io.h \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/edgar/kernel-caninos/linux/include/xen/xen.h \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
  /home/edgar/kernel-caninos/linux/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/edgar/kernel-caninos/linux/include/linux/vmalloc.h \
  /home/edgar/kernel-caninos/linux/include/uapi/linux/kexec.h \
  /home/edgar/kernel-caninos/linux/include/linux/of_fdt.h \
    $(wildcard include/config/of/flattree.h) \
  /home/edgar/kernel-caninos/linux/include/linux/memblock.h \
    $(wildcard include/config/have/memblock/phys/map.h) \
    $(wildcard include/config/arch/discard/memblock.h) \
    $(wildcard include/config/memtest.h) \
  /home/edgar/kernel-caninos/linux/include/linux/sort.h \
  /home/edgar/kernel-caninos/linux/include/linux/psci.h \
    $(wildcard include/config/arm/psci/fw.h) \
    $(wildcard include/config/acpi.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cp15.h \
    $(wildcard include/config/cpu/cp15.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cpu.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cputype.h \
    $(wildcard include/config/cpu/pj4.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/efi.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cacheflush.h \
    $(wildcard include/config/arm/errata/411920.h) \
    $(wildcard include/config/cpu/cache/vipt.h) \
    $(wildcard include/config/frame/pointer.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/glue-cache.h \
    $(wildcard include/config/cpu/cache/v4.h) \
    $(wildcard include/config/cpu/cache/v4wb.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/cachetype.h \
    $(wildcard include/config/cpu/cache/vivt.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
  arch/arm/include/generated/asm/early_ioremap.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/fixmap.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/kmap_types.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/fixmap.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/highmem.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/mach/map.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/mmu_context.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/smp_plat.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/mm_hooks.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/procinfo.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/psci.h \
    $(wildcard include/config/arm/psci.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/setup.h \
    $(wildcard include/config/atags/proc.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/uapi/asm/setup.h \
  arch/arm/include/generated/asm/mach-types.h \
    $(wildcard include/config/arch/ebsa110.h) \
    $(wildcard include/config/arch/rpc.h) \
    $(wildcard include/config/arch/ebsa285.h) \
    $(wildcard include/config/arch/netwinder.h) \
    $(wildcard include/config/arch/cats.h) \
    $(wildcard include/config/arch/shark.h) \
    $(wildcard include/config/sa1100/brutus.h) \
    $(wildcard include/config/arch/personal/server.h) \
    $(wildcard include/config/arch/l7200.h) \
    $(wildcard include/config/sa1100/pleb.h) \
    $(wildcard include/config/arch/integrator.h) \
    $(wildcard include/config/sa1100/h3600.h) \
    $(wildcard include/config/arch/p720t.h) \
    $(wildcard include/config/sa1100/assabet.h) \
    $(wildcard include/config/sa1100/lart.h) \
    $(wildcard include/config/sa1100/graphicsclient.h) \
    $(wildcard include/config/sa1100/xp860.h) \
    $(wildcard include/config/sa1100/cerf.h) \
    $(wildcard include/config/sa1100/nanoengine.h) \
    $(wildcard include/config/sa1100/jornada720.h) \
    $(wildcard include/config/arch/edb7211.h) \
    $(wildcard include/config/sa1100/pfs168.h) \
    $(wildcard include/config/sa1100/flexanet.h) \
    $(wildcard include/config/sa1100/simpad.h) \
    $(wildcard include/config/arch/lubbock.h) \
    $(wildcard include/config/arch/clep7212.h) \
    $(wildcard include/config/sa1100/shannon.h) \
    $(wildcard include/config/sa1100/consus.h) \
    $(wildcard include/config/arch/aaed2000.h) \
    $(wildcard include/config/arch/cdb89712.h) \
    $(wildcard include/config/sa1100/graphicsmaster.h) \
    $(wildcard include/config/sa1100/adsbitsy.h) \
    $(wildcard include/config/arch/pxa/idp.h) \
    $(wildcard include/config/sa1100/pt/system3.h) \
    $(wildcard include/config/arch/autcpu12.h) \
    $(wildcard include/config/sa1100/h3100.h) \
    $(wildcard include/config/sa1100/collie.h) \
    $(wildcard include/config/sa1100/badge4.h) \
    $(wildcard include/config/arch/fortunet.h) \
    $(wildcard include/config/arch/mx1ads.h) \
    $(wildcard include/config/arch/h7201.h) \
    $(wildcard include/config/arch/h7202.h) \
    $(wildcard include/config/arch/iq80321.h) \
    $(wildcard include/config/arch/ks8695.h) \
    $(wildcard include/config/arch/smdk2410.h) \
    $(wildcard include/config/arch/ceiva.h) \
    $(wildcard include/config/mach/voiceblue.h) \
    $(wildcard include/config/arch/h5400.h) \
    $(wildcard include/config/mach/omap/innovator.h) \
    $(wildcard include/config/arch/ixdp2400.h) \
    $(wildcard include/config/arch/ixdp2800.h) \
    $(wildcard include/config/arch/ixdp425.h) \
    $(wildcard include/config/sa1100/hackkit.h) \
    $(wildcard include/config/arch/ixcdp1100.h) \
    $(wildcard include/config/arch/at91rm9200dk.h) \
    $(wildcard include/config/arch/cintegrator.h) \
    $(wildcard include/config/arch/viper.h) \
    $(wildcard include/config/arch/adi/coyote.h) \
    $(wildcard include/config/arch/ixdp2401.h) \
    $(wildcard include/config/arch/ixdp2801.h) \
    $(wildcard include/config/arch/iq31244.h) \
    $(wildcard include/config/arch/bast.h) \
    $(wildcard include/config/arch/h1940.h) \
    $(wildcard include/config/arch/enp2611.h) \
    $(wildcard include/config/arch/s3c2440.h) \
    $(wildcard include/config/arch/gumstix.h) \
    $(wildcard include/config/mach/omap/h2.h) \
    $(wildcard include/config/mach/e740.h) \
    $(wildcard include/config/arch/iq80331.h) \
    $(wildcard include/config/arch/versatile/pb.h) \
    $(wildcard include/config/mach/kev7a400.h) \
    $(wildcard include/config/mach/lpd7a400.h) \
    $(wildcard include/config/mach/lpd7a404.h) \
    $(wildcard include/config/mach/csb337.h) \
    $(wildcard include/config/mach/mainstone.h) \
    $(wildcard include/config/mach/lite300.h) \
    $(wildcard include/config/mach/xcep.h) \
    $(wildcard include/config/mach/arcom/vulcan.h) \
    $(wildcard include/config/mach/nomadik.h) \
    $(wildcard include/config/mach/corgi.h) \
    $(wildcard include/config/mach/poodle.h) \
    $(wildcard include/config/mach/armcore.h) \
    $(wildcard include/config/mach/mx31ads.h) \
    $(wildcard include/config/mach/himalaya.h) \
    $(wildcard include/config/mach/edb9312.h) \
    $(wildcard include/config/mach/omap/generic.h) \
    $(wildcard include/config/mach/edb9301.h) \
    $(wildcard include/config/mach/edb9315.h) \
    $(wildcard include/config/mach/vr1000.h) \
    $(wildcard include/config/mach/omap/perseus2.h) \
    $(wildcard include/config/mach/e800.h) \
    $(wildcard include/config/mach/e750.h) \
    $(wildcard include/config/mach/scb9328.h) \
    $(wildcard include/config/mach/omap/h3.h) \
    $(wildcard include/config/mach/omap/h4.h) \
    $(wildcard include/config/mach/omap/osk.h) \
    $(wildcard include/config/mach/tosa.h) \
    $(wildcard include/config/mach/avila.h) \
    $(wildcard include/config/mach/edb9302.h) \
    $(wildcard include/config/mach/husky.h) \
    $(wildcard include/config/mach/shepherd.h) \
    $(wildcard include/config/mach/h4700.h) \
    $(wildcard include/config/mach/rx3715.h) \
    $(wildcard include/config/mach/nslu2.h) \
    $(wildcard include/config/mach/e400.h) \
    $(wildcard include/config/mach/ixdpg425.h) \
    $(wildcard include/config/mach/versatile/ab.h) \
    $(wildcard include/config/mach/edb9307.h) \
    $(wildcard include/config/mach/kb9200.h) \
    $(wildcard include/config/mach/sx1.h) \
    $(wildcard include/config/mach/ixdp465.h) \
    $(wildcard include/config/mach/ixdp2351.h) \
    $(wildcard include/config/mach/cm4008.h) \
    $(wildcard include/config/mach/iq80332.h) \
    $(wildcard include/config/mach/gtwx5715.h) \
    $(wildcard include/config/mach/csb637.h) \
    $(wildcard include/config/mach/n30.h) \
    $(wildcard include/config/mach/nec/mp900.h) \
    $(wildcard include/config/mach/kafa.h) \
    $(wildcard include/config/mach/cm41xx.h) \
    $(wildcard include/config/mach/ts72xx.h) \
    $(wildcard include/config/mach/otom.h) \
    $(wildcard include/config/mach/nexcoder/2440.h) \
    $(wildcard include/config/mach/eco920.h) \
    $(wildcard include/config/mach/roadrunner.h) \
    $(wildcard include/config/mach/at91rm9200ek.h) \
    $(wildcard include/config/mach/spitz.h) \
    $(wildcard include/config/mach/adssphere.h) \
    $(wildcard include/config/mach/colibri.h) \
    $(wildcard include/config/mach/gateway7001.h) \
    $(wildcard include/config/mach/pcm027.h) \
    $(wildcard include/config/mach/anubis.h) \
    $(wildcard include/config/mach/akita.h) \
    $(wildcard include/config/mach/e330.h) \
    $(wildcard include/config/mach/nokia770.h) \
    $(wildcard include/config/mach/carmeva.h) \
    $(wildcard include/config/mach/edb9315a.h) \
    $(wildcard include/config/mach/stargate2.h) \
    $(wildcard include/config/mach/intelmote2.h) \
    $(wildcard include/config/mach/trizeps4.h) \
    $(wildcard include/config/mach/pnx4008.h) \
    $(wildcard include/config/mach/cpuat91.h) \
    $(wildcard include/config/mach/iq81340sc.h) \
    $(wildcard include/config/mach/iq81340mc.h) \
    $(wildcard include/config/mach/se4200.h) \
    $(wildcard include/config/mach/micro9.h) \
    $(wildcard include/config/mach/micro9l.h) \
    $(wildcard include/config/mach/omap/palmte.h) \
    $(wildcard include/config/mach/realview/eb.h) \
    $(wildcard include/config/mach/borzoi.h) \
    $(wildcard include/config/mach/palmld.h) \
    $(wildcard include/config/mach/ixdp28x5.h) \
    $(wildcard include/config/mach/omap/palmtt.h) \
    $(wildcard include/config/mach/arcom/zeus.h) \
    $(wildcard include/config/mach/osiris.h) \
    $(wildcard include/config/mach/palmte2.h) \
    $(wildcard include/config/mach/mx27ads.h) \
    $(wildcard include/config/mach/at91sam9261ek.h) \
    $(wildcard include/config/mach/loft.h) \
    $(wildcard include/config/mach/mx21ads.h) \
    $(wildcard include/config/mach/ams/delta.h) \
    $(wildcard include/config/mach/nas100d.h) \
    $(wildcard include/config/mach/magician.h) \
    $(wildcard include/config/mach/cm4002.h) \
    $(wildcard include/config/mach/nxdkn.h) \
    $(wildcard include/config/mach/palmtx.h) \
    $(wildcard include/config/mach/s3c2413.h) \
    $(wildcard include/config/mach/wg302v2.h) \
    $(wildcard include/config/mach/omap/2430sdp.h) \
    $(wildcard include/config/mach/davinci/evm.h) \
    $(wildcard include/config/mach/palmz72.h) \
    $(wildcard include/config/mach/nxdb500.h) \
    $(wildcard include/config/mach/apf9328.h) \
    $(wildcard include/config/mach/palmt5.h) \
    $(wildcard include/config/mach/palmtc.h) \
    $(wildcard include/config/mach/omap/apollon.h) \
    $(wildcard include/config/mach/ateb9200.h) \
    $(wildcard include/config/mach/n35.h) \
    $(wildcard include/config/mach/logicpd/pxa270.h) \
    $(wildcard include/config/mach/nxeb500hmi.h) \
    $(wildcard include/config/mach/espresso.h) \
    $(wildcard include/config/mach/rx1950.h) \
    $(wildcard include/config/mach/gesbc9312.h) \
    $(wildcard include/config/mach/picotux2xx.h) \
    $(wildcard include/config/mach/dsmg600.h) \
    $(wildcard include/config/mach/omap/fsample.h) \
    $(wildcard include/config/mach/snapper/cl15.h) \
    $(wildcard include/config/mach/omap/palmz71.h) \
    $(wildcard include/config/mach/smdk2412.h) \
    $(wildcard include/config/mach/smdk2413.h) \
    $(wildcard include/config/mach/aml/m5900.h) \
    $(wildcard include/config/mach/balloon3.h) \
    $(wildcard include/config/mach/ecbat91.h) \
    $(wildcard include/config/mach/onearm.h) \
    $(wildcard include/config/mach/smdk2443.h) \
    $(wildcard include/config/mach/fsg.h) \
    $(wildcard include/config/mach/at91sam9260ek.h) \
    $(wildcard include/config/mach/glantank.h) \
    $(wildcard include/config/mach/n2100.h) \
    $(wildcard include/config/mach/im42xx.h) \
    $(wildcard include/config/mach/qt2410.h) \
    $(wildcard include/config/mach/kixrp435.h) \
    $(wildcard include/config/mach/cc9p9360dev.h) \
    $(wildcard include/config/mach/edb9302a.h) \
    $(wildcard include/config/mach/edb9307a.h) \
    $(wildcard include/config/mach/omap/3430sdp.h) \
    $(wildcard include/config/mach/vstms.h) \
    $(wildcard include/config/mach/micro9m.h) \
    $(wildcard include/config/mach/bug.h) \
    $(wildcard include/config/mach/at91sam9263ek.h) \
    $(wildcard include/config/mach/em7210.h) \
    $(wildcard include/config/mach/vpac270.h) \
    $(wildcard include/config/mach/treo680.h) \
    $(wildcard include/config/mach/zylonite.h) \
    $(wildcard include/config/mach/mx31lite.h) \
    $(wildcard include/config/mach/mioa701.h) \
    $(wildcard include/config/mach/armadillo5x0.h) \
    $(wildcard include/config/mach/cc9p9360js.h) \
    $(wildcard include/config/mach/smdk6400.h) \
    $(wildcard include/config/mach/nokia/n800.h) \
    $(wildcard include/config/mach/ep80219.h) \
    $(wildcard include/config/mach/goramo/mlr.h) \
    $(wildcard include/config/mach/em/x270.h) \
    $(wildcard include/config/mach/neo1973/gta02.h) \
    $(wildcard include/config/mach/at91sam9rlek.h) \
    $(wildcard include/config/mach/colibri320.h) \
    $(wildcard include/config/mach/cam60.h) \
    $(wildcard include/config/mach/at91eb01.h) \
    $(wildcard include/config/mach/db88f5281.h) \
    $(wildcard include/config/mach/csb726.h) \
    $(wildcard include/config/mach/davinci/dm6467/evm.h) \
    $(wildcard include/config/mach/davinci/dm355/evm.h) \
    $(wildcard include/config/mach/littleton.h) \
    $(wildcard include/config/mach/im4004.h) \
    $(wildcard include/config/mach/realview/pb11mp.h) \
    $(wildcard include/config/mach/mx27/3ds.h) \
    $(wildcard include/config/mach/halibut.h) \
    $(wildcard include/config/mach/trout.h) \
    $(wildcard include/config/mach/tct/hammer.h) \
    $(wildcard include/config/mach/herald.h) \
    $(wildcard include/config/mach/sim/one.h) \
    $(wildcard include/config/mach/jive.h) \
    $(wildcard include/config/mach/sam9/l9260.h) \
    $(wildcard include/config/mach/realview/pb1176.h) \
    $(wildcard include/config/mach/yl9200.h) \
    $(wildcard include/config/mach/rd88f5182.h) \
    $(wildcard include/config/mach/kurobox/pro.h) \
    $(wildcard include/config/mach/mx31/3ds.h) \
    $(wildcard include/config/mach/qong.h) \
    $(wildcard include/config/mach/omap2evm.h) \
    $(wildcard include/config/mach/omap3evm.h) \
    $(wildcard include/config/mach/dns323.h) \
    $(wildcard include/config/mach/omap3/beagle.h) \
    $(wildcard include/config/mach/nokia/n810.h) \
    $(wildcard include/config/mach/pcm038.h) \
    $(wildcard include/config/mach/sg310.h) \
    $(wildcard include/config/mach/ts209.h) \
    $(wildcard include/config/mach/at91cap9adk.h) \
    $(wildcard include/config/mach/mx31moboard.h) \
    $(wildcard include/config/mach/vision/ep9307.h) \
    $(wildcard include/config/mach/terastation/pro2.h) \
    $(wildcard include/config/mach/linkstation/pro.h) \
    $(wildcard include/config/mach/e350.h) \
    $(wildcard include/config/mach/ts409.h) \
    $(wildcard include/config/mach/rsi/ews.h) \
    $(wildcard include/config/mach/cm/x300.h) \
    $(wildcard include/config/mach/at91sam9g20ek.h) \
    $(wildcard include/config/mach/smdk6410.h) \
    $(wildcard include/config/mach/u300.h) \
    $(wildcard include/config/mach/wrt350n/v2.h) \
    $(wildcard include/config/mach/omap/ldp.h) \
    $(wildcard include/config/mach/mx35/3ds.h) \
    $(wildcard include/config/mach/neuros/osd2.h) \
    $(wildcard include/config/mach/trizeps4wl.h) \
    $(wildcard include/config/mach/ts78xx.h) \
    $(wildcard include/config/mach/sffsdr.h) \
    $(wildcard include/config/mach/pcm037.h) \
    $(wildcard include/config/mach/db88f6281/bp.h) \
    $(wildcard include/config/mach/rd88f6192/nas.h) \
    $(wildcard include/config/mach/rd88f6281.h) \
    $(wildcard include/config/mach/db78x00/bp.h) \
    $(wildcard include/config/mach/smdk2416.h) \
    $(wildcard include/config/mach/wbd111.h) \
    $(wildcard include/config/mach/mv2120.h) \
    $(wildcard include/config/mach/mx51/3ds.h) \
    $(wildcard include/config/mach/imx27lite.h) \
    $(wildcard include/config/mach/usb/a9260.h) \
    $(wildcard include/config/mach/usb/a9263.h) \
    $(wildcard include/config/mach/qil/a9260.h) \
    $(wildcard include/config/mach/kzm/arm11/01.h) \
    $(wildcard include/config/mach/nokia/n810/wimax.h) \
    $(wildcard include/config/mach/sapphire.h) \
    $(wildcard include/config/mach/stmp37xx.h) \
    $(wildcard include/config/mach/stmp378x.h) \
    $(wildcard include/config/mach/ezx/a780.h) \
    $(wildcard include/config/mach/ezx/e680.h) \
    $(wildcard include/config/mach/ezx/a1200.h) \
    $(wildcard include/config/mach/ezx/e6.h) \
    $(wildcard include/config/mach/ezx/e2.h) \
    $(wildcard include/config/mach/ezx/a910.h) \
    $(wildcard include/config/mach/edmini/v2.h) \
    $(wildcard include/config/mach/zipit2.h) \
    $(wildcard include/config/mach/omap3/pandora.h) \
    $(wildcard include/config/mach/mss2.h) \
    $(wildcard include/config/mach/lb88rc8480.h) \
    $(wildcard include/config/mach/mx25/3ds.h) \
    $(wildcard include/config/mach/omap3530/lv/som.h) \
    $(wildcard include/config/mach/davinci/da830/evm.h) \
    $(wildcard include/config/mach/dove/db.h) \
    $(wildcard include/config/mach/overo.h) \
    $(wildcard include/config/mach/at2440evb.h) \
    $(wildcard include/config/mach/neocore926.h) \
    $(wildcard include/config/mach/wnr854t.h) \
    $(wildcard include/config/mach/rd88f5181l/ge.h) \
    $(wildcard include/config/mach/rd88f5181l/fxo.h) \
    $(wildcard include/config/mach/stamp9g20.h) \
    $(wildcard include/config/mach/smdkc100.h) \
    $(wildcard include/config/mach/tavorevb.h) \
    $(wildcard include/config/mach/saar.h) \
    $(wildcard include/config/mach/at91sam9m10g45ek.h) \
    $(wildcard include/config/mach/usb/a9g20.h) \
    $(wildcard include/config/mach/mxlads.h) \
    $(wildcard include/config/mach/linkstation/mini.h) \
    $(wildcard include/config/mach/afeb9260.h) \
    $(wildcard include/config/mach/imx27ipcam.h) \
    $(wildcard include/config/mach/rd88f6183ap/ge.h) \
    $(wildcard include/config/mach/realview/pba8.h) \
    $(wildcard include/config/mach/realview/pbx.h) \
    $(wildcard include/config/mach/micro9s.h) \
    $(wildcard include/config/mach/rut100.h) \
    $(wildcard include/config/mach/g3evm.h) \
    $(wildcard include/config/mach/w90p910evb.h) \
    $(wildcard include/config/mach/w90p950evb.h) \
    $(wildcard include/config/mach/w90n960evb.h) \
    $(wildcard include/config/mach/mv88f6281gtw/ge.h) \
    $(wildcard include/config/mach/ncp.h) \
    $(wildcard include/config/mach/davinci/dm365/evm.h) \
    $(wildcard include/config/mach/centro.h) \
    $(wildcard include/config/mach/nokia/rx51.h) \
    $(wildcard include/config/mach/omap/zoom2.h) \
    $(wildcard include/config/mach/cpuat9260.h) \
    $(wildcard include/config/mach/eukrea/cpuimx27.h) \
    $(wildcard include/config/mach/acs5k.h) \
    $(wildcard include/config/mach/snapper/9260.h) \
    $(wildcard include/config/mach/dsm320.h) \
    $(wildcard include/config/mach/exeda.h) \
    $(wildcard include/config/mach/mini2440.h) \
    $(wildcard include/config/mach/colibri300.h) \
    $(wildcard include/config/mach/linkstation/ls/hgl.h) \
    $(wildcard include/config/mach/cpuat9g20.h) \
    $(wildcard include/config/mach/smdk6440.h) \
    $(wildcard include/config/mach/nas4220b.h) \
    $(wildcard include/config/mach/zylonite2.h) \
    $(wildcard include/config/mach/aspenite.h) \
    $(wildcard include/config/mach/ttc/dkb.h) \
    $(wildcard include/config/mach/pcm043.h) \
    $(wildcard include/config/mach/sheevaplug.h) \
    $(wildcard include/config/mach/avengers/lite.h) \
    $(wildcard include/config/mach/mx51/babbage.h) \
    $(wildcard include/config/mach/rd78x00/masa.h) \
    $(wildcard include/config/mach/dm355/leopard.h) \
    $(wildcard include/config/mach/ts219.h) \
    $(wildcard include/config/mach/pca100.h) \
    $(wildcard include/config/mach/davinci/da850/evm.h) \
    $(wildcard include/config/mach/at91sam9g10ek.h) \
    $(wildcard include/config/mach/omap/4430sdp.h) \
    $(wildcard include/config/mach/magx/zn5.h) \
    $(wildcard include/config/mach/omap3/torpedo.h) \
    $(wildcard include/config/mach/anw6410.h) \
    $(wildcard include/config/mach/imx27/visstrim/m10.h) \
    $(wildcard include/config/mach/portuxg20.h) \
    $(wildcard include/config/mach/smdkc110.h) \
    $(wildcard include/config/mach/omap3517evm.h) \
    $(wildcard include/config/mach/netspace/v2.h) \
    $(wildcard include/config/mach/netspace/max/v2.h) \
    $(wildcard include/config/mach/d2net/v2.h) \
    $(wildcard include/config/mach/net2big/v2.h) \
    $(wildcard include/config/mach/net5big/v2.h) \
    $(wildcard include/config/mach/inetspace/v2.h) \
    $(wildcard include/config/mach/at91sam9g45ekes.h) \
    $(wildcard include/config/mach/spear600.h) \
    $(wildcard include/config/mach/spear300.h) \
    $(wildcard include/config/mach/lilly1131.h) \
    $(wildcard include/config/mach/hmt.h) \
    $(wildcard include/config/mach/vexpress.h) \
    $(wildcard include/config/mach/d2net.h) \
    $(wildcard include/config/mach/bigdisk.h) \
    $(wildcard include/config/mach/at91sam9g20ek/2mmc.h) \
    $(wildcard include/config/mach/bcmring.h) \
    $(wildcard include/config/mach/mahimahi.h) \
    $(wildcard include/config/mach/smdk6442.h) \
    $(wildcard include/config/mach/openrd/base.h) \
    $(wildcard include/config/mach/devkit8000.h) \
    $(wildcard include/config/mach/mx51/efikamx.h) \
    $(wildcard include/config/mach/cm/t35.h) \
    $(wildcard include/config/mach/net2big.h) \
    $(wildcard include/config/mach/igep0020.h) \
    $(wildcard include/config/mach/nuc932evb.h) \
    $(wildcard include/config/mach/openrd/client.h) \
    $(wildcard include/config/mach/u8500.h) \
    $(wildcard include/config/mach/mx51/efikasb.h) \
    $(wildcard include/config/mach/marvell/jasper.h) \
    $(wildcard include/config/mach/flint.h) \
    $(wildcard include/config/mach/tavorevb3.h) \
    $(wildcard include/config/mach/touchbook.h) \
    $(wildcard include/config/mach/raumfeld/rc.h) \
    $(wildcard include/config/mach/raumfeld/connector.h) \
    $(wildcard include/config/mach/raumfeld/speaker.h) \
    $(wildcard include/config/mach/tnetv107x.h) \
    $(wildcard include/config/mach/smdkv210.h) \
    $(wildcard include/config/mach/omap/zoom3.h) \
    $(wildcard include/config/mach/omap/3630sdp.h) \
    $(wildcard include/config/mach/smartq7.h) \
    $(wildcard include/config/mach/g4evm.h) \
    $(wildcard include/config/mach/omapl138/hawkboard.h) \
    $(wildcard include/config/mach/ts41x.h) \
    $(wildcard include/config/mach/phy3250.h) \
    $(wildcard include/config/mach/mini6410.h) \
    $(wildcard include/config/mach/mx28evk.h) \
    $(wildcard include/config/mach/smartq5.h) \
    $(wildcard include/config/mach/davinci/dm6467tevm.h) \
    $(wildcard include/config/mach/mxt/td60.h) \
    $(wildcard include/config/mach/capc7117.h) \
    $(wildcard include/config/mach/icontrol.h) \
    $(wildcard include/config/mach/gplugd.h) \
    $(wildcard include/config/mach/qsd8x50a/st1/5.h) \
    $(wildcard include/config/mach/mx23evk.h) \
    $(wildcard include/config/mach/ap4evb.h) \
    $(wildcard include/config/mach/mityomapl138.h) \
    $(wildcard include/config/mach/guruplug.h) \
    $(wildcard include/config/mach/spear310.h) \
    $(wildcard include/config/mach/spear320.h) \
    $(wildcard include/config/mach/aquila.h) \
    $(wildcard include/config/mach/esata/sheevaplug.h) \
    $(wildcard include/config/mach/msm7x30/surf.h) \
    $(wildcard include/config/mach/terastation/wxl.h) \
    $(wildcard include/config/mach/msm7x25/surf.h) \
    $(wildcard include/config/mach/msm7x25/ffa.h) \
    $(wildcard include/config/mach/msm7x27/surf.h) \
    $(wildcard include/config/mach/msm7x27/ffa.h) \
    $(wildcard include/config/mach/msm7x30/ffa.h) \
    $(wildcard include/config/mach/qsd8x50/surf.h) \
    $(wildcard include/config/mach/mx53/evk.h) \
    $(wildcard include/config/mach/igep0030.h) \
    $(wildcard include/config/mach/sbc3530.h) \
    $(wildcard include/config/mach/saarb.h) \
    $(wildcard include/config/mach/harmony.h) \
    $(wildcard include/config/mach/msm7x30/fluid.h) \
    $(wildcard include/config/mach/cm/t3517.h) \
    $(wildcard include/config/mach/wbd222.h) \
    $(wildcard include/config/mach/msm8x60/surf.h) \
    $(wildcard include/config/mach/msm8x60/sim.h) \
    $(wildcard include/config/mach/tcc8000/sdk.h) \
    $(wildcard include/config/mach/cns3420vb.h) \
    $(wildcard include/config/mach/omap4/panda.h) \
    $(wildcard include/config/mach/ti8168evm.h) \
    $(wildcard include/config/mach/teton/bga.h) \
    $(wildcard include/config/mach/eukrea/cpuimx25sd.h) \
    $(wildcard include/config/mach/eukrea/cpuimx35sd.h) \
    $(wildcard include/config/mach/eukrea/cpuimx51sd.h) \
    $(wildcard include/config/mach/eukrea/cpuimx51.h) \
    $(wildcard include/config/mach/smdkc210.h) \
    $(wildcard include/config/mach/t5325.h) \
    $(wildcard include/config/mach/income.h) \
    $(wildcard include/config/mach/meson.h) \
    $(wildcard include/config/mach/goni.h) \
    $(wildcard include/config/mach/bv07.h) \
    $(wildcard include/config/mach/openrd/ultimate.h) \
    $(wildcard include/config/mach/devixp.h) \
    $(wildcard include/config/mach/miccpt.h) \
    $(wildcard include/config/mach/mic256.h) \
    $(wildcard include/config/mach/u5500.h) \
    $(wildcard include/config/mach/linkstation/lschl.h) \
    $(wildcard include/config/mach/smdkv310.h) \
    $(wildcard include/config/mach/wm8505/7in/netbook.h) \
    $(wildcard include/config/mach/craneboard.h) \
    $(wildcard include/config/mach/smdk6450.h) \
    $(wildcard include/config/mach/brownstone.h) \
    $(wildcard include/config/mach/flexibity.h) \
    $(wildcard include/config/mach/mx50/rdp.h) \
    $(wildcard include/config/mach/universal/c210.h) \
    $(wildcard include/config/mach/real6410.h) \
    $(wildcard include/config/mach/dockstar.h) \
    $(wildcard include/config/mach/ti8148evm.h) \
    $(wildcard include/config/mach/seaboard.h) \
    $(wildcard include/config/mach/mx53/ard.h) \
    $(wildcard include/config/mach/mx53/smd.h) \
    $(wildcard include/config/mach/msm8x60/rumi3.h) \
    $(wildcard include/config/mach/msm8x60/ffa.h) \
    $(wildcard include/config/mach/cm/a510.h) \
    $(wildcard include/config/mach/tx28.h) \
    $(wildcard include/config/mach/pcontrol/g20.h) \
    $(wildcard include/config/mach/vpr200.h) \
    $(wildcard include/config/mach/torbreck.h) \
    $(wildcard include/config/mach/prima2/evb.h) \
    $(wildcard include/config/mach/paz00.h) \
    $(wildcard include/config/mach/acmenetusfoxg20.h) \
    $(wildcard include/config/mach/ag5evm.h) \
    $(wildcard include/config/mach/wlf/cragg/6410.h) \
    $(wildcard include/config/mach/trimslice.h) \
    $(wildcard include/config/mach/mackerel.h) \
    $(wildcard include/config/mach/kaen.h) \
    $(wildcard include/config/mach/nokia/rm680.h) \
    $(wildcard include/config/mach/msm8960/sim.h) \
    $(wildcard include/config/mach/msm8960/rumi3.h) \
    $(wildcard include/config/mach/gsia18s.h) \
    $(wildcard include/config/mach/mx53/loco.h) \
    $(wildcard include/config/mach/wario.h) \
    $(wildcard include/config/mach/cm/t3730.h) \
    $(wildcard include/config/mach/hrefv60.h) \
    $(wildcard include/config/mach/armlex4210.h) \
    $(wildcard include/config/mach/snowball.h) \
    $(wildcard include/config/mach/xilinx/ep107.h) \
    $(wildcard include/config/mach/nuri.h) \
    $(wildcard include/config/mach/origen.h) \
    $(wildcard include/config/mach/xarina.h) \
    $(wildcard include/config/mach/nspire.h) \
    $(wildcard include/config/mach/nokia/rm696.h) \
    $(wildcard include/config/mach/m28evk.h) \
    $(wildcard include/config/mach/kota2.h) \
    $(wildcard include/config/mach/bonito.h) \
    $(wildcard include/config/mach/smdk4212.h) \
    $(wildcard include/config/mach/apx4devkit.h) \
    $(wildcard include/config/mach/smdk4412.h) \
    $(wildcard include/config/mach/marzen.h) \
    $(wildcard include/config/mach/empc/a500.h) \
    $(wildcard include/config/mach/u8520.h) \
    $(wildcard include/config/mach/urt.h) \
    $(wildcard include/config/mach/keystone.h) \
    $(wildcard include/config/mach/ckb/rza1h.h) \
    $(wildcard include/config/mach/bcm2835.h) \
    $(wildcard include/config/mach/cm/3g.h) \
    $(wildcard include/config/mach/empc/aimx6.h) \
    $(wildcard include/config/mach/diyefis6410.h) \
    $(wildcard include/config/mach/mx53/turing.h) \
    $(wildcard include/config/mach/mx6dl/turing.h) \
    $(wildcard include/config/mach/mx53/indash.h) \
    $(wildcard include/config/mach/mx6q/indash.h) \
    $(wildcard include/config/mach/mx6dl/indash.h) \
    $(wildcard include/config/mach/rts/g6.h) \
    $(wildcard include/config/mach/ka/titan.h) \
    $(wildcard include/config/mach/cl/som/imx7.h) \
    $(wildcard include/config/mach/vvdn/mgsi/vsis.h) \
    $(wildcard include/config/mach/mx6q/nano.h) \
    $(wildcard include/config/mach/pdu001.h) \
    $(wildcard include/config/mach/cab/proyk.h) \
    $(wildcard include/config/mach/klin.h) \
    $(wildcard include/config/mach/enman/steuerbox.h) \
    $(wildcard include/config/mach/ls/stingray.h) \
    $(wildcard include/config/mach/ipdu.h) \
    $(wildcard include/config/mach/linda.h) \
    $(wildcard include/config/mach/mx6q/openrex.h) \
    $(wildcard include/config/mach/on100.h) \
    $(wildcard include/config/mach/eminds/rtu12.h) \
    $(wildcard include/config/mach/eminds/avl10.h) \
    $(wildcard include/config/mach/main/plc/lme.h) \
    $(wildcard include/config/mach/mspx.h) \
    $(wildcard include/config/mach/cgw/300.h) \
    $(wildcard include/config/mach/mx7d/cicada.h) \
    $(wildcard include/config/mach/virt2real/dm365.h) \
    $(wildcard include/config/mach/dm365/virt2real.h) \
    $(wildcard include/config/mach/h6073.h) \
    $(wildcard include/config/mach/gtgateway.h) \
    $(wildcard include/config/mach/xarina/standard.h) \
    $(wildcard include/config/mach/novasoms.h) \
    $(wildcard include/config/mach/novasomp.h) \
    $(wildcard include/config/mach/novasomu.h) \
    $(wildcard include/config/mach/mx6q/mpbd.h) \
    $(wildcard include/config/mach/ncr/1930.h) \
    $(wildcard include/config/mach/uap301.h) \
    $(wildcard include/config/mach/urt02.h) \
    $(wildcard include/config/mach/atc8.h) \
    $(wildcard include/config/mach/iot/gateway.h) \
    $(wildcard include/config/mach/hsm/phoenix.h) \
    $(wildcard include/config/mach/missouri.h) \
    $(wildcard include/config/mach/remarkable.h) \
    $(wildcard include/config/mach/fa0113.h) \
    $(wildcard include/config/mach/innova/statnettawm.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/xen/hypervisor.h \
  /home/edgar/kernel-caninos/linux/include/xen/arm/hypervisor.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/prom.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/mach/arch.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/mach/irq.h \
  /home/edgar/kernel-caninos/linux/include/linux/irq.h \
    $(wildcard include/config/generic/irq/effective/aff/mask.h) \
    $(wildcard include/config/generic/irq/ipi.h) \
    $(wildcard include/config/irq/domain/hierarchy.h) \
    $(wildcard include/config/generic/irq/migration.h) \
    $(wildcard include/config/generic/pending/irq.h) \
    $(wildcard include/config/hardirqs/sw/resend.h) \
    $(wildcard include/config/generic/irq/legacy/alloc/hwirq.h) \
    $(wildcard include/config/generic/irq/legacy.h) \
  /home/edgar/kernel-caninos/linux/include/linux/irqhandler.h \
  /home/edgar/kernel-caninos/linux/include/linux/io.h \
  /home/edgar/kernel-caninos/linux/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
  /home/edgar/kernel-caninos/linux/include/linux/kmemleak.h \
  /home/edgar/kernel-caninos/linux/include/linux/kasan.h \
  arch/arm/include/generated/asm/irq_regs.h \
  /home/edgar/kernel-caninos/linux/include/asm-generic/irq_regs.h \
  /home/edgar/kernel-caninos/linux/include/linux/irqdesc.h \
    $(wildcard include/config/irq/preflow/fasteoi.h) \
    $(wildcard include/config/generic/irq/debugfs.h) \
    $(wildcard include/config/handle/domain/irq.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/hw_irq.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/mach/time.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/system_info.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/system_misc.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/traps.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/unwind.h \
    $(wildcard include/config/arm/unwind.h) \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/memblock.h \
  /home/edgar/kernel-caninos/linux/arch/arm/include/asm/virt.h \
  /home/edgar/kernel-caninos/linux/arch/arm/kernel/atags.h \
    $(wildcard include/config/atags.h) \

arch/arm/kernel/setup.o: $(deps_arch/arm/kernel/setup.o)

$(deps_arch/arm/kernel/setup.o):
