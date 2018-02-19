	.arch armv7-a
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"asm-offsets.c"
@ GNU C11 (Debian 6.3.0-18) version 6.3.0 20170516 (arm-linux-gnueabihf)
@	compiled by GNU C version 6.3.0 20170516, GMP version 6.1.2, MPFR version 3.1.5, MPC version 1.0.3, isl version 0.15
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc -I include
@ -I /home/edgar/kernel-caninos/uboot/include
@ -I /home/edgar/kernel-caninos/uboot/arch/arm/include
@ -I /home/edgar/kernel-caninos/uboot/. -I . -imultilib .
@ -imultiarch arm-linux-gnueabihf -D __KERNEL__ -D __UBOOT__
@ -D CONFIG_SYS_TEXT_BASE=0x08000040 -D __ARM__ -D DO_DEPS_ONLY
@ -D KBUILD_STR(s)=#s -D KBUILD_BASENAME=KBUILD_STR(asm_offsets)
@ -D KBUILD_MODNAME=KBUILD_STR(asm_offsets)
@ -isystem /usr/lib/gcc-cross/arm-linux-gnueabihf/6/include
@ -include /home/edgar/kernel-caninos/uboot/include/linux/kconfig.h
@ -MD arch/arm/lib/.asm-offsets.s.d
@ /home/edgar/kernel-caninos/uboot/arch/arm/lib/asm-offsets.c -marm
@ -mno-thumb-interwork -mabi=aapcs-linux -mword-relocations
@ -mno-unaligned-access -mfloat-abi=soft -march=armv7-a -mfpu=vfpv3-d16
@ -mtls-dialect=gnu -auxbase-strip arch/arm/lib/asm-offsets.s -g -Os -Wall
@ -Wstrict-prototypes -Wno-format-security -Wno-format-nonliteral
@ -fno-builtin -ffreestanding -fno-stack-protector -fstack-usage
@ -ffunction-sections -fdata-sections -fno-common -ffixed-r9 -fverbose-asm
@ options enabled:  -fPIC -fPIE -faggressive-loop-optimizations
@ -falign-jumps -falign-labels -falign-loops -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
@ -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
@ -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
@ -fchkp-use-static-bounds -fchkp-use-static-const-bounds
@ -fchkp-use-wrappers -fcombine-stack-adjustments -fcompare-elim
@ -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdata-sections
@ -fdefer-pop -fdelete-null-pointer-checks -fdevirtualize
@ -fdevirtualize-speculatively -fdwarf2-cfi-asm -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -ffunction-sections -fgcse -fgcse-lm
@ -fgnu-runtime -fgnu-unique -fguess-branch-probability
@ -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
@ -findirect-inlining -finline -finline-atomics -finline-functions
@ -finline-functions-called-once -finline-small-functions -fipa-cp
@ -fipa-cp-alignment -fipa-icf -fipa-icf-functions -fipa-icf-variables
@ -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -fpartial-inlining -fpeephole -fpeephole2 -fplt -fprefetch-loop-arrays
@ -freg-struct-return -freorder-blocks -freorder-functions
@ -frerun-cse-after-loop -fsched-critical-path-heuristic
@ -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
@ -fsched-last-insn-heuristic -fsched-pressure -fsched-rank-heuristic
@ -fsched-spec -fsched-spec-insn-heuristic -fsched-stalled-insns-dep
@ -fschedule-insns2 -fsection-anchors -fsemantic-interposition
@ -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fssa-backprop -fssa-phiopt -fstdarg-opt
@ -fstrict-aliasing -fstrict-overflow -fstrict-volatile-bitfields
@ -fsync-libcalls -fthread-jumps -ftoplevel-reorder -ftrapping-math
@ -ftree-bit-ccp -ftree-builtin-call-dce -ftree-ccp -ftree-ch
@ -ftree-coalesce-vars -ftree-copy-prop -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -fvar-tracking -fvar-tracking-assignments
@ -fverbose-asm -fzero-initialized-in-bss -marm -mglibc -mlittle-endian
@ -mpic-data-is-text-relative -msched-prolog -mvectorize-with-neon-quad
@ -mword-relocations

	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.startup.main,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
.LFB184:
	.file 1 "/home/edgar/kernel-caninos/uboot/arch/arm/lib/asm-offsets.c"
	.loc 1 24 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 202 0
	mov	r0, #0	@,
	bx	lr	@
	.cfi_endproc
