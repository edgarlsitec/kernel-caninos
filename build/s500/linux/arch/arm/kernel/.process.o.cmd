cmd_arch/arm/kernel/process.o := arm-linux-gnueabihf-gcc -Wp,-MD,arch/arm/kernel/.process.o.d  -nostdinc -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include -I./arch/arm/include/generated  -I/home/edgar/repo/kernel-caninos/linux/include -I./include -I/home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi -I./arch/arm/include/generated/uapi -I/home/edgar/repo/kernel-caninos/linux/include/uapi -I./include/generated/uapi -include /home/edgar/repo/kernel-caninos/linux/include/linux/kconfig.h  -I/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel -Iarch/arm/kernel -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time    -DKBUILD_BASENAME='"process"'  -DKBUILD_MODNAME='"process"' -c -o arch/arm/kernel/.tmp_process.o /home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/process.c

source_arch/arm/kernel/process.o := /home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/process.c

deps_arch/arm/kernel/process.o := \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/pl310/errata/769419.h) \
    $(wildcard include/config/cpu/v7m.h) \
    $(wildcard include/config/cpu/sw/domain/pan.h) \
    $(wildcard include/config/cpu/cp15.h) \
    $(wildcard include/config/cpu/cp15/mmu.h) \
    $(wildcard include/config/cpu/use/domains.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/kuser/helpers.h) \
  /usr/lib/gcc/arm-linux-gnueabihf/4.9/include/stdarg.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched.h \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/preempt/notifiers.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/kasan.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/uprobes.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/preempt.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/sched.h \
  arch/arm/include/generated/asm/current.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/current.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/thread_info.h \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/debug/kmemleak.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/bug.h \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/linkage.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stringify.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/linkage.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/swab.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/swab.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arm/heavy/mb.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/barrier.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/swab.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/swab.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/bitops.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/bitops.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/irqflags.h \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/typecheck.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/irqflags.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/ptrace.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/restart_block.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/glue.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/pgtable-2level-types.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/sizes.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pfn.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/getorder.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pid.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rculist.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/atomic.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/prefetch.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/binfmt/elf/fdpic.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/hw_breakpoint.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/cmpxchg-local.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/atomic-long.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/preempt.h \
  arch/arm/include/generated/asm/preempt.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/preempt.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/bottom_half.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/bitmap.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/string.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/string.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rcutree.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sem.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/time64.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/time.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/sem.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ipc.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/spinlock_types.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/spinlock_types.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rwlock_types.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/spinlock.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rwlock.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/spinlock_api_smp.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/rwlock_api_smp.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/highuid.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rhashtable.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/err.h \
  arch/arm/include/generated/uapi/asm/errno.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/errno.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/errno-base.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/errno.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/errno.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/jhash.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/unaligned/packed_struct.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/list_nulls.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ktime.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/seqlock.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/time32.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/jiffies.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/timex.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/timex.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/param.h \
  arch/arm/include/generated/uapi/asm/param.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/param.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/timex.h \
  include/generated/timeconst.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/timekeeping.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/timekeeping32.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/osq_lock.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/ipc.h \
  arch/arm/include/generated/uapi/asm/ipcbuf.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/ipcbuf.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  arch/arm/include/generated/uapi/asm/sembuf.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/sembuf.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/shm.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/shm.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm/include/generated/uapi/asm/shmbuf.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/shmbuf.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/shmparam.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kcov.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/kcov.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rbtree.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/smp.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/percpu.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/percpu.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
    $(wildcard include/config/virtualization.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/timerqueue.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/seccomp.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/nodemask.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/resource.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/resource.h \
  arch/arm/include/generated/uapi/asm/resource.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/resource.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/resource.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/latencytop.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/prio.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/signal.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/signal.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/signal.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/signal-defs.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/uapi/asm/siginfo.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/siginfo.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mm_types_task.h \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/debug.h \
    $(wildcard include/config/sched/debug.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/task.h \
    $(wildcard include/config/have/copy/thread/tls.h) \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/task_stack.h \
    $(wildcard include/config/stack/growsup.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/magic.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mm.h \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/x86/intel/memory/protection/keys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/device/public.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/have/memblock.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/gfp.h \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/wait.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/wait.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/page-flags-layout.h \
  include/generated/bounds.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/notifier.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  arch/arm/include/generated/asm/rwsem.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/rwsem.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rcu_segcblist.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/srcutree.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/completion.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/arch_topology.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/topology.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mm_types.h \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/hmm.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/auxvec.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/auxvec.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/auxvec.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/auxvec.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/uprobes.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
    $(wildcard include/config/vdso.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/range.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/percpu-refcount.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/bit_spinlock.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/shrinker.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/page_ext.h \
    $(wildcard include/config/idle/page/tracking.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stackdepot.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/tracepoint-defs.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/static_key.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/memremap.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ioport.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/proc-fns.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/glue-proc.h \
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
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/pgtable-nopud.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/pgtable-nop4d-hack.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/5level-fixup.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/pgtable-hwdef.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/tlbflush.h \
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
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/pgtable-2level.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/pgtable.h \
    $(wildcard include/config/pgtable/levels.h) \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/huge_mm.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/migration.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/wait_bit.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kdev_t.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/kdev_t.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/dcache.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rculist_bl.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/list_bl.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/path.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/stat.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/stat.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/stat.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/list_lru.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/capability.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/capability.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/semaphore.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/fcntl.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/fcntl.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/fcntl.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/fcntl.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/fiemap.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/migrate_mode.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/percpu-rwsem.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rcuwait.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/rcu_sync.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/delayed_call.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/uuid.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/uuid.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/errseq.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/fs.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/limits.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/ioctl.h \
  arch/arm/include/generated/uapi/asm/ioctl.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/ioctl.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/ioctl.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/percpu_counter.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/dqblk_xfs.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/dqblk_v1.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/dqblk_v2.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/dqblk_qtree.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/projid.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/quota.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/nfs_fs_i.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/unistd.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/unistd.h \
  arch/arm/include/generated/uapi/asm/unistd-eabi.h \
  arch/arm/include/generated/uapi/asm/unistd-common.h \
  arch/arm/include/generated/asm/unistd-nr.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/user.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/user.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/irq/timings.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/irqreturn.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/irqnr.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/irqnr.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/hardirq.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/hardirq.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/multi/irq/handler.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/irq_cpustat.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kref.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/sections.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/sections.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kallsyms.h \
    $(wildcard include/config/kallsyms.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/elfcore.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/elf.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/vdso_datapage.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/elfcore.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/signal.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ptrace.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/jobctl.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/keys.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/key.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sysctl.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/sysctl.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/net.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pid_namespace.h \
    $(wildcard include/config/pid/ns.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/nsproxy.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ns_common.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/idr.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/ptrace.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/elf.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/elf.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/elf-em.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/tick.h \
    $(wildcard include/config/generic/clockevents.h) \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/tick/oneshot.h) \
    $(wildcard include/config/generic/clockevents/broadcast.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/clockchips.h \
    $(wildcard include/config/arch/has/tick/broadcast.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/clocksource.h \
    $(wildcard include/config/arch/clocksource/data.h) \
    $(wildcard include/config/clocksource/watchdog.h) \
    $(wildcard include/config/timer/probe.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/of.h \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/promtree.h) \
    $(wildcard include/config/of/kobj.h) \
    $(wildcard include/config/of.h) \
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
  /home/edgar/repo/kernel-caninos/linux/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/sysfs.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kobject_ns.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/mod_devicetable.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/property.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/fwnode.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/io.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/edgar/repo/kernel-caninos/linux/include/xen/xen.h \
    $(wildcard include/config/xen.h) \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/vmalloc.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/clocksource.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/utsname.h \
    $(wildcard include/config/uts/ns.h) \
    $(wildcard include/config/proc/sysctl.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/utsname.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/uaccess.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kasan-checks.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/uaccess.h \
    $(wildcard include/config/uaccess/with/memcpy.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
  arch/arm/include/generated/asm/extable.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/extable.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/random.h \
    $(wildcard include/config/gcc/plugin/latent/entropy.h) \
    $(wildcard include/config/arch/random.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/once.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/random.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/hw_breakpoint.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/perf_event.h \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/function/tracer.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cpu/sup/intel.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/perf_event.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/bpf_perf_event.h \
  arch/arm/include/generated/uapi/asm/bpf_perf_event.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/asm-generic/bpf_perf_event.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ftrace.h \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/dynamic/ftrace/with/regs.h) \
    $(wildcard include/config/stack/tracer.h) \
    $(wildcard include/config/frame/pointer.h) \
    $(wildcard include/config/preemptirq/events.h) \
    $(wildcard include/config/function/profiler.h) \
    $(wildcard include/config/ftrace/syscalls.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/trace_clock.h \
  arch/arm/include/generated/asm/trace_clock.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/trace_clock.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/ftrace.h \
    $(wildcard include/config/old/mcount.h) \
    $(wildcard include/config/arm/unwind.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cpu.h \
    $(wildcard include/config/pm/sleep/smp.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/node.h \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/klist.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pinctrl/devinfo.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/ratelimit.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/arm/dma/use/iommu.h) \
    $(wildcard include/config/arch/omap.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/pm_wakeup.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cpuhotplug.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/irq_work.h \
    $(wildcard include/config/irq/work.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/irq_work.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/smp_plat.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/cpu.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/cputype.h \
    $(wildcard include/config/cpu/pj4.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/jump_label_ratelimit.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/perf_regs.h \
    $(wildcard include/config/have/perf/regs.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi/asm/perf_regs.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cgroup.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/sock/cgroup/data.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/cgroup/data.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/cgroupstats.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/taskstats.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/seq_file.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/user_namespace.h \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/persistent/keyrings.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/kernel_stat.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/cgroup-defs.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/u64_stats_sync.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/bpf-cgroup.h \
    $(wildcard include/config/cgroup/bpf.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/bpf.h \
    $(wildcard include/config/efficient/unaligned/access.h) \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/bpf_common.h \
  arch/arm/include/generated/asm/local.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/local.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/hw_breakpoint.h \
    $(wildcard include/config/have/mixed/breakpoints/regs.h) \
  /home/edgar/repo/kernel-caninos/linux/include/linux/leds.h \
    $(wildcard include/config/leds/triggers.h) \
    $(wildcard include/config/leds/brightness/hw/changed.h) \
    $(wildcard include/config/leds/trigger/disk.h) \
    $(wildcard include/config/leds/trigger/mtd.h) \
    $(wildcard include/config/leds/trigger/camera.h) \
    $(wildcard include/config/new/leds.h) \
    $(wildcard include/config/leds/trigger/cpu.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/thread_notify.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/stacktrace.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/system_misc.h \
  /home/edgar/repo/kernel-caninos/linux/include/linux/reboot.h \
  /home/edgar/repo/kernel-caninos/linux/include/uapi/linux/reboot.h \
  arch/arm/include/generated/asm/emergency-restart.h \
  /home/edgar/repo/kernel-caninos/linux/include/asm-generic/emergency-restart.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/mach/time.h \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/tls.h \
    $(wildcard include/config/tls/reg/emul.h) \
  /home/edgar/repo/kernel-caninos/linux/arch/arm/include/asm/vdso.h \

arch/arm/kernel/process.o: $(deps_arch/arm/kernel/process.o)

$(deps_arch/arm/kernel/process.o):
