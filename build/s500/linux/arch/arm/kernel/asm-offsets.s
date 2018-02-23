	.arch armv7-a
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 2	@ Tag_ABI_PCS_wchar_t
	.file	"asm-offsets.c"
@ GNU C ( 4.9.2-10) version 4.9.2 (arm-linux-gnueabihf)
@	compiled by GNU C version 4.9.2, GMP version 6.0.0, MPFR version 3.1.2-p3, MPC version 1.0.2
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc
@ -I /home/edgar/repo/kernel-caninos/linux/arch/arm/include
@ -I ./arch/arm/include/generated
@ -I /home/edgar/repo/kernel-caninos/linux/include -I ./include
@ -I /home/edgar/repo/kernel-caninos/linux/arch/arm/include/uapi
@ -I ./arch/arm/include/generated/uapi
@ -I /home/edgar/repo/kernel-caninos/linux/include/uapi
@ -I ./include/generated/uapi -I /home/edgar/repo/kernel-caninos/linux/.
@ -I . -imultilib . -imultiarch arm-linux-gnueabihf -D __KERNEL__
@ -D __LINUX_ARM_ARCH__=7 -U arm -D CC_HAVE_ASM_GOTO
@ -D KBUILD_BASENAME="asm_offsets" -D KBUILD_MODNAME="asm_offsets"
@ -isystem /usr/lib/gcc/arm-linux-gnueabihf/4.9/include
@ -include /home/edgar/repo/kernel-caninos/linux/include/linux/kconfig.h
@ -MD arch/arm/kernel/.asm-offsets.s.d
@ /home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c
@ -mlittle-endian -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -marm
@ -march=armv7-a -mfloat-abi=soft -mtls-dialect=gnu
@ -auxbase-strip arch/arm/kernel/asm-offsets.s -O2 -Wall -Wundef
@ -Wstrict-prototypes -Wno-trigraphs -Werror=implicit-function-declaration
@ -Wno-format-security -Wframe-larger-than=1024
@ -Wno-unused-but-set-variable -Wdeclaration-after-statement
@ -Wno-pointer-sign -Werror=implicit-int -Werror=strict-prototypes
@ -Werror=date-time -std=gnu90 -fno-strict-aliasing -fno-common
@ -fshort-wchar -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -funwind-tables
@ -fno-delete-null-pointer-checks -fno-stack-protector -fomit-frame-pointer
@ -fno-var-tracking-assignments -fno-inline-functions-called-once
@ -fno-strict-overflow -fstack-check=no -fconserve-stack -fverbose-asm
@ --param allow-store-data-races=0
@ options enabled:  -faggressive-loop-optimizations -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fcombine-stack-adjustments
@ -fcompare-elim -fcprop-registers -fcrossjumping -fcse-follow-jumps
@ -fdefer-pop -fdevirtualize -fdevirtualize-speculatively -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime
@ -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
@ -fif-conversion -fif-conversion2 -findirect-inlining -finline
@ -finline-atomics -finline-small-functions -fipa-cp -fipa-profile
@ -fipa-pure-const -fipa-reference -fira-hoist-pressure
@ -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2
@ -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
@ -fschedule-insns2 -fsection-anchors -fshow-column -fshrink-wrap
@ -fsigned-zeros -fsplit-ivs-in-unroller -fsplit-wide-types
@ -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
@ -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
@ -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
@ -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-phiprop -ftree-pre -ftree-pta
@ -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra
@ -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
@ -funit-at-a-time -funwind-tables -fverbose-asm -fzero-initialized-in-bss
@ -marm -mglibc -mlittle-endian -mlra -mpic-data-is-text-relative
@ -msched-prolog -munaligned-access -mvectorize-with-neon-quad