.LFE184:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/home/edgar/kernel-caninos/uboot/include/common.h"
	.file 3 "/home/edgar/kernel-caninos/uboot/arch/arm/include/asm/types.h"
	.file 4 "/home/edgar/kernel-caninos/uboot/include/linux/types.h"
	.file 5 "/home/edgar/kernel-caninos/uboot/include/linux/string.h"
	.file 6 "/home/edgar/kernel-caninos/uboot/include/ide.h"
	.file 7 "/home/edgar/kernel-caninos/uboot/include/lmb.h"
	.file 8 "/home/edgar/kernel-caninos/uboot/include/asm-generic/u-boot.h"
	.file 9 "/home/edgar/kernel-caninos/uboot/include/fdt.h"
	.file 10 "/home/edgar/kernel-caninos/uboot/include/libfdt_env.h"
	.file 11 "/home/edgar/kernel-caninos/uboot/include/image.h"
	.file 12 "/home/edgar/kernel-caninos/uboot/include/linux/list.h"
	.file 13 "/home/edgar/kernel-caninos/uboot/arch/arm/include/asm/mach-types.h"
	.file 14 "/home/edgar/kernel-caninos/uboot/arch/arm/include/asm/setup.h"
	.file 15 "/home/edgar/kernel-caninos/uboot/arch/arm/include/asm/u-boot-arm.h"
	.file 16 "/home/edgar/kernel-caninos/uboot/include/net.h"
	.file 17 "/home/edgar/kernel-caninos/uboot/include/stdio_dev.h"
	.file 18 "/home/edgar/kernel-caninos/uboot/include/iomux.h"
	.file 19 "/home/edgar/kernel-caninos/uboot/include/environment.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xcd0
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF199
	.byte	0xc
	.4byte	.LASF200
	.4byte	.LASF201
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF4
	.byte	0x2
	.byte	0xd
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF0
	.uleb128 0x4
	.4byte	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x3
	.byte	0xc
	.4byte	0x30
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x3
	.byte	0x12
	.4byte	0x75
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x6
	.ascii	"u8\000"
	.byte	0x3
	.byte	0x1f
	.4byte	0x30
	.uleb128 0x2
	.4byte	.LASF11
	.byte	0x3
	.byte	0x34
	.4byte	0x3c
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x35
	.4byte	0x3c
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x7
	.byte	0x4
	.4byte	0xbe
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF15
	.uleb128 0x4
	.4byte	0xbe
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x4
	.byte	0x57
	.4byte	0x43
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x4
	.byte	0x59
	.4byte	0x3c
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x4
	.byte	0x67
	.4byte	0x51
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x4
	.byte	0x69
	.4byte	0x6a
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x4
	.byte	0x8c
	.4byte	0x6a
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x5
	.byte	0xb
	.4byte	0xb8
	.uleb128 0x9
	.byte	0x4
	.uleb128 0xa
	.4byte	0xd5
	.4byte	0x119
	.uleb128 0xb
	.byte	0
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x6
	.byte	0xe
	.4byte	0x10e
	.uleb128 0x7
	.byte	0x4
	.4byte	0xc5
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF23
	.uleb128 0xc
	.4byte	.LASF26
	.byte	0x8
	.byte	0x7
	.byte	0x10
	.4byte	0x156
	.uleb128 0xd
	.4byte	.LASF24
	.byte	0x7
	.byte	0x11
	.4byte	0x94
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x7
	.byte	0x12
	.4byte	0x9f
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF27
	.byte	0x50
	.byte	0x7
	.byte	0x15
	.4byte	0x187
	.uleb128 0xe
	.ascii	"cnt\000"
	.byte	0x7
	.byte	0x16
	.4byte	0x3c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x7
	.byte	0x17
	.4byte	0x9f
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x7
	.byte	0x18
	.4byte	0x187
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.4byte	0x131
	.4byte	0x197
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x8
	.byte	0
	.uleb128 0x10
	.ascii	"lmb\000"
	.byte	0xa0
	.byte	0x7
	.byte	0x1b
	.4byte	0x1bc
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x7
	.byte	0x1c
	.4byte	0x156
	.byte	0
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x7
	.byte	0x1d
	.4byte	0x156
	.byte	0x50
	.byte	0
	.uleb128 0x11
	.ascii	"lmb\000"
	.byte	0x7
	.byte	0x20
	.4byte	0x197
	.uleb128 0x12
	.byte	0x8
	.byte	0x8
	.byte	0x84
	.4byte	0x1e8
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x8
	.byte	0x85
	.4byte	0xd5
	.byte	0
	.uleb128 0xd
	.4byte	.LASF25
	.byte	0x8
	.byte	0x86
	.4byte	0xd5
	.byte	0x4
	.byte	0
	.uleb128 0xc
	.4byte	.LASF32
	.byte	0x50
	.byte	0x8
	.byte	0x1b
	.4byte	0x2d9
	.uleb128 0xd
	.4byte	.LASF33
	.byte	0x8
	.byte	0x1c
	.4byte	0x3c
	.byte	0
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x8
	.byte	0x1d
	.4byte	0x9f
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x8
	.byte	0x1e
	.4byte	0x3c
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x8
	.byte	0x1f
	.4byte	0x3c
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF37
	.byte	0x8
	.byte	0x20
	.4byte	0x3c
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x8
	.byte	0x21
	.4byte	0x3c
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF39
	.byte	0x8
	.byte	0x22
	.4byte	0x3c
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x8
	.byte	0x28
	.4byte	0x3c
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF41
	.byte	0x8
	.byte	0x29
	.4byte	0x3c
	.byte	0x20
	.uleb128 0xd
	.4byte	.LASF42
	.byte	0x8
	.byte	0x2a
	.4byte	0x3c
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x8
	.byte	0x36
	.4byte	0x3c
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF44
	.byte	0x8
	.byte	0x37
	.4byte	0x3c
	.byte	0x2c
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x8
	.byte	0x38
	.4byte	0x2d9
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x8
	.byte	0x39
	.4byte	0x43
	.byte	0x36
	.uleb128 0xd
	.4byte	.LASF47
	.byte	0x8
	.byte	0x3a
	.4byte	0x3c
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF48
	.byte	0x8
	.byte	0x3b
	.4byte	0x3c
	.byte	0x3c
	.uleb128 0xd
	.4byte	.LASF49
	.byte	0x8
	.byte	0x81
	.4byte	0xd5
	.byte	0x40
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x8
	.byte	0x82
	.4byte	0xd5
	.byte	0x44
	.uleb128 0xd
	.4byte	.LASF51
	.byte	0x8
	.byte	0x87
	.4byte	0x2e9
	.byte	0x48
	.byte	0
	.uleb128 0xa
	.4byte	0x30
	.4byte	0x2e9
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x5
	.byte	0
	.uleb128 0xa
	.4byte	0x1c7
	.4byte	0x2f9
	.uleb128 0xf
	.4byte	0xaa
	.byte	0
	.byte	0
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x8
	.byte	0x89
	.4byte	0x1e8
	.uleb128 0xc
	.4byte	.LASF53
	.byte	0x28
	.byte	0x9
	.byte	0x39
	.4byte	0x389
	.uleb128 0xd
	.4byte	.LASF54
	.byte	0x9
	.byte	0x3a
	.4byte	0x39a
	.byte	0
	.uleb128 0xd
	.4byte	.LASF55
	.byte	0x9
	.byte	0x3b
	.4byte	0x39a
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF56
	.byte	0x9
	.byte	0x3c
	.4byte	0x39a
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF57
	.byte	0x9
	.byte	0x3d
	.4byte	0x39a
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF58
	.byte	0x9
	.byte	0x3e
	.4byte	0x39a
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF59
	.byte	0x9
	.byte	0x3f
	.4byte	0x39a
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF60
	.byte	0x9
	.byte	0x40
	.4byte	0x39a
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF61
	.byte	0x9
	.byte	0x43
	.4byte	0x39a
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF62
	.byte	0x9
	.byte	0x46
	.4byte	0x39a
	.byte	0x20
	.uleb128 0xd
	.4byte	.LASF63
	.byte	0x9
	.byte	0x49
	.4byte	0x39a
	.byte	0x24
	.byte	0
	.uleb128 0x8
	.4byte	.LASF64
	.byte	0xa
	.byte	0xf
	.4byte	0x394
	.uleb128 0x7
	.byte	0x4
	.4byte	0x304
	.uleb128 0x2
	.4byte	.LASF65
	.byte	0xa
	.byte	0x12
	.4byte	0xf6
	.uleb128 0x13
	.4byte	.LASF66
	.byte	0x40
	.byte	0xb
	.2byte	0x10a
	.4byte	0x44f
	.uleb128 0x14
	.4byte	.LASF67
	.byte	0xb
	.2byte	0x10b
	.4byte	0xf6
	.byte	0
	.uleb128 0x14
	.4byte	.LASF68
	.byte	0xb
	.2byte	0x10c
	.4byte	0xf6
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF69
	.byte	0xb
	.2byte	0x10d
	.4byte	0xf6
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF70
	.byte	0xb
	.2byte	0x10e
	.4byte	0xf6
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF71
	.byte	0xb
	.2byte	0x10f
	.4byte	0xf6
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF72
	.byte	0xb
	.2byte	0x110
	.4byte	0xf6
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF73
	.byte	0xb
	.2byte	0x111
	.4byte	0xf6
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF74
	.byte	0xb
	.2byte	0x112
	.4byte	0xe0
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF75
	.byte	0xb
	.2byte	0x113
	.4byte	0xe0
	.byte	0x1d
	.uleb128 0x14
	.4byte	.LASF76
	.byte	0xb
	.2byte	0x114
	.4byte	0xe0
	.byte	0x1e
	.uleb128 0x14
	.4byte	.LASF77
	.byte	0xb
	.2byte	0x115
	.4byte	0xe0
	.byte	0x1f
	.uleb128 0x14
	.4byte	.LASF78
	.byte	0xb
	.2byte	0x116
	.4byte	0x44f
	.byte	0x20
	.byte	0
	.uleb128 0xa
	.4byte	0xe0
	.4byte	0x45f
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x1f
	.byte	0
	.uleb128 0x15
	.4byte	.LASF79
	.byte	0xb
	.2byte	0x117
	.4byte	0x3a5
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x18
	.byte	0xb
	.2byte	0x119
	.4byte	0x4ed
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0xb
	.2byte	0x11a
	.4byte	0xd5
	.byte	0
	.uleb128 0x16
	.ascii	"end\000"
	.byte	0xb
	.2byte	0x11a
	.4byte	0xd5
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF81
	.byte	0xb
	.2byte	0x11b
	.4byte	0xd5
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF82
	.byte	0xb
	.2byte	0x11b
	.4byte	0xd5
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF83
	.byte	0xb
	.2byte	0x11c
	.4byte	0xd5
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF84
	.byte	0xb
	.2byte	0x11d
	.4byte	0xe0
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF85
	.byte	0xb
	.2byte	0x11d
	.4byte	0xe0
	.byte	0x15
	.uleb128 0x16
	.ascii	"os\000"
	.byte	0xb
	.2byte	0x11d
	.4byte	0xe0
	.byte	0x16
	.uleb128 0x14
	.4byte	.LASF86
	.byte	0xb
	.2byte	0x11e
	.4byte	0xe0
	.byte	0x17
	.byte	0
	.uleb128 0x15
	.4byte	.LASF87
	.byte	0xb
	.2byte	0x11f
	.4byte	0x46b
	.uleb128 0x17
	.4byte	.LASF88
	.2byte	0x164
	.byte	0xb
	.2byte	0x125
	.4byte	0x68c
	.uleb128 0x14
	.4byte	.LASF89
	.byte	0xb
	.2byte	0x12b
	.4byte	0x68c
	.byte	0
	.uleb128 0x14
	.4byte	.LASF90
	.byte	0xb
	.2byte	0x12c
	.4byte	0x45f
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF91
	.byte	0xb
	.2byte	0x12d
	.4byte	0xd5
	.byte	0x44
	.uleb128 0x14
	.4byte	.LASF92
	.byte	0xb
	.2byte	0x130
	.4byte	0x124
	.byte	0x48
	.uleb128 0x14
	.4byte	.LASF93
	.byte	0xb
	.2byte	0x132
	.4byte	0x10c
	.byte	0x4c
	.uleb128 0x14
	.4byte	.LASF94
	.byte	0xb
	.2byte	0x133
	.4byte	0x124
	.byte	0x50
	.uleb128 0x14
	.4byte	.LASF95
	.byte	0xb
	.2byte	0x134
	.4byte	0x63
	.byte	0x54
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0xb
	.2byte	0x136
	.4byte	0x10c
	.byte	0x58
	.uleb128 0x14
	.4byte	.LASF97
	.byte	0xb
	.2byte	0x137
	.4byte	0x124
	.byte	0x5c
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0xb
	.2byte	0x138
	.4byte	0x63
	.byte	0x60
	.uleb128 0x14
	.4byte	.LASF99
	.byte	0xb
	.2byte	0x13a
	.4byte	0x10c
	.byte	0x64
	.uleb128 0x14
	.4byte	.LASF100
	.byte	0xb
	.2byte	0x13b
	.4byte	0x124
	.byte	0x68
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0xb
	.2byte	0x13c
	.4byte	0x63
	.byte	0x6c
	.uleb128 0x14
	.4byte	.LASF102
	.byte	0xb
	.2byte	0x13e
	.4byte	0x10c
	.byte	0x70
	.uleb128 0x14
	.4byte	.LASF103
	.byte	0xb
	.2byte	0x13f
	.4byte	0x124
	.byte	0x74
	.uleb128 0x14
	.4byte	.LASF104
	.byte	0xb
	.2byte	0x140
	.4byte	0x63
	.byte	0x78
	.uleb128 0x16
	.ascii	"os\000"
	.byte	0xb
	.2byte	0x144
	.4byte	0x4ed
	.byte	0x7c
	.uleb128 0x16
	.ascii	"ep\000"
	.byte	0xb
	.2byte	0x145
	.4byte	0xd5
	.byte	0x94
	.uleb128 0x14
	.4byte	.LASF105
	.byte	0xb
	.2byte	0x147
	.4byte	0xd5
	.byte	0x98
	.uleb128 0x14
	.4byte	.LASF106
	.byte	0xb
	.2byte	0x147
	.4byte	0xd5
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF107
	.byte	0xb
	.2byte	0x149
	.4byte	0xb8
	.byte	0xa0
	.uleb128 0x14
	.4byte	.LASF108
	.byte	0xb
	.2byte	0x14a
	.4byte	0xd5
	.byte	0xa4
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0xb
	.2byte	0x14c
	.4byte	0xd5
	.byte	0xa8
	.uleb128 0x14
	.4byte	.LASF110
	.byte	0xb
	.2byte	0x14d
	.4byte	0xd5
	.byte	0xac
	.uleb128 0x14
	.4byte	.LASF111
	.byte	0xb
	.2byte	0x14e
	.4byte	0xd5
	.byte	0xb0
	.uleb128 0x14
	.4byte	.LASF112
	.byte	0xb
	.2byte	0x14f
	.4byte	0xd5
	.byte	0xb4
	.uleb128 0x16
	.ascii	"kbd\000"
	.byte	0xb
	.2byte	0x150
	.4byte	0x692
	.byte	0xb8
	.uleb128 0x14
	.4byte	.LASF113
	.byte	0xb
	.2byte	0x153
	.4byte	0x63
	.byte	0xbc
	.uleb128 0x14
	.4byte	.LASF114
	.byte	0xb
	.2byte	0x160
	.4byte	0x63
	.byte	0xc0
	.uleb128 0x16
	.ascii	"lmb\000"
	.byte	0xb
	.2byte	0x163
	.4byte	0x197
	.byte	0xc4
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x45f
	.uleb128 0x7
	.byte	0x4
	.4byte	0x2f9
	.uleb128 0x15
	.4byte	.LASF115
	.byte	0xb
	.2byte	0x165
	.4byte	0x4f9
	.uleb128 0x18
	.4byte	.LASF116
	.byte	0xb
	.2byte	0x167
	.4byte	0x698
	.uleb128 0xc
	.4byte	.LASF117
	.byte	0x8
	.byte	0xc
	.byte	0x16
	.4byte	0x6d5
	.uleb128 0xd
	.4byte	.LASF118
	.byte	0xc
	.byte	0x17
	.4byte	0x6d5
	.byte	0
	.uleb128 0xd
	.4byte	.LASF119
	.byte	0xc
	.byte	0x17
	.4byte	0x6d5
	.byte	0x4
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x6b0
	.uleb128 0xa
	.4byte	0xbe
	.4byte	0x6eb
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x1f
	.byte	0
	.uleb128 0xa
	.4byte	0xbe
	.4byte	0x6f6
	.uleb128 0xb
	.byte	0
	.uleb128 0x8
	.4byte	.LASF120
	.byte	0x2
	.byte	0xe7
	.4byte	0x6eb
	.uleb128 0x8
	.4byte	.LASF121
	.byte	0x2
	.byte	0xf1
	.4byte	0xd5
	.uleb128 0xa
	.4byte	0x8a
	.4byte	0x717
	.uleb128 0xb
	.byte	0
	.uleb128 0x8
	.4byte	.LASF122
	.byte	0x2
	.byte	0xf3
	.4byte	0x70c
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x2
	.2byte	0x12c
	.4byte	0xd5
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x2
	.2byte	0x12d
	.4byte	0xd5
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0x2
	.2byte	0x12e
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF126
	.byte	0xd
	.byte	0xb
	.4byte	0x75
	.uleb128 0x19
	.byte	0xc
	.byte	0xe
	.2byte	0x104
	.4byte	0x782
	.uleb128 0x14
	.4byte	.LASF31
	.byte	0xe
	.2byte	0x105
	.4byte	0x3c
	.byte	0
	.uleb128 0x14
	.4byte	.LASF25
	.byte	0xe
	.2byte	0x106
	.4byte	0x3c
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF127
	.byte	0xe
	.2byte	0x107
	.4byte	0x63
	.byte	0x8
	.byte	0
	.uleb128 0x13
	.4byte	.LASF128
	.byte	0x68
	.byte	0xe
	.2byte	0x101
	.4byte	0x7b7
	.uleb128 0x14
	.4byte	.LASF129
	.byte	0xe
	.2byte	0x102
	.4byte	0x63
	.byte	0
	.uleb128 0x16
	.ascii	"end\000"
	.byte	0xe
	.2byte	0x103
	.4byte	0x3c
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF130
	.byte	0xe
	.2byte	0x108
	.4byte	0x7b7
	.byte	0x8
	.byte	0
	.uleb128 0xa
	.4byte	0x751
	.4byte	0x7c7
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x7
	.byte	0
	.uleb128 0x18
	.4byte	.LASF128
	.byte	0xe
	.2byte	0x10b
	.4byte	0x782
	.uleb128 0x8
	.4byte	.LASF131
	.byte	0xf
	.byte	0x11
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF132
	.byte	0xf
	.byte	0x12
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF133
	.byte	0xf
	.byte	0x13
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF134
	.byte	0xf
	.byte	0x14
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF135
	.byte	0xf
	.byte	0x15
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF136
	.byte	0xf
	.byte	0x16
	.4byte	0xd5
	.uleb128 0x8
	.4byte	.LASF137
	.byte	0xf
	.byte	0x17
	.4byte	0xd5
	.uleb128 0x2
	.4byte	.LASF138
	.byte	0x10
	.byte	0x2a
	.4byte	0xf6
	.uleb128 0x7
	.byte	0x4
	.4byte	0x25
	.uleb128 0xc
	.4byte	.LASF139
	.byte	0x44
	.byte	0x10
	.byte	0x51
	.4byte	0x8da
	.uleb128 0xd
	.4byte	.LASF140
	.byte	0x10
	.byte	0x52
	.4byte	0x8da
	.byte	0
	.uleb128 0xd
	.4byte	.LASF141
	.byte	0x10
	.byte	0x53
	.4byte	0x2d9
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF142
	.byte	0x10
	.byte	0x54
	.4byte	0x94
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF114
	.byte	0x10
	.byte	0x55
	.4byte	0x63
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF143
	.byte	0x10
	.byte	0x57
	.4byte	0x904
	.byte	0x20
	.uleb128 0xd
	.4byte	.LASF144
	.byte	0x10
	.byte	0x58
	.4byte	0x923
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF145
	.byte	0x10
	.byte	0x59
	.4byte	0x938
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF146
	.byte	0x10
	.byte	0x5a
	.4byte	0x949
	.byte	0x2c
	.uleb128 0xd
	.4byte	.LASF147
	.byte	0x10
	.byte	0x5e
	.4byte	0x938
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF118
	.byte	0x10
	.byte	0x5f
	.4byte	0x8fe
	.byte	0x34
	.uleb128 0xd
	.4byte	.LASF148
	.byte	0x10
	.byte	0x60
	.4byte	0x63
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF149
	.byte	0x10
	.byte	0x61
	.4byte	0x75
	.byte	0x3c
	.uleb128 0xd
	.4byte	.LASF150
	.byte	0x10
	.byte	0x62
	.4byte	0x10c
	.byte	0x40
	.byte	0
	.uleb128 0xa
	.4byte	0xbe
	.4byte	0x8ea
	.uleb128 0xf
	.4byte	0xaa
	.byte	0xf
	.byte	0
	.uleb128 0x1a
	.4byte	0x63
	.4byte	0x8fe
	.uleb128 0x1b
	.4byte	0x8fe
	.uleb128 0x1b
	.4byte	0x692
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x831
	.uleb128 0x7
	.byte	0x4
	.4byte	0x8ea
	.uleb128 0x1a
	.4byte	0x63
	.4byte	0x923
	.uleb128 0x1b
	.4byte	0x8fe
	.uleb128 0x1b
	.4byte	0x10c
	.uleb128 0x1b
	.4byte	0x63
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x90a
	.uleb128 0x1a
	.4byte	0x63
	.4byte	0x938
	.uleb128 0x1b
	.4byte	0x8fe
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x929
	.uleb128 0x1c
	.4byte	0x949
	.uleb128 0x1b
	.4byte	0x8fe
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x93e
	.uleb128 0x8
	.4byte	.LASF151
	.byte	0x10
	.byte	0x6c
	.4byte	0x8fe
	.uleb128 0xa
	.4byte	0x25
	.4byte	0x96a
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x5
	.byte	0
	.uleb128 0x18
	.4byte	.LASF152
	.byte	0x10
	.2byte	0x189
	.4byte	0x820
	.uleb128 0x18
	.4byte	.LASF153
	.byte	0x10
	.2byte	0x18a
	.4byte	0x820
	.uleb128 0x18
	.4byte	.LASF154
	.byte	0x10
	.2byte	0x18b
	.4byte	0x820
	.uleb128 0x18
	.4byte	.LASF155
	.byte	0x10
	.2byte	0x18f
	.4byte	0x6db
	.uleb128 0x18
	.4byte	.LASF156
	.byte	0x10
	.2byte	0x190
	.4byte	0x6db
	.uleb128 0xa
	.4byte	0xbe
	.4byte	0x9b6
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x3f
	.byte	0
	.uleb128 0x18
	.4byte	.LASF157
	.byte	0x10
	.2byte	0x191
	.4byte	0x9a6
	.uleb128 0x18
	.4byte	.LASF158
	.byte	0x10
	.2byte	0x192
	.4byte	0xca
	.uleb128 0x18
	.4byte	.LASF159
	.byte	0x10
	.2byte	0x194
	.4byte	0xd5
	.uleb128 0x18
	.4byte	.LASF160
	.byte	0x10
	.2byte	0x195
	.4byte	0x95a
	.uleb128 0x18
	.4byte	.LASF161
	.byte	0x10
	.2byte	0x196
	.4byte	0x95a
	.uleb128 0x18
	.4byte	.LASF162
	.byte	0x10
	.2byte	0x197
	.4byte	0x820
	.uleb128 0x18
	.4byte	.LASF163
	.byte	0x10
	.2byte	0x198
	.4byte	0x820
	.uleb128 0x18
	.4byte	.LASF164
	.byte	0x10
	.2byte	0x199
	.4byte	0x82b
	.uleb128 0xa
	.4byte	0x82b
	.4byte	0xa26
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.4byte	.LASF165
	.byte	0x10
	.2byte	0x19a
	.4byte	0xa16
	.uleb128 0x18
	.4byte	.LASF166
	.byte	0x10
	.2byte	0x19b
	.4byte	0x82b
	.uleb128 0x18
	.4byte	.LASF167
	.byte	0x10
	.2byte	0x19c
	.4byte	0x63
	.uleb128 0x18
	.4byte	.LASF168
	.byte	0x10
	.2byte	0x19d
	.4byte	0x75
	.uleb128 0x18
	.4byte	.LASF169
	.byte	0x10
	.2byte	0x19e
	.4byte	0x95a
	.uleb128 0x18
	.4byte	.LASF170
	.byte	0x10
	.2byte	0x19f
	.4byte	0x95a
	.uleb128 0x18
	.4byte	.LASF171
	.byte	0x10
	.2byte	0x1a3
	.4byte	0xca
	.uleb128 0x18
	.4byte	.LASF172
	.byte	0x10
	.2byte	0x1a4
	.4byte	0xca
	.uleb128 0x18
	.4byte	.LASF173
	.byte	0x10
	.2byte	0x1a6
	.4byte	0x63
	.uleb128 0xa
	.4byte	0xbe
	.4byte	0xaa2
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x7f
	.byte	0
	.uleb128 0x18
	.4byte	.LASF174
	.byte	0x10
	.2byte	0x1ae
	.4byte	0xa92
	.uleb128 0x18
	.4byte	.LASF175
	.byte	0x10
	.2byte	0x1b6
	.4byte	0x820
	.uleb128 0x1d
	.4byte	.LASF202
	.byte	0x4
	.4byte	0x75
	.byte	0x10
	.2byte	0x20f
	.4byte	0xae4
	.uleb128 0x1e
	.4byte	.LASF176
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF177
	.byte	0x1
	.uleb128 0x1e
	.4byte	.LASF178
	.byte	0x2
	.uleb128 0x1e
	.4byte	.LASF179
	.byte	0x3
	.byte	0
	.uleb128 0x18
	.4byte	.LASF180
	.byte	0x10
	.2byte	0x215
	.4byte	0xaba
	.uleb128 0xc
	.4byte	.LASF181
	.byte	0x4c
	.byte	0x11
	.byte	0x17
	.4byte	0xb81
	.uleb128 0xd
	.4byte	.LASF182
	.byte	0x11
	.byte	0x18
	.4byte	0x63
	.byte	0
	.uleb128 0xe
	.ascii	"ext\000"
	.byte	0x11
	.byte	0x19
	.4byte	0x63
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF140
	.byte	0x11
	.byte	0x1a
	.4byte	0x6db
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x11
	.byte	0x1e
	.4byte	0xb96
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF183
	.byte	0x11
	.byte	0x1f
	.4byte	0xb96
	.byte	0x2c
	.uleb128 0xd
	.4byte	.LASF184
	.byte	0x11
	.byte	0x24
	.4byte	0xbac
	.byte	0x30
	.uleb128 0xd
	.4byte	.LASF185
	.byte	0x11
	.byte	0x26
	.4byte	0xbc2
	.byte	0x34
	.uleb128 0xd
	.4byte	.LASF186
	.byte	0x11
	.byte	0x2b
	.4byte	0xb96
	.byte	0x38
	.uleb128 0xd
	.4byte	.LASF187
	.byte	0x11
	.byte	0x2c
	.4byte	0xb96
	.byte	0x3c
	.uleb128 0xd
	.4byte	.LASF150
	.byte	0x11
	.byte	0x30
	.4byte	0x10c
	.byte	0x40
	.uleb128 0xd
	.4byte	.LASF188
	.byte	0x11
	.byte	0x31
	.4byte	0x6b0
	.byte	0x44
	.byte	0
	.uleb128 0x1a
	.4byte	0x63
	.4byte	0xb90
	.uleb128 0x1b
	.4byte	0xb90
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0xaf0
	.uleb128 0x7
	.byte	0x4
	.4byte	0xb81
	.uleb128 0x1c
	.4byte	0xbac
	.uleb128 0x1b
	.4byte	0xb90
	.uleb128 0x1b
	.4byte	0xc5
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0xb9c
	.uleb128 0x1c
	.4byte	0xbc2
	.uleb128 0x1b
	.4byte	0xb90
	.uleb128 0x1b
	.4byte	0x124
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0xbb2
	.uleb128 0xa
	.4byte	0xb90
	.4byte	0xbd3
	.uleb128 0xb
	.byte	0
	.uleb128 0x8
	.4byte	.LASF189
	.byte	0x11
	.byte	0x49
	.4byte	0xbc8
	.uleb128 0xa
	.4byte	0xb8
	.4byte	0xbee
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	.LASF190
	.byte	0x11
	.byte	0x4a
	.4byte	0xbde
	.uleb128 0xa
	.4byte	0xc09
	.4byte	0xc09
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x2
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0xb90
	.uleb128 0x8
	.4byte	.LASF191
	.byte	0x12
	.byte	0x15
	.4byte	0xbf9
	.uleb128 0xa
	.4byte	0x63
	.4byte	0xc2a
	.uleb128 0xf
	.4byte	0xaa
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	.LASF192
	.byte	0x12
	.byte	0x1a
	.4byte	0xc1a
	.uleb128 0x8
	.4byte	.LASF193
	.byte	0x13
	.byte	0x92
	.4byte	0xb8
	.uleb128 0x1f
	.4byte	.LASF194
	.4byte	0x20000
	.byte	0x13
	.byte	0x9c
	.4byte	0xc74
	.uleb128 0xe
	.ascii	"crc\000"
	.byte	0x13
	.byte	0x9d
	.4byte	0xeb
	.byte	0
	.uleb128 0xd
	.4byte	.LASF182
	.byte	0x13
	.byte	0x9f
	.4byte	0x30
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF195
	.byte	0x13
	.byte	0xa1
	.4byte	0xc74
	.byte	0x5
	.byte	0
	.uleb128 0xa
	.4byte	0x30
	.4byte	0xc87
	.uleb128 0x20
	.4byte	0xaa
	.4byte	0x1fffa
	.byte	0
	.uleb128 0x2
	.4byte	.LASF196
	.byte	0x13
	.byte	0xa2
	.4byte	0xc40
	.uleb128 0xa
	.4byte	0x37
	.4byte	0xc9d
	.uleb128 0xb
	.byte	0
	.uleb128 0x4
	.4byte	0xc92
	.uleb128 0x8
	.4byte	.LASF197
	.byte	0x13
	.byte	0xad
	.4byte	0xc9d
	.uleb128 0x8
	.4byte	.LASF198
	.byte	0x13
	.byte	0xae
	.4byte	0xcb8
	.uleb128 0x7
	.byte	0x4
	.4byte	0xc87
	.uleb128 0x21
	.4byte	.LASF203
	.byte	0x1
	.byte	0x17
	.4byte	0x63
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x6
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB184
	.4byte	.LFE184-.LFB184
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",%progbits
.Ldebug_ranges0:
	.4byte	.LFB184
	.4byte	.LFE184
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF92:
	.ascii	"fit_uname_cfg\000"
