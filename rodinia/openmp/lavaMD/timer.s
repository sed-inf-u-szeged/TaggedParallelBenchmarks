	.file	"timer.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	get_time
	.type	get_time, @function
get_time:
.LFB7:
	.cfi_startproc
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%esi, %esi
	movq	%rsp, %rdi
	call	gettimeofday
	imulq	$1000000, (%rsp), %rax
	addq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7:
	.size	get_time, .-get_time
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
