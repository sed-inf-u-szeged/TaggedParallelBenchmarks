	.file	"bfs.cpp"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Usage: %s <num_threads> <input_file>\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	_Z5UsageiPPc
	.type	_Z5UsageiPPc, @function
_Z5UsageiPPc:
.LFB36:
	.file 1 "bfs.cpp"
	.loc 1 23 0
	.cfi_startproc
.LVL0:
	.loc 1 25 0
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
.LVL1:
	movl	$.LC0, %esi
.LVL2:
	xorl	%eax, %eax
	jmp	fprintf
.LVL3:
	.cfi_endproc
.LFE36:
	.size	_Z5UsageiPPc, .-_Z5UsageiPPc
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Reading File"
.LC3:
	.string	"r"
.LC4:
	.string	"Error Reading graph file"
.LC5:
	.string	"%d"
.LC6:
	.string	"%d %d"
.LC7:
	.string	"Start traversing the tree"
.LC8:
	.string	"w"
.LC9:
	.string	"result.txt"
.LC10:
	.string	"Result stored in result.txt"
.LC11:
	.string	"%d) cost:%d\n"
	.section	.text.unlikely
.LCOLDB12:
	.text
.LHOTB12:
	.p2align 4,,15
	.globl	_Z8BFSGraphiPPc
	.type	_Z8BFSGraphiPPc, @function
_Z8BFSGraphiPPc:
.LFB38:
	.loc 1 42 0
	.cfi_startproc
.LVL4:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
.LBB18:
	.loc 1 46 0
	cmpl	$3, %edi
	jne	.L41
.LVL5:
.LBB19:
.LBB20:
	.file 2 "/usr/include/stdlib.h"
	.loc 2 286 0
	movq	8(%rsi), %rdi
.LVL6:
	movl	$10, %edx
	xorl	%esi, %esi
.LVL7:
	call	strtol
.LVL8:
.LBE20:
.LBE19:
	.loc 1 52 0
	movq	16(%rbx), %rbx
.LVL9:
	.loc 1 54 0
	movl	$.LC2, %edi
	call	puts
.LVL10:
	.loc 1 56 0
	movl	$.LC3, %esi
	movq	%rbx, %rdi
	call	fopen
.LVL11:
	.loc 1 57 0
	testq	%rax, %rax
	.loc 1 56 0
	movq	%rax, fp(%rip)
	.loc 1 57 0
	je	.L42
	.loc 1 65 0
	movl	$no_of_nodes, %edx
	movl	$.LC5, %esi
	movq	%rax, %rdi
	xorl	%eax, %eax
	.loc 1 63 0
	movl	$0, 44(%rsp)
	.loc 1 65 0
	call	fscanf
.LVL12:
	.loc 1 68 0
	movslq	no_of_nodes(%rip), %rbx
.LVL13:
	leaq	0(,%rbx,8), %rdi
	movq	%rbx, %rbp
	call	malloc
.LVL14:
	.loc 1 69 0
	movq	%rbx, %rdi
	.loc 1 68 0
	movq	%rax, %r14
.LVL15:
	.loc 1 69 0
	call	malloc
.LVL16:
	.loc 1 70 0
	movq	%rbx, %rdi
	.loc 1 69 0
	movq	%rax, %r13
.LVL17:
	.loc 1 70 0
	call	malloc
.LVL18:
	.loc 1 71 0
	movq	%rbx, %rdi
	.loc 1 70 0
	movq	%rax, %r12
.LVL19:
	.loc 1 71 0
	call	malloc
.LVL20:
.LBB21:
	.loc 1 75 0
	testl	%ebp, %ebp
.LBE21:
	.loc 1 71 0
	movq	%rax, %rbx
.LVL21:
.LBB22:
	.loc 1 75 0
	je	.L9
	xorl	%ebp, %ebp
.LVL22:
	.p2align 4,,10
	.p2align 3