.LASF94:
	.ascii	"fit_uname_os\000"
.LASF160:
	.ascii	"NetOurEther\000"
.LASF50:
	.ascii	"bi_boot_params\000"
.LASF133:
	.ascii	"_datarel_start_ofs\000"
.LASF179:
	.ascii	"NETLOOP_FAIL\000"
.LASF34:
	.ascii	"bi_memsize\000"
.LASF95:
	.ascii	"fit_noffset_os\000"
.LASF71:
	.ascii	"ih_load\000"
.LASF119:
	.ascii	"prev\000"
.LASF177:
	.ascii	"NETLOOP_RESTART\000"
.LASF190:
	.ascii	"stdio_names\000"
.LASF84:
	.ascii	"comp\000"
.LASF143:
	.ascii	"init\000"
.LASF132:
	.ascii	"FIQ_STACK_START\000"
.LASF55:
	.ascii	"totalsize\000"
.LASF166:
	.ascii	"NetRxPacket\000"
.LASF157:
	.ascii	"NetOurRootPath\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF141:
	.ascii	"enetaddr\000"
.LASF60:
	.ascii	"last_comp_version\000"
.LASF153:
	.ascii	"NetOurSubnetMask\000"
.LASF189:
	.ascii	"stdio_devices\000"
.LASF118:
	.ascii	"next\000"
