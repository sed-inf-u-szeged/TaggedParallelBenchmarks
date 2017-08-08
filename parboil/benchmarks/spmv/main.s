	.file	"main.c"
	.section	.rodata
	.align 8
.LC0:
	.string	"CPU-based sparse matrix vector multiplication****"
	.align 8
.LC1:
	.string	"Original version by Li-Wen Chang <lchang20@illinois.edu> and Shengzhao Wu<wu14@illinois.edu>"
	.align 8
.LC2:
	.string	"This version maintained by Chris Rodrigues  ***********"
	.align 8
.LC3:
	.string	"Expecting two input filenames\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$448, %rsp
	movl	%edi, -436(%rbp)
	movq	%rsi, -448(%rbp)
	movl	$.LC0, %edi
	call	puts
	movl	$.LC1, %edi
	call	puts
	movl	$.LC2, %edi
	call	puts
	movq	-448(%rbp), %rdx
	leaq	-436(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	pb_ReadParameters
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L2
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L3
.L2:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$30, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L3:
	leaq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	pb_InitializeTimerSet
	leaq	-432(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movl	$1, -28(%rbp)
	leaq	-432(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	subq	$8, %rsp
	movl	-28(%rbp), %edx
	leaq	-76(%rbp), %rcx
	pushq	%rcx
	leaq	-84(%rbp), %rcx
	pushq	%rcx
	leaq	-72(%rbp), %rcx
	pushq	%rcx
	leaq	-80(%rbp), %rcx
	pushq	%rcx
	leaq	-132(%rbp), %rcx
	pushq	%rcx
	leaq	-120(%rbp), %rcx
	pushq	%rcx
	leaq	-104(%rbp), %rcx
	pushq	%rcx
	leaq	-128(%rbp), %rcx
	pushq	%rcx
	leaq	-112(%rbp), %rcx
	pushq	%rcx
	leaq	-96(%rbp), %rcx
	pushq	%rcx
	pushq	$1
	movl	$0, %r9d
	movl	$1, %r8d
	movl	$1, %ecx
	movl	$1, %esi
	movq	%rax, %rdi
	call	coo_to_jds
	addq	$96, %rsp
	movl	-80(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movl	-80(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -48(%rbp)
	movl	-80(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z9input_vecPcPfi
	leaq	-432(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movl	$0, -4(%rbp)
	jmp	.L4
.L9:
	movl	$0, -8(%rbp)
	jmp	.L5
.L8:
	movl	.LC4(%rip), %eax
	movl	%eax, -16(%rbp)
	movq	-128(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -52(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L6
.L7:
	movq	-112(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -56(%rbp)
	movq	-104(%rbp), %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -60(%rbp)
	movq	-96(%rbp), %rax
	movl	-56(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -64(%rbp)
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -68(%rbp)
	movss	-64(%rbp), %xmm0
	mulss	-68(%rbp), %xmm0
	movss	-16(%rbp), %xmm1
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movl	%eax, -16(%rbp)
	addl	$1, -12(%rbp)
.L6:
	movl	-12(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L7
	movq	-120(%rbp), %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	(%rax), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-16(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -8(%rbp)
.L5:
	movl	-80(%rbp), %eax
	cmpl	%eax, -8(%rbp)
	jl	.L8
	addl	$1, -4(%rbp)
.L4:
	cmpl	$49, -4(%rbp)
	jle	.L9
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L10
	leaq	-432(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movl	-80(%rbp), %edx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z10outputDataPcPfi
.L10:
	leaq	-432(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leaq	-432(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	leaq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	pb_PrintTimerSet
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	pb_FreeParameters
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC4:
	.long	0
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