.L6:
	.loc 1 77 0
	movq	fp(%rip), %rdi
	leaq	52(%rsp), %rcx
	leaq	48(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC6, %esi
	call	fscanf
.LVL23:
	.loc 1 78 0
	movl	%ebp, %eax
	movl	48(%rsp), %ecx
	.loc 1 75 0
	addl	$1, %ebp
.LVL24:
	.loc 1 78 0
	leaq	(%r14,%rax,8), %rdx
	.loc 1 75 0
	cmpl	%ebp, no_of_nodes(%rip)
	.loc 1 80 0
	movb	$0, 0(%r13,%rax)
	.loc 1 81 0
	movb	$0, (%r12,%rax)
	.loc 1 82 0
	movb	$0, (%rbx,%rax)
	.loc 1 78 0
	movl	%ecx, (%rdx)
	.loc 1 79 0
	movl	52(%rsp), %ecx
	movl	%ecx, 4(%rdx)
	.loc 1 75 0
	ja	.L6
.LVL25:
.L9:
.LBE22:
	.loc 1 86 0
	movq	fp(%rip), %rdi
	leaq	44(%rsp), %rdx
	movl	$.LC5, %esi
	xorl	%eax, %eax
	call	fscanf
.LVL26:
	.loc 1 93 0
	movq	fp(%rip), %rdi
	movl	$edge_list_size, %edx
	movl	$.LC5, %esi
	xorl	%eax, %eax
	.loc 1 91 0
	movb	$1, (%rbx)
	.loc 1 87 0
	movl	$0, 44(%rsp)
	.loc 1 90 0
	movb	$1, 0(%r13)
	.loc 1 93 0
	call	fscanf
.LVL27:
	.loc 1 96 0
	movslq	edge_list_size(%rip), %rdi
	movq	%rdi, %rbp
	salq	$2, %rdi
	call	malloc
.LVL28:
.LBB23:
	.loc 1 97 0
	testl	%ebp, %ebp
.LBE23:
	.loc 1 96 0
	movq	%rax, %r15
.LVL29:
.LBB24:
	.loc 1 97 0
	jle	.L8
	movq	%rax, %rcx
	xorl	%ebp, %ebp
.LVL30:
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 99 0
	movq	fp(%rip), %rdi
	leaq	56(%rsp), %rdx
	movl	$.LC5, %esi
	xorl	%eax, %eax
	movq	%rcx, 8(%rsp)
.LVL31:
	.loc 1 97 0
	addl	$1, %ebp
.LVL32:
	.loc 1 99 0
	call	fscanf
.LVL33:
	.loc 1 100 0
	movq	fp(%rip), %rdi
	leaq	60(%rsp), %rdx
	xorl	%eax, %eax
	movl	$.LC5, %esi
	call	fscanf
.LVL34:
	.loc 1 101 0
	movq	8(%rsp), %rcx
	movl	56(%rsp), %eax
	addq	$4, %rcx
	movl	%eax, -4(%rcx)
	.loc 1 97 0
	cmpl	%ebp, edge_list_size(%rip)
	jg	.L12
.LVL35:
.L8:
.LBE24:
	.loc 1 104 0
	movq	fp(%rip), %rdi
	testq	%rdi, %rdi
	je	.L11
	.loc 1 105 0
	call	fclose
.LVL36:
.L11:
	.loc 1 108 0
	movslq	no_of_nodes(%rip), %rdi
	movl	%edi, 8(%rsp)
	salq	$2, %rdi
	call	malloc
.LVL37:
.LBB25:
	.loc 1 109 0
	movl	8(%rsp), %edx
.LBE25:
	.loc 1 108 0
	movq	%rax, %rbp
.LVL38:
.LBB26:
	.loc 1 109 0
	testl	%edx, %edx
	jle	.L16
	subl	$1, %edx
	leaq	4(%rbp,%rdx,4), %rdx
.LVL39:
	.p2align 4,,10
	.p2align 3
.L15:
	.loc 1 110 0 discriminator 3
	movl	$-1, (%rax)
	addq	$4, %rax
	.loc 1 109 0 discriminator 3
	cmpq	%rdx, %rax
	jne	.L15
.L16:
.LBE26:
	.loc 1 111 0
	movslq	44(%rsp), %rax
	.loc 1 113 0
	movl	$.LC7, %edi
	.loc 1 111 0
	movl	$0, 0(%rbp,%rax,4)
	.loc 1 113 0
	call	puts
.LVL40:
	movl	no_of_nodes(%rip), %r9d
	.p2align 4,,10
	.p2align 3
.L14:
.LVL41:
.LBB27:
	.loc 1 128 0
	testl	%r9d, %r9d
	jle	.L17
	xorl	%eax, %eax
.LVL42:
	.p2align 4,,10
	.p2align 3
.L19:
.LBB28:
	.loc 1 130 0
	cmpb	$0, 0(%r13,%rax)
	je	.L21
.LBB29:
.LBB30:
	.loc 1 132 0
	movl	(%r14,%rax,8), %esi
.LVL43:
	movl	4(%r14,%rax,8), %ecx
.LBE30:
	.loc 1 131 0
	movb	$0, 0(%r13,%rax)
.LBB32:
	.loc 1 132 0
	addl	%esi, %ecx
	cmpl	%ecx, %esi
	jge	.L21
	subl	%esi, %ecx
	movslq	%esi, %rdi
	subl	$1, %ecx
	leaq	(%r15,%rdi,4), %rdx
	leaq	1(%rdi,%rcx), %rcx
	leaq	(%r15,%rcx,4), %rdi
.LVL44:
	.p2align 4,,10
	.p2align 3
.L23:
.LBB31:
	.loc 1 135 0
	movslq	(%rdx), %rcx
	cmpb	$0, (%rbx,%rcx)
	jne	.L22
	.loc 1 137 0
	movl	0(%rbp,%rax,4), %esi
	.loc 1 138 0
	movb	$1, (%r12,%rcx)
	.loc 1 137 0
	addl	$1, %esi
	movl	%esi, 0(%rbp,%rcx,4)
.L22:
	addq	$4, %rdx
.LVL45:
.LBE31:
	.loc 1 132 0 discriminator 2
	cmpq	%rdi, %rdx
	jne	.L23
.LVL46:
.L21:
	addq	$1, %rax
.LVL47:
.LBE32:
.LBE29:
.LBE28:
	.loc 1 128 0
	cmpl	%eax, %r9d
	jg	.L19
	xorl	%eax, %eax
	xorl	%edx, %edx
.LVL48:
	.p2align 4,,10
	.p2align 3
.L20:
.LBE27:
.LBB33:
	.loc 1 150 0
	cmpb	$0, (%r12,%rax)
	je	.L26
	.loc 1 151 0
	movb	$1, 0(%r13,%rax)
	.loc 1 152 0
	movb	$1, (%rbx,%rax)
.LVL49:
	.loc 1 153 0
	movl	$1, %edx
	.loc 1 154 0
	movb	$0, (%r12,%rax)
.LVL50:
.L26:
	addq	$1, %rax
.LVL51:
	.loc 1 148 0 discriminator 2
	cmpl	%eax, %r9d
	jg	.L20
.LBE33:
	.loc 1 117 0
	testb	%dl, %dl
	jne	.L14
.LVL52:
.L17:
	.loc 1 164 0
	movl	$.LC8, %esi
	movl	$.LC9, %edi
	call	fopen
.LVL53:
	movq	%rax, 24(%rsp)
.LVL54:
.LBB34:
	.loc 1 165 0
	movl	no_of_nodes(%rip), %eax
	xorl	%r9d, %r9d
	movq	%rbp, %r10
	testl	%eax, %eax
	jle	.L25
.LVL55:
	.p2align 4,,10
	.p2align 3
.L29:
	.loc 1 166 0
	movl	(%r10), %ecx
	movq	24(%rsp), %rdi
	movl	%r9d, %edx
	xorl	%eax, %eax
	movl	$.LC11, %esi
	movq	%r10, 16(%rsp)
	movl	%r9d, 8(%rsp)
	call	fprintf
.LVL56:
	.loc 1 165 0
	movl	8(%rsp), %r9d
	movq	16(%rsp), %r10
	addl	$1, %r9d
.LVL57:
	addq	$4, %r10
	cmpl	%r9d, no_of_nodes(%rip)
	jg	.L29
.LVL58:
.L25:
.LBE34:
	.loc 1 167 0
	movq	24(%rsp), %rdi
	call	fclose
.LVL59:
	.loc 1 168 0
	movl	$.LC10, %edi
	call	puts
.LVL60:
	.loc 1 172 0
	movq	%r14, %rdi
	call	free
.LVL61:
	.loc 1 173 0
	movq	%r15, %rdi
	call	free
.LVL62:
	.loc 1 174 0
	movq	%r13, %rdi
	call	free
.LVL63:
	.loc 1 175 0
	movq	%r12, %rdi
	call	free
.LVL64:
	.loc 1 176 0
	movq	%rbx, %rdi
	call	free
.LVL65:
.LBE18:
	.loc 1 179 0
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
.LBB37:
	.loc 1 177 0
	movq	%rbp, %rdi
.LBE37:
	.loc 1 179 0
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL66:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL67:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL68:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL69:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL70:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL71:
.LBB38:
	.loc 1 177 0
	jmp	free
.LVL72:
.L42:
	.cfi_restore_state
	.loc 1 59 0
	movl	$.LC4, %edi
	call	puts
.LVL73:
.LBE38:
	.loc 1 179 0
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL74:
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.LVL75:
.L41:
	.cfi_restore_state
.LBB39:
.LBB35:
.LBB36:
	.loc 1 25 0
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
.LVL76:
	movl	$.LC0, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL77:
.LBE36:
.LBE35:
	.loc 1 48 0
	xorl	%edi, %edi
	call	exit
.LVL78:
.LBE39:
	.cfi_endproc
.LFE38:
	.size	_Z8BFSGraphiPPc, .-_Z8BFSGraphiPPc
	.section	.text.unlikely
.LCOLDE12:
	.text
.LHOTE12:
	.section	.text.unlikely
.LCOLDB13:
	.section	.text.startup,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB37:
	.loc 1 32 0
	.cfi_startproc
.LVL79:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 33 0
	movl	$0, no_of_nodes(%rip)
	.loc 1 34 0
	movl	$0, edge_list_size(%rip)
	.loc 1 35 0
	call	_Z8BFSGraphiPPc
.LVL80:
	.loc 1 36 0
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE13:
	.section	.text.startup
.LHOTE13:
	.globl	fp
	.bss
	.align 8
	.type	fp, @object
	.size	fp, 8
fp:
	.zero	8
	.globl	edge_list_size
	.align 4
	.type	edge_list_size, @object
	.size	edge_list_size, 4
edge_list_size:
	.zero	4
	.globl	no_of_nodes
	.align 4
	.type	no_of_nodes, @object
	.size	no_of_nodes, 4
no_of_nodes:
	.zero	4
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 3 "/opt/gcc-4.9.1/lib/gcc/x86_64-unknown-linux-gnu/4.9.1/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/libio.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xadf
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF88
	.byte	0x4
	.long	.LASF89
	.long	.LASF90
	.long	.Ldebug_ranges0+0x110
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd4
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x8d
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x8e
	.long	0x65
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x5
	.byte	0x31
	.long	0xa3
	.uleb128 0x7
	.long	.LASF42
	.byte	0xd8
	.byte	0x6
	.value	0x10f
	.long	0x22a
	.uleb128 0x8
	.long	.LASF13
	.byte	0x6
	.value	0x110
	.long	0x5e
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x6
	.value	0x115
	.long	0x8b
	.byte	0x8
	.uleb128 0x8
	.long	.LASF15
	.byte	0x6
	.value	0x116
	.long	0x8b
	.byte	0x10
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.value	0x117
	.long	0x8b
	.byte	0x18
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.value	0x118
	.long	0x8b
	.byte	0x20
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.value	0x119
	.long	0x8b
	.byte	0x28
	.uleb128 0x8
	.long	.LASF19
	.byte	0x6
	.value	0x11a
	.long	0x8b
	.byte	0x30
	.uleb128 0x8
	.long	.LASF20
	.byte	0x6
	.value	0x11b
	.long	0x8b
	.byte	0x38
	.uleb128 0x8
	.long	.LASF21
	.byte	0x6
	.value	0x11c
	.long	0x8b
	.byte	0x40
	.uleb128 0x8
	.long	.LASF22
	.byte	0x6
	.value	0x11e
	.long	0x8b
	.byte	0x48
	.uleb128 0x8
	.long	.LASF23
	.byte	0x6
	.value	0x11f
	.long	0x8b
	.byte	0x50
	.uleb128 0x8
	.long	.LASF24
	.byte	0x6
	.value	0x120
	.long	0x8b
	.byte	0x58
	.uleb128 0x8
	.long	.LASF25
	.byte	0x6
	.value	0x122
	.long	0x262
	.byte	0x60
	.uleb128 0x8
	.long	.LASF26
	.byte	0x6
	.value	0x124
	.long	0x268
	.byte	0x68
	.uleb128 0x8
	.long	.LASF27
	.byte	0x6
	.value	0x126
	.long	0x5e
	.byte	0x70
	.uleb128 0x8
	.long	.LASF28
	.byte	0x6
	.value	0x12a
	.long	0x5e
	.byte	0x74
	.uleb128 0x8
	.long	.LASF29
	.byte	0x6
	.value	0x12c
	.long	0x6c
	.byte	0x78
	.uleb128 0x8
	.long	.LASF30
	.byte	0x6
	.value	0x130
	.long	0x42
	.byte	0x80
	.uleb128 0x8
	.long	.LASF31
	.byte	0x6
	.value	0x131
	.long	0x50
	.byte	0x82
	.uleb128 0x8
	.long	.LASF32
	.byte	0x6
	.value	0x132
	.long	0x26e
	.byte	0x83
	.uleb128 0x8
	.long	.LASF33
	.byte	0x6
	.value	0x136
	.long	0x27e
	.byte	0x88
	.uleb128 0x8
	.long	.LASF34
	.byte	0x6
	.value	0x13f
	.long	0x77
	.byte	0x90
	.uleb128 0x8
	.long	.LASF35
	.byte	0x6
	.value	0x148
	.long	0x89
	.byte	0x98
	.uleb128 0x8
	.long	.LASF36
	.byte	0x6
	.value	0x149
	.long	0x89
	.byte	0xa0
	.uleb128 0x8
	.long	.LASF37
	.byte	0x6
	.value	0x14a
	.long	0x89
	.byte	0xa8
	.uleb128 0x8
	.long	.LASF38
	.byte	0x6
	.value	0x14b
	.long	0x89
	.byte	0xb0
	.uleb128 0x8
	.long	.LASF39
	.byte	0x6
	.value	0x14c
	.long	0x29
	.byte	0xb8
	.uleb128 0x8
	.long	.LASF40
	.byte	0x6
	.value	0x14e
	.long	0x5e
	.byte	0xc0
	.uleb128 0x8
	.long	.LASF41
	.byte	0x6
	.value	0x150
	.long	0x284
	.byte	0xc4
	.byte	0
	.uleb128 0x9
	.long	.LASF91
	.byte	0x6
	.byte	0xb4
	.uleb128 0xa
	.long	.LASF43
	.byte	0x18
	.byte	0x6
	.byte	0xba
	.long	0x262
	.uleb128 0xb
	.long	.LASF44
	.byte	0x6
	.byte	0xbb
	.long	0x262
	.byte	0
	.uleb128 0xb
	.long	.LASF45
	.byte	0x6
	.byte	0xbc
	.long	0x268
	.byte	0x8
	.uleb128 0xb
	.long	.LASF46
	.byte	0x6
	.byte	0xc0
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x231
	.uleb128 0x6
	.byte	0x8
	.long	0xa3
	.uleb128 0xc
	.long	0x91
	.long	0x27e
	.uleb128 0xd
	.long	0x82
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22a
	.uleb128 0xc
	.long	0x91
	.long	0x294
	.uleb128 0xd
	.long	0x82
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x29a
	.uleb128 0xe
	.long	0x91
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF47
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.long	.LASF48
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF49
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF50
	.uleb128 0xa
	.long	.LASF51
	.byte	0x8
	.byte	0x1
	.byte	0xf
	.long	0x2e0
	.uleb128 0xb
	.long	.LASF52
	.byte	0x1
	.byte	0x11
	.long	0x5e
	.byte	0
	.uleb128 0xb
	.long	.LASF53
	.byte	0x1
	.byte	0x12
	.long	0x5e
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.long	.LASF86
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.long	0x303
	.uleb128 0x10
	.long	.LASF54
	.byte	0x1
	.byte	0x17
	.long	0x5e
	.uleb128 0x10
	.long	.LASF55
	.byte	0x1
	.byte	0x17
	.long	0x303
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x8b
	.uleb128 0x11
	.long	.LASF78
	.byte	0x2
	.value	0x11c
	.long	0x5e
	.byte	0x3
	.long	0x327
	.uleb128 0x12
	.long	.LASF56
	.byte	0x2
	.value	0x11c
	.long	0x294
	.byte	0
	.uleb128 0x13
	.long	0x2e0
	.long	.LASF92
	.quad	.LFB36
	.quad	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.long	0x374
	.uleb128 0x14
	.long	0x2ec
	.long	.LLST0
	.uleb128 0x14
	.long	0x2f7
	.long	.LLST1
	.uleb128 0x15
	.quad	.LVL3
	.long	0xa0e
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF71
	.byte	0x1
	.byte	0x29
	.long	.LASF93
	.quad	.LFB38
	.quad	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.long	0x934
	.uleb128 0x18
	.long	.LASF54
	.byte	0x1
	.byte	0x29
	.long	0x5e
	.long	.LLST2
	.uleb128 0x18
	.long	.LASF55
	.byte	0x1
	.byte	0x29
	.long	0x303
	.long	.LLST3
	.uleb128 0x19
	.long	.Ldebug_ranges0+0
	.uleb128 0x1a
	.long	.LASF57
	.byte	0x1
	.byte	0x2b
	.long	0x8b
	.long	.LLST4
	.uleb128 0x1b
	.long	.LASF68
	.byte	0x1
	.byte	0x2c
	.long	0x5e
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x1
	.byte	0x3f
	.long	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x1a
	.long	.LASF59
	.byte	0x1
	.byte	0x44
	.long	0x934
	.long	.LLST5
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.byte	0x45
	.long	0x93a
	.long	.LLST6
	.uleb128 0x1a
	.long	.LASF61
	.byte	0x1
	.byte	0x46
	.long	0x93a
	.long	.LLST7
	.uleb128 0x1a
	.long	.LASF62
	.byte	0x1
	.byte	0x47
	.long	0x93a
	.long	.LLST8
	.uleb128 0x1c
	.long	.LASF63
	.byte	0x1
	.byte	0x49
	.long	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x1c
	.long	.LASF64
	.byte	0x1
	.byte	0x49
	.long	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.uleb128 0x1d
	.string	"id"
	.byte	0x1
	.byte	0x5f
	.long	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1c
	.long	.LASF65
	.byte	0x1
	.byte	0x5f
	.long	0x5e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1a
	.long	.LASF66
	.byte	0x1
	.byte	0x60
	.long	0x947
	.long	.LLST9
	.uleb128 0x1a
	.long	.LASF67
	.byte	0x1
	.byte	0x6c
	.long	0x947
	.long	.LLST10
	.uleb128 0x1e
	.string	"k"
	.byte	0x1
	.byte	0x72
	.long	0x5e
	.uleb128 0x1a
	.long	.LASF69
	.byte	0x1
	.byte	0x73
	.long	0x940
	.long	.LLST11
	.uleb128 0x1e
	.string	"fpo"
	.byte	0x1
	.byte	0xa4
	.long	0x94d
	.uleb128 0x1f
	.long	0x309
	.quad	.LBB19
	.quad	.LBE19-.LBB19
	.byte	0x1
	.byte	0x33
	.long	0x4d6
	.uleb128 0x14
	.long	0x31a
	.long	.LLST12
	.uleb128 0x20
	.quad	.LVL8
	.long	0xa2a
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x50
	.long	0x516
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.long	0x49
	.long	.LLST13
	.uleb128 0x20
	.quad	.LVL23
	.long	0xa49
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x3
	.byte	0x91
	.sleb128 -76
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x80
	.long	0x575
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x61
	.long	0x5e
	.long	.LLST14
	.uleb128 0x23
	.quad	.LVL33
	.long	0xa49
	.long	0x552
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x20
	.quad	.LVL34
	.long	0xa49
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -68
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.Ldebug_ranges0+0xb0
	.long	0x58c
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x6d
	.long	0x5e
	.long	.LLST15
	.byte	0
	.uleb128 0x24
	.quad	.LBB27
	.quad	.LBE27-.LBB27
	.long	0x5e4
	.uleb128 0x22
	.string	"tid"
	.byte	0x1
	.byte	0x80
	.long	0x5e
	.long	.LLST16
	.uleb128 0x19
	.long	.Ldebug_ranges0+0xe0
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0x84
	.long	0x5e
	.long	.LLST17
	.uleb128 0x25
	.quad	.LBB31
	.quad	.LBE31-.LBB31
	.uleb128 0x22
	.string	"id"
	.byte	0x1
	.byte	0x86
	.long	0x5e
	.long	.LLST18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
	.quad	.LBB33
	.quad	.LBE33-.LBB33
	.long	0x609
	.uleb128 0x22
	.string	"tid"
	.byte	0x1
	.byte	0x94
	.long	0x5e
	.long	.LLST19
	.byte	0
	.uleb128 0x24
	.quad	.LBB34
	.quad	.LBE34-.LBB34
	.long	0x658
	.uleb128 0x22
	.string	"i"
	.byte	0x1
	.byte	0xa5
	.long	0x5e
	.long	.LLST20
	.uleb128 0x20
	.quad	.LVL56
	.long	0xa0e
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -104
	.byte	0x6
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0x91
	.sleb128 -120
	.byte	0x94
	.byte	0x4
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	0x2e0
	.quad	.LBB35
	.quad	.LBE35-.LBB35
	.byte	0x1
	.byte	0x2f
	.long	0x69f
	.uleb128 0x26
	.long	0x2f7
	.uleb128 0x1
	.byte	0x53
	.uleb128 0x14
	.long	0x2ec
	.long	.LLST21
	.uleb128 0x20
	.quad	.LVL77
	.long	0xa0e
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.byte	0
	.uleb128 0x23
	.quad	.LVL10
	.long	0xa65
	.long	0x6be
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.uleb128 0x23
	.quad	.LVL11
	.long	0xa7c
	.long	0x6e3
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.byte	0
	.uleb128 0x23
	.quad	.LVL12
	.long	0xa49
	.long	0x70f
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	no_of_nodes
	.byte	0
	.uleb128 0x23
	.quad	.LVL14
	.long	0xa97
	.long	0x729
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x73
	.sleb128 0
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x23
	.quad	.LVL16
	.long	0xa97
	.long	0x741
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL18
	.long	0xa97
	.long	0x759
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL20
	.long	0xa97
	.long	0x771
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL26
	.long	0xa49
	.long	0x797
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.uleb128 0x23
	.quad	.LVL27
	.long	0xa49
	.long	0x7c3
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	edge_list_size
	.byte	0
	.uleb128 0x23
	.quad	.LVL28
	.long	0xa97
	.long	0x7dd
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x76
	.sleb128 0
	.byte	0x32
	.byte	0x24
	.byte	0
	.uleb128 0x27
	.quad	.LVL36
	.long	0xaad
	.uleb128 0x27
	.quad	.LVL37
	.long	0xa97
	.uleb128 0x23
	.quad	.LVL40
	.long	0xa65
	.long	0x816
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x23
	.quad	.LVL53
	.long	0xa7c
	.long	0x842
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x23
	.quad	.LVL59
	.long	0xaad
	.long	0x85c
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -104
	.byte	0x6
	.byte	0
	.uleb128 0x23
	.quad	.LVL60
	.long	0xa65
	.long	0x87b
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.uleb128 0x23
	.quad	.LVL61
	.long	0xac2
	.long	0x893
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL62
	.long	0xac2
	.long	0x8ab
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL63
	.long	0xac2
	.long	0x8c3
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL64
	.long	0xac2
	.long	0x8db
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x23
	.quad	.LVL65
	.long	0xac2
	.long	0x8f3
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x28
	.quad	.LVL72
	.long	0xac2
	.uleb128 0x23
	.quad	.LVL73
	.long	0xa65
	.long	0x91f
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.byte	0
	.uleb128 0x20
	.quad	.LVL78
	.long	0xad4
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2bb
	.uleb128 0x6
	.byte	0x8
	.long	0x940
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF70
	.uleb128 0x6
	.byte	0x8
	.long	0x5e
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0x29
	.long	.LASF72
	.byte	0x1
	.byte	0x1f
	.long	0x5e
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.long	0x9af
	.uleb128 0x18
	.long	.LASF54
	.byte	0x1
	.byte	0x1f
	.long	0x5e
	.long	.LLST22
	.uleb128 0x18
	.long	.LASF55
	.byte	0x1
	.byte	0x1f
	.long	0x303
	.long	.LLST23
	.uleb128 0x20
	.quad	.LVL80
	.long	0x374
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x2a
	.long	.LASF73
	.byte	0x5
	.byte	0xa5
	.long	0x268
	.uleb128 0x2a
	.long	.LASF74
	.byte	0x5
	.byte	0xa6
	.long	0x268
	.uleb128 0x2a
	.long	.LASF75
	.byte	0x5
	.byte	0xa7
	.long	0x268
	.uleb128 0x2b
	.long	.LASF76
	.byte	0x1
	.byte	0xa
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	no_of_nodes
	.uleb128 0x2b
	.long	.LASF77
	.byte	0x1
	.byte	0xb
	.long	0x5e
	.uleb128 0x9
	.byte	0x3
	.quad	edge_list_size
	.uleb128 0x2c
	.string	"fp"
	.byte	0x1
	.byte	0xc
	.long	0x94d
	.uleb128 0x9
	.byte	0x3
	.quad	fp
	.uleb128 0x2d
	.long	.LASF79
	.byte	0x5
	.value	0x161
	.long	0x5e
	.long	0xa2a
	.uleb128 0x2e
	.long	0x94d
	.uleb128 0x2e
	.long	0x294
	.uleb128 0x2f
	.byte	0
	.uleb128 0x30
	.long	.LASF80
	.byte	0x2
	.byte	0xb8
	.long	0x65
	.long	0xa49
	.uleb128 0x2e
	.long	0x294
	.uleb128 0x2e
	.long	0x303
	.uleb128 0x2e
	.long	0x5e
	.byte	0
	.uleb128 0x2d
	.long	.LASF81
	.byte	0x5
	.value	0x1ab
	.long	0x5e
	.long	0xa65
	.uleb128 0x2e
	.long	0x94d
	.uleb128 0x2e
	.long	0x294
	.uleb128 0x2f
	.byte	0
	.uleb128 0x31
	.long	.LASF82
	.long	.LASF94
	.long	0x5e
	.long	0xa7c
	.uleb128 0x2e
	.long	0x294
	.byte	0
	.uleb128 0x2d
	.long	.LASF83
	.byte	0x5
	.value	0x10d
	.long	0x94d
	.long	0xa97
	.uleb128 0x2e
	.long	0x294
	.uleb128 0x2e
	.long	0x294
	.byte	0
	.uleb128 0x2d
	.long	.LASF84
	.byte	0x2
	.value	0x1d7
	.long	0x89
	.long	0xaad
	.uleb128 0x2e
	.long	0x29
	.byte	0
	.uleb128 0x30
	.long	.LASF85
	.byte	0x5
	.byte	0xea
	.long	0x5e
	.long	0xac2
	.uleb128 0x2e
	.long	0x94d
	.byte	0
	.uleb128 0x32
	.long	.LASF87
	.byte	0x2
	.value	0x1e8
	.long	0xad4
	.uleb128 0x2e
	.long	0x89
	.byte	0
	.uleb128 0x33
	.long	.LASF95
	.byte	0x2
	.value	0x220
	.uleb128 0x2e
	.long	0x5e
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
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
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x2115
	.uleb128 0x19
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
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
	.uleb128 0x2b
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2c
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x31
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LFE36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x54
	.quad	.LVL2
	.quad	.LFE36
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL4
	.quad	.LVL6
	.value	0x1
	.byte	0x55
	.quad	.LVL6
	.quad	.LVL75
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL75
	.quad	.LVL76
	.value	0x1
	.byte	0x55
	.quad	.LVL76
	.quad	.LFE38
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL4
	.quad	.LVL7
	.value	0x1
	.byte	0x54
	.quad	.LVL7
	.quad	.LVL9
	.value	0x1
	.byte	0x53
	.quad	.LVL9
	.quad	.LVL75
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL75
	.quad	.LFE38
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL9
	.quad	.LVL13
	.value	0x1
	.byte	0x53
	.quad	.LVL72
	.quad	.LVL74
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL15
	.quad	.LVL16-1
	.value	0x1
	.byte	0x50
	.quad	.LVL16-1
	.quad	.LVL70
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL17
	.quad	.LVL18-1
	.value	0x1
	.byte	0x50
	.quad	.LVL18-1
	.quad	.LVL69
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL19
	.quad	.LVL20-1
	.value	0x1
	.byte	0x50
	.quad	.LVL20-1
	.quad	.LVL68
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL21
	.quad	.LVL22
	.value	0x1
	.byte	0x50
	.quad	.LVL22
	.quad	.LVL66
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL29
	.quad	.LVL30
	.value	0x1
	.byte	0x50
	.quad	.LVL30
	.quad	.LVL71
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL38
	.quad	.LVL39
	.value	0x1
	.byte	0x50
	.quad	.LVL39
	.quad	.LVL67
	.value	0x1
	.byte	0x56
	.quad	.LVL67
	.quad	.LVL72-1
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL41
	.quad	.LVL48
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL48
	.quad	.LVL49
	.value	0x1
	.byte	0x51
	.quad	.LVL49
	.quad	.LVL50
	.value	0x2
	.byte	0x31
	.byte	0x9f
	.quad	.LVL50
	.quad	.LVL52
	.value	0x1
	.byte	0x51
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL5
	.quad	.LVL7
	.value	0x2
	.byte	0x74
	.sleb128 8
	.quad	.LVL7
	.quad	.LVL8-1
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL21
	.quad	.LVL22
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL22
	.quad	.LVL25
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL29
	.quad	.LVL30
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL31
	.quad	.LVL32
	.value	0x1
	.byte	0x56
	.quad	.LVL32
	.quad	.LVL34
	.value	0x3
	.byte	0x76
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL34
	.quad	.LVL35
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL38
	.quad	.LVL39
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL41
	.quad	.LVL42
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL42
	.quad	.LVL46
	.value	0x1
	.byte	0x50
	.quad	.LVL46
	.quad	.LVL47
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL43
	.quad	.LVL44
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL44
	.quad	.LVL45
	.value	0x2
	.byte	0x71
	.sleb128 0
	.quad	.LVL45
	.quad	.LVL46
	.value	0x2
	.byte	0x71
	.sleb128 -4
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL48
	.quad	.LVL50
	.value	0x1
	.byte	0x50
	.quad	.LVL50
	.quad	.LVL51
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL54
	.quad	.LVL55
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL55
	.quad	.LVL56-1
	.value	0x1
	.byte	0x59
	.quad	.LVL56-1
	.quad	.LVL57
	.value	0x3
	.byte	0x91
	.sleb128 -120
	.quad	.LVL57
	.quad	.LVL58
	.value	0x1
	.byte	0x59
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL75
	.quad	.LVL76
	.value	0x1
	.byte	0x55
	.quad	.LVL76
	.quad	.LFE38
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL79
	.quad	.LVL80-1
	.value	0x1
	.byte	0x55
	.quad	.LVL80-1
	.quad	.LFE37
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL79
	.quad	.LVL80-1
	.value	0x1
	.byte	0x54
	.quad	.LVL80-1
	.quad	.LFE37
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB37
	.quad	.LFE37-.LFB37
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB18
	.quad	.LBE18
	.quad	.LBB37
	.quad	.LBE37
	.quad	.LBB38
	.quad	.LBE38
	.quad	.LBB39
	.quad	.LBE39
	.quad	0
	.quad	0
	.quad	.LBB21
	.quad	.LBE21
	.quad	.LBB22
	.quad	.LBE22
	.quad	0
	.quad	0
	.quad	.LBB23
	.quad	.LBE23
	.quad	.LBB24
	.quad	.LBE24
	.quad	0
	.quad	0
	.quad	.LBB25
	.quad	.LBE25
	.quad	.LBB26
	.quad	.LBE26
	.quad	0
	.quad	0
	.quad	.LBB30
	.quad	.LBE30
	.quad	.LBB32
	.quad	.LBE32
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB37
	.quad	.LFE37
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF83:
	.string	"fopen"
.LASF82:
	.string	"__builtin_puts"
.LASF76:
	.string	"no_of_nodes"
.LASF48:
	.string	"double"
.LASF42:
	.string	"_IO_FILE"
.LASF66:
	.string	"h_graph_edges"
.LASF24:
	.string	"_IO_save_end"
.LASF88:
	.string	"GNU C++ 4.9.1 -fpreprocessed -mtune=generic -march=x86-64 -g -O2 -std=c++11 -fopenmp -fpermissive"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF84:
	.string	"malloc"
.LASF62:
	.string	"h_graph_visited"
.LASF10:
	.string	"sizetype"
.LASF34:
	.string	"_offset"
.LASF52:
	.string	"starting"
.LASF51:
	.string	"Node"
.LASF72:
	.string	"main"
.LASF18:
	.string	"_IO_write_ptr"
.LASF13:
	.string	"_flags"
.LASF20:
	.string	"_IO_buf_base"
.LASF25:
	.string	"_markers"
.LASF15:
	.string	"_IO_read_end"
.LASF87:
	.string	"free"
.LASF70:
	.string	"bool"
.LASF61:
	.string	"h_updating_graph_mask"
.LASF47:
	.string	"float"
.LASF86:
	.string	"Usage"
.LASF49:
	.string	"long long int"
.LASF33:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF93:
	.string	"_Z8BFSGraphiPPc"
.LASF80:
	.string	"strtol"
.LASF30:
	.string	"_cur_column"
.LASF59:
	.string	"h_graph_nodes"
.LASF58:
	.string	"source"
.LASF46:
	.string	"_pos"
.LASF79:
	.string	"fprintf"
.LASF78:
	.string	"atoi"
.LASF17:
	.string	"_IO_write_base"
.LASF1:
	.string	"unsigned char"
.LASF95:
	.string	"exit"
.LASF45:
	.string	"_sbuf"
.LASF29:
	.string	"_old_offset"
.LASF85:
	.string	"fclose"
.LASF77:
	.string	"edge_list_size"
.LASF54:
	.string	"argc"
.LASF64:
	.string	"edgeno"
.LASF4:
	.string	"signed char"
.LASF50:
	.string	"long long unsigned int"
.LASF3:
	.string	"unsigned int"
.LASF43:
	.string	"_IO_marker"
.LASF32:
	.string	"_shortbuf"
.LASF0:
	.string	"long unsigned int"
.LASF94:
	.string	"puts"
.LASF55:
	.string	"argv"
.LASF90:
	.string	"/home/zealot/svn/columbus/branches/repara/deliverables/D7.3_benchmarks/rodinia_2.4/openmp/bfs"
.LASF14:
	.string	"_IO_read_ptr"
.LASF39:
	.string	"__pad5"
.LASF63:
	.string	"start"
.LASF21:
	.string	"_IO_buf_end"
.LASF89:
	.string	"bfs.cpp"
.LASF69:
	.string	"stop"
.LASF11:
	.string	"char"
.LASF65:
	.string	"cost"
.LASF81:
	.string	"fscanf"
.LASF68:
	.string	"num_omp_threads"
.LASF57:
	.string	"input_f"
.LASF44:
	.string	"_next"
.LASF35:
	.string	"__pad1"
.LASF36:
	.string	"__pad2"
.LASF37:
	.string	"__pad3"
.LASF38:
	.string	"__pad4"
.LASF53:
	.string	"no_of_edges"
.LASF2:
	.string	"short unsigned int"
.LASF75:
	.string	"stderr"
.LASF92:
	.string	"_Z5UsageiPPc"
.LASF19:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF27:
	.string	"_fileno"
.LASF26:
	.string	"_chain"
.LASF71:
	.string	"BFSGraph"
.LASF8:
	.string	"__off_t"
.LASF23:
	.string	"_IO_backup_base"
.LASF73:
	.string	"stdin"
.LASF28:
	.string	"_flags2"
.LASF40:
	.string	"_mode"
.LASF16:
	.string	"_IO_read_base"
.LASF31:
	.string	"_vtable_offset"
.LASF41:
	.string	"_unused2"
.LASF67:
	.string	"h_cost"
.LASF22:
	.string	"_IO_save_base"
.LASF12:
	.string	"FILE"
.LASF56:
	.string	"__nptr"
.LASF74:
	.string	"stdout"
.LASF60:
	.string	"h_graph_mask"
.LASF91:
	.string	"_IO_lock_t"
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