.LASF26:
	.ascii	"lmb_property\000"
.LASF47:
	.ascii	"bi_intfreq\000"
.LASF9:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF67:
	.ascii	"ih_magic\000"
.LASF49:
	.ascii	"bi_arch_number\000"
.LASF120:
	.ascii	"console_buffer\000"
.LASF89:
	.ascii	"legacy_hdr_os\000"
.LASF110:
	.ascii	"initrd_end\000"
.LASF88:
	.ascii	"bootm_headers\000"
.LASF173:
	.ascii	"NetRestartWrap\000"
.LASF199:
	.ascii	"GNU C11 6.3.0 20170516 -marm -mno-thumb-interwork -"
	.ascii	"mabi=aapcs-linux -mword-relocations -mno-unaligned-"
	.ascii	"access -mfloat-abi=soft -march=armv7-a -mfpu=vfpv3-"
	.ascii	"d16 -mtls-dialect=gnu -g -Os -fno-builtin -ffreesta"
	.ascii	"nding -fno-stack-protector -fstack-usage -ffunction"
	.ascii	"-sections -fdata-sections -fno-common -ffixed-r9\000"
.LASF169:
	.ascii	"NetBcastAddr\000"
.LASF114:
	.ascii	"state\000"
.LASF14:
	.ascii	"long int\000"