#APP
	.macro	it, cond
	.endm
	.macro	itt, cond
	.endm
	.macro	ite, cond
	.endm
	.macro	ittt, cond
	.endm
	.macro	itte, cond
	.endm
	.macro	itet, cond
	.endm
	.macro	itee, cond
	.endm
	.macro	itttt, cond
	.endm
	.macro	ittte, cond
	.endm
	.macro	ittet, cond
	.endm
	.macro	ittee, cond
	.endm
	.macro	itett, cond
	.endm
	.macro	itete, cond
	.endm
	.macro	iteet, cond
	.endm
	.macro	iteee, cond
	.endm

	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	.fnstart
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
#APP
@ 63 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TSK_ACTIVE_MM #584 offsetof(struct task_struct, active_mm)"	@
@ 0 "" 2
@ 67 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 68 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_FLAGS #0 offsetof(struct thread_info, flags)"	@
@ 0 "" 2
@ 69 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_PREEMPT #4 offsetof(struct thread_info, preempt_count)"	@
@ 0 "" 2
@ 70 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_ADDR_LIMIT #8 offsetof(struct thread_info, addr_limit)"	@
@ 0 "" 2
@ 71 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_TASK #12 offsetof(struct thread_info, task)"	@
@ 0 "" 2
@ 72 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_CPU #16 offsetof(struct thread_info, cpu)"	@
@ 0 "" 2
@ 73 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_CPU_DOMAIN #20 offsetof(struct thread_info, cpu_domain)"	@
@ 0 "" 2
@ 74 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_CPU_SAVE #24 offsetof(struct thread_info, cpu_context)"	@
@ 0 "" 2
@ 75 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_USED_CP #76 offsetof(struct thread_info, used_cp)"	@
@ 0 "" 2
@ 76 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_TP_VALUE #92 offsetof(struct thread_info, tp_value)"	@
@ 0 "" 2
@ 77 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->TI_FPSTATE #104 offsetof(struct thread_info, fpstate)"	@
@ 0 "" 2
@ 93 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 94 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R0 #0 offsetof(struct pt_regs, ARM_r0)"	@
@ 0 "" 2
@ 95 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R1 #4 offsetof(struct pt_regs, ARM_r1)"	@
@ 0 "" 2
@ 96 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R2 #8 offsetof(struct pt_regs, ARM_r2)"	@
@ 0 "" 2
@ 97 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R3 #12 offsetof(struct pt_regs, ARM_r3)"	@
@ 0 "" 2
@ 98 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R4 #16 offsetof(struct pt_regs, ARM_r4)"	@
@ 0 "" 2
@ 99 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R5 #20 offsetof(struct pt_regs, ARM_r5)"	@
@ 0 "" 2
@ 100 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R6 #24 offsetof(struct pt_regs, ARM_r6)"	@
@ 0 "" 2
@ 101 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R7 #28 offsetof(struct pt_regs, ARM_r7)"	@
@ 0 "" 2
@ 102 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R8 #32 offsetof(struct pt_regs, ARM_r8)"	@
@ 0 "" 2
@ 103 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R9 #36 offsetof(struct pt_regs, ARM_r9)"	@
@ 0 "" 2
@ 104 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_R10 #40 offsetof(struct pt_regs, ARM_r10)"	@
@ 0 "" 2
@ 105 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_FP #44 offsetof(struct pt_regs, ARM_fp)"	@
@ 0 "" 2
@ 106 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_IP #48 offsetof(struct pt_regs, ARM_ip)"	@
@ 0 "" 2
@ 107 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_SP #52 offsetof(struct pt_regs, ARM_sp)"	@
@ 0 "" 2
@ 108 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_LR #56 offsetof(struct pt_regs, ARM_lr)"	@
@ 0 "" 2
@ 109 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_PC #60 offsetof(struct pt_regs, ARM_pc)"	@
@ 0 "" 2
@ 110 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_PSR #64 offsetof(struct pt_regs, ARM_cpsr)"	@
@ 0 "" 2
@ 111 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->S_OLD_R0 #68 offsetof(struct pt_regs, ARM_ORIG_r0)"	@
@ 0 "" 2
@ 112 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PT_REGS_SIZE #72 sizeof(struct pt_regs)"	@
@ 0 "" 2
@ 113 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SVC_DACR #72 offsetof(struct svc_pt_regs, dacr)"	@
@ 0 "" 2
@ 114 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SVC_ADDR_LIMIT #76 offsetof(struct svc_pt_regs, addr_limit)"	@
@ 0 "" 2
@ 115 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SVC_REGS_SIZE #80 sizeof(struct svc_pt_regs)"	@
@ 0 "" 2
@ 116 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 117 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SIGFRAME_RC3_OFFSET #756 offsetof(struct sigframe, retcode[3])"	@
@ 0 "" 2
@ 118 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->RT_SIGFRAME_RC3_OFFSET #884 offsetof(struct rt_sigframe, sig.retcode[3])"	@
@ 0 "" 2
@ 119 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 121 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_PHY_BASE #0 offsetof(struct l2x0_regs, phy_base)"	@
@ 0 "" 2
@ 122 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_AUX_CTRL #4 offsetof(struct l2x0_regs, aux_ctrl)"	@
@ 0 "" 2
@ 123 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_TAG_LATENCY #8 offsetof(struct l2x0_regs, tag_latency)"	@
@ 0 "" 2
@ 124 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_DATA_LATENCY #12 offsetof(struct l2x0_regs, data_latency)"	@
@ 0 "" 2
@ 125 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_FILTER_START #16 offsetof(struct l2x0_regs, filter_start)"	@
@ 0 "" 2
@ 126 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_FILTER_END #20 offsetof(struct l2x0_regs, filter_end)"	@
@ 0 "" 2
@ 127 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_PREFETCH_CTRL #24 offsetof(struct l2x0_regs, prefetch_ctrl)"	@
@ 0 "" 2
@ 128 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->L2X0_R_PWR_CTRL #28 offsetof(struct l2x0_regs, pwr_ctrl)"	@
@ 0 "" 2
@ 129 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 132 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->MM_CONTEXT_ID #360 offsetof(struct mm_struct, context.id.counter)"	@
@ 0 "" 2
@ 133 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 135 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VMA_VM_MM #32 offsetof(struct vm_area_struct, vm_mm)"	@
@ 0 "" 2
@ 136 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VMA_VM_FLAGS #40 offsetof(struct vm_area_struct, vm_flags)"	@
@ 0 "" 2
@ 137 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 138 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->VM_EXEC #4 VM_EXEC"	@
@ 0 "" 2
@ 139 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 140 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PAGE_SZ #4096 PAGE_SIZE"	@
@ 0 "" 2
@ 141 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 142 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SYS_ERROR0 #10420224 0x9f0000"	@
@ 0 "" 2
@ 143 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 144 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->SIZEOF_MACHINE_DESC #104 sizeof(struct machine_desc)"	@
@ 0 "" 2
@ 145 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->MACHINFO_TYPE #0 offsetof(struct machine_desc, nr)"	@
@ 0 "" 2
@ 146 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->MACHINFO_NAME #4 offsetof(struct machine_desc, name)"	@
@ 0 "" 2
@ 147 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 148 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROC_INFO_SZ #52 sizeof(struct proc_info_list)"	@
@ 0 "" 2
@ 149 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROCINFO_INITFUNC #16 offsetof(struct proc_info_list, __cpu_flush)"	@
@ 0 "" 2
@ 150 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROCINFO_MM_MMUFLAGS #8 offsetof(struct proc_info_list, __cpu_mm_mmu_flags)"	@
@ 0 "" 2
@ 151 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->PROCINFO_IO_MMUFLAGS #12 offsetof(struct proc_info_list, __cpu_io_mmu_flags)"	@
@ 0 "" 2
@ 152 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 160 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CPU_SLEEP_SIZE #36 offsetof(struct processor, suspend_size)"	@
@ 0 "" 2
@ 161 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CPU_DO_SUSPEND #40 offsetof(struct processor, do_suspend)"	@
@ 0 "" 2
@ 162 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CPU_DO_RESUME #44 offsetof(struct processor, do_resume)"	@
@ 0 "" 2
@ 172 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 173 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->DMA_BIDIRECTIONAL #0 DMA_BIDIRECTIONAL"	@
@ 0 "" 2
@ 174 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->DMA_TO_DEVICE #1 DMA_TO_DEVICE"	@
@ 0 "" 2
@ 175 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->DMA_FROM_DEVICE #2 DMA_FROM_DEVICE"	@
@ 0 "" 2
@ 176 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 177 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CACHE_WRITEBACK_ORDER #6 __CACHE_WRITEBACK_ORDER"	@
@ 0 "" 2
@ 178 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->CACHE_WRITEBACK_GRANULE #64 __CACHE_WRITEBACK_GRANULE"	@
@ 0 "" 2
@ 179 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 187 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
@ 191 "/home/edgar/repo/kernel-caninos/linux/arch/arm/kernel/asm-offsets.c" 1
	
.ascii "->"
@ 0 "" 2
	mov	r0, #0	@,
	bx	lr	@
	.fnend
	.size	main, .-main
	.ident	"GCC: ( 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",%progbits