.LASF129:
	.ascii	"nr_banks\000"
.LASF174:
	.ascii	"BootFile\000"
.LASF149:
	.ascii	"phy_id\000"
.LASF196:
	.ascii	"env_t\000"
.LASF158:
	.ascii	"NetBootFileSize\000"
.LASF136:
	.ascii	"_datarelro_start_ofs\000"
.LASF22:
	.ascii	"ide_bus_offset\000"
.LASF87:
	.ascii	"image_info_t\000"
.LASF152:
	.ascii	"NetOurGatewayIP\000"
.LASF170:
	.ascii	"NetEtherNullAddr\000"
.LASF138:
	.ascii	"IPaddr_t\000"
.LASF178:
	.ascii	"NETLOOP_SUCCESS\000"
.LASF155:
	.ascii	"NetOurNISDomain\000"
.LASF113:
	.ascii	"verify\000"
.LASF172:
	.ascii	"NetOurNativeVLAN\000"
.LASF93:
	.ascii	"fit_hdr_os\000"
.LASF30:
	.ascii	"reserved\000"
.LASF107:
	.ascii	"ft_addr\000"
.LASF123:
	.ascii	"load_addr\000"
.LASF29:
	.ascii	"memory\000"
.LASF181:
	.ascii	"stdio_dev\000"
.LASF137:
	.ascii	"IRQ_STACK_START_IN\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF76:
	.ascii	"ih_type\000"
.LASF72:
	.ascii	"ih_ep\000"
.LASF187:
	.ascii	"getc\000"
.LASF5:
	.ascii	"__u8\000"
.LASF175:
	.ascii	"NetPingIP\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF7:
	.ascii	"__u32\000"
.LASF57:
	.ascii	"off_dt_strings\000"
.LASF48:
	.ascii	"bi_busfreq\000"
.LASF97:
	.ascii	"fit_uname_rd\000"
.LASF140:
	.ascii	"name\000"
.LASF73:
	.ascii	"ih_dcrc\000"
.LASF195:
	.ascii	"data\000"
.LASF43:
	.ascii	"bi_bootflags\000"
.LASF25:
	.ascii	"size\000"
.LASF2:
	.ascii	"short unsigned int\000"
.LASF131:
	.ascii	"IRQ_STACK_START\000"
.LASF98:
	.ascii	"fit_noffset_rd\000"
.LASF109:
	.ascii	"initrd_start\000"
.LASF85:
	.ascii	"type\000"
.LASF86:
	.ascii	"arch\000"
.LASF65:
	.ascii	"fdt32_t\000"
.LASF128:
	.ascii	"meminfo\000"
.LASF90:
	.ascii	"legacy_hdr_os_copy\000"
.LASF127:
	.ascii	"node\000"
.LASF44:
	.ascii	"bi_ip_addr\000"
.LASF200:
	.ascii	"/home/edgar/kernel-caninos/uboot/arch/arm/lib/asm-o"
	.ascii	"ffsets.c\000"
.LASF52:
	.ascii	"bd_t\000"
.LASF80:
	.ascii	"image_info\000"
.LASF45:
	.ascii	"bi_enetaddr\000"
.LASF184:
	.ascii	"putc\000"
.LASF163:
	.ascii	"NetServerIP\000"
.LASF83:
	.ascii	"load\000"
.LASF24:
	.ascii	"base\000"
.LASF63:
	.ascii	"size_dt_struct\000"
.LASF185:
	.ascii	"puts\000"
.LASF59:
	.ascii	"version\000"
.LASF145:
	.ascii	"recv\000"
.LASF102:
	.ascii	"fit_hdr_setup\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF103:
	.ascii	"fit_uname_setup\000"
.LASF125:
	.ascii	"save_size\000"
.LASF74:
	.ascii	"ih_os\000"
.LASF124:
	.ascii	"save_addr\000"
.LASF161:
	.ascii	"NetServerEther\000"
.LASF40:
	.ascii	"bi_arm_freq\000"
.LASF144:
	.ascii	"send\000"
.LASF56:
	.ascii	"off_dt_struct\000"
.LASF194:
	.ascii	"environment_s\000"
.LASF32:
	.ascii	"bd_info\000"
.LASF16:
	.ascii	"ushort\000"
.LASF198:
	.ascii	"env_ptr\000"
.LASF79:
	.ascii	"image_header_t\000"
.LASF115:
	.ascii	"bootm_headers_t\000"
.LASF4:
	.ascii	"uchar\000"
.LASF201:
	.ascii	"/home/edgar/kernel-caninos/build/s500/u-boot\000"
.LASF62:
	.ascii	"size_dt_strings\000"
.LASF150:
	.ascii	"priv\000"
.LASF99:
	.ascii	"fit_hdr_fdt\000"
.LASF21:
	.ascii	"___strtok\000"
.LASF35:
	.ascii	"bi_flashstart\000"
.LASF116:
	.ascii	"images\000"
.LASF81:
	.ascii	"image_start\000"
.LASF27:
	.ascii	"lmb_region\000"
.LASF168:
	.ascii	"NetIPID\000"
.LASF154:
	.ascii	"NetOurDNSIP\000"
.LASF165:
	.ascii	"NetRxPackets\000"
.LASF100:
	.ascii	"fit_uname_fdt\000"
.LASF77:
	.ascii	"ih_comp\000"
.LASF108:
	.ascii	"ft_len\000"
.LASF151:
	.ascii	"eth_current\000"
.LASF142:
	.ascii	"iobase\000"
.LASF0:
	.ascii	"unsigned char\000"
.LASF70:
	.ascii	"ih_size\000"
.LASF105:
	.ascii	"rd_start\000"
.LASF171:
	.ascii	"NetOurVLAN\000"
.LASF126:
	.ascii	"__machine_arch_type\000"
.LASF58:
	.ascii	"off_mem_rsvmap\000"
.LASF191:
	.ascii	"console_devices\000"
.LASF6:
	.ascii	"short int\000"
.LASF54:
	.ascii	"magic\000"
.LASF39:
	.ascii	"bi_sramsize\000"
.LASF186:
	.ascii	"tstc\000"
.LASF106:
	.ascii	"rd_end\000"
.LASF91:
	.ascii	"legacy_hdr_valid\000"
.LASF147:
	.ascii	"write_hwaddr\000"
.LASF104:
	.ascii	"fit_noffset_setup\000"
.LASF122:
	.ascii	"__dtb_dt_begin\000"
.LASF41:
	.ascii	"bi_dsp_freq\000"
.LASF121:
	.ascii	"monitor_flash_len\000"
.LASF19:
	.ascii	"uint32_t\000"
.LASF134:
	.ascii	"_datarelrolocal_start_ofs\000"
.LASF23:
	.ascii	"long double\000"
.LASF15:
	.ascii	"char\000"
.LASF101:
	.ascii	"fit_noffset_fdt\000"
.LASF36:
	.ascii	"bi_flashsize\000"
.LASF66:
	.ascii	"image_header\000"
.LASF117:
	.ascii	"list_head\000"
.LASF148:
	.ascii	"index\000"
.LASF197:
	.ascii	"default_environment\000"
.LASF11:
	.ascii	"phys_addr_t\000"
.LASF38:
	.ascii	"bi_sramstart\000"
.LASF159:
	.ascii	"NetBootFileXferSize\000"
.LASF20:
	.ascii	"__be32\000"
.LASF82:
	.ascii	"image_len\000"
.LASF164:
	.ascii	"NetTxPacket\000"
.LASF69:
	.ascii	"ih_time\000"
.LASF53:
	.ascii	"fdt_header\000"
.LASF130:
	.ascii	"bank\000"
.LASF64:
	.ascii	"working_fdt\000"
.LASF46:
	.ascii	"bi_ethspeed\000"
.LASF28:
	.ascii	"region\000"
.LASF176:
	.ascii	"NETLOOP_CONTINUE\000"
.LASF112:
	.ascii	"cmdline_end\000"
.LASF12:
	.ascii	"phys_size_t\000"
.LASF68:
	.ascii	"ih_hcrc\000"
.LASF156:
	.ascii	"NetOurHostName\000"
.LASF193:
	.ascii	"env_name_spec\000"
.LASF180:
	.ascii	"net_state\000"
.LASF18:
	.ascii	"uint8_t\000"
.LASF167:
	.ascii	"NetRxPacketLen\000"
.LASF96:
	.ascii	"fit_hdr_rd\000"
.LASF61:
	.ascii	"boot_cpuid_phys\000"
.LASF182:
	.ascii	"flags\000"
.LASF51:
	.ascii	"bi_dram\000"
.LASF146:
	.ascii	"halt\000"
.LASF78:
	.ascii	"ih_name\000"
.LASF192:
	.ascii	"cd_count\000"
.LASF202:
	.ascii	"net_loop_state\000"
.LASF162:
	.ascii	"NetOurIP\000"
.LASF42:
	.ascii	"bi_ddr_freq\000"
.LASF139:
	.ascii	"eth_device\000"
.LASF33:
	.ascii	"bi_memstart\000"
.LASF31:
	.ascii	"start\000"
.LASF188:
	.ascii	"list\000"
.LASF203:
	.ascii	"main\000"
.LASF183:
	.ascii	"stop\000"
.LASF75:
	.ascii	"ih_arch\000"
.LASF37:
	.ascii	"bi_flashoffset\000"
.LASF135:
	.ascii	"_datarellocal_start_ofs\000"
.LASF17:
	.ascii	"ulong\000"
.LASF111:
	.ascii	"cmdline_start\000"
	.ident	"GCC: (Debian 6.3.0-18) 6.3.0 20170516"
	.section	.note.GNU-stack,"",%progbits
