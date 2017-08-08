	.file	"kernel_cpu.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Time spent in different stages of CPU/MCPU KERNEL:"
	.align 8
.LC3:
	.string	"%15.12f s, %15.12f % : CPU/MCPU: VARIABLES\n"
	.align 8
.LC4:
	.string	"%15.12f s, %15.12f % : MCPU: SET DEVICE\n"
	.align 8
.LC5:
	.string	"%15.12f s, %15.12f % : CPU/MCPU: INPUTS\n"
	.align 8
.LC6:
	.string	"%15.12f s, %15.12f % : CPU/MCPU: KERNEL\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC7:
	.string	"Total time:"
.LC8:
	.string	"%.12f s\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	kernel_cpu
	.type	kernel_cpu, @function
kernel_cpu:
.LFB22:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
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
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	224(%rsp), %rax
	movsd	%xmm0, (%rsp)
	movq	%rdi, 104(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rdx, 112(%rsp)
	movq	%rcx, 120(%rsp)
	movq	%rax, %rbx
	movq	%rax, 64(%rsp)
	call	get_time
	movq	%rax, 72(%rsp)
	call	get_time
	movq	%rax, 80(%rsp)
	call	get_time
	movq	%rax, 88(%rsp)
	call	get_time
	movsd	(%rsp), %xmm0
	testq	%rbx, %rbx
	movq	%rax, 96(%rsp)
	movq	%r14, 24(%rsp)
	movapd	%xmm0, %xmm1
	movq	$0, 40(%rsp)
	addsd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, (%rsp)
	jle	.L5
.L14:
	movq	24(%rsp), %rcx
	movq	16(%rcx), %rax
	movl	24(%rcx), %esi
	movq	%rax, %rdx
	salq	$5, %rdx
	testl	%esi, %esi
	js	.L12
	leaq	44(%rcx), %rdi
	movq	120(%rsp), %rcx
	movq	56(%rsp), %rsi
	movl	$0, 36(%rsp)
	movq	%rdi, 48(%rsp)
	leaq	(%rcx,%rdx), %rdi
	movq	%rdi, 128(%rsp)
	leaq	8(%rsi,%rdx), %rdi
	leaq	3200(%rcx,%rdx), %rdx
	movq	%rdi, 136(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rdi, %r14
.L6:
	movq	112(%rsp), %rcx
	movq	%rax, %rsi
	movq	128(%rsp), %r15
	salq	$5, %rsi
	movq	%r14, %r13
	leaq	(%rcx,%rax,8), %r12
	movq	56(%rsp), %rax
	leaq	8(%rax,%rsi), %rdx
	leaq	3208(%rax,%rsi), %rbx
	movq	%rdx, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L8:
	movq	8(%rsp), %rbp
	movq	%r12, %r14
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	0(%rbp), %xmm2
	addq	$32, %rbp
	movsd	0(%r13), %xmm3
	addq	$8, %r14
	movsd	8(%r13), %xmm1
	mulsd	%xmm3, %xmm2
	mulsd	-24(%rbp), %xmm1
	movsd	-8(%r13), %xmm0
	movapd	%xmm2, %xmm3
	movsd	-16(%rbp), %xmm2
	addsd	-40(%rbp), %xmm0
	addsd	%xmm1, %xmm3
	movsd	16(%r13), %xmm1
	mulsd	%xmm1, %xmm2
	addsd	%xmm2, %xmm3
	subsd	%xmm3, %xmm0
	mulsd	(%rsp), %xmm0
	xorpd	.LC9(%rip), %xmm0
	call	exp
	movapd	%xmm0, %xmm1
	movsd	0(%r13), %xmm4
	addsd	%xmm0, %xmm1
	mulsd	-8(%r14), %xmm0
	subsd	-32(%rbp), %xmm4
	movsd	8(%r13), %xmm3
	movsd	16(%r13), %xmm2
	subsd	-24(%rbp), %xmm3
	subsd	-16(%rbp), %xmm2
	addsd	(%r15), %xmm0
	mulsd	%xmm1, %xmm4
	mulsd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm1
	movsd	%xmm0, (%r15)
	movsd	8(%r15), %xmm0
	mulsd	-8(%r14), %xmm4
	addsd	%xmm4, %xmm0
	movsd	%xmm0, 8(%r15)
	movsd	16(%r15), %xmm0
	mulsd	-8(%r14), %xmm3
	addsd	%xmm3, %xmm0
	movsd	%xmm0, 16(%r15)
	mulsd	-8(%r14), %xmm1
	cmpq	%rbx, %rbp
	addsd	24(%r15), %xmm1
	movsd	%xmm1, 24(%r15)
	jne	.L9
	addq	$32, %r13
	addq	$32, %r15
	cmpq	16(%rsp), %r15
	jne	.L8
	movq	24(%rsp), %rsi
	addl	$1, 36(%rsp)
	movl	36(%rsp), %eax
	cmpl	%eax, 24(%rsi)
	jl	.L12
	movl	36(%rsp), %edx
	movq	%rsi, %rax
	testl	%edx, %edx
	je	.L7
	movq	48(%rsp), %rax
	movslq	(%rax), %rax
	leaq	(%rax,%rax,4), %rdx
	leaq	(%rax,%rdx,8), %rax
	salq	$4, %rax
	addq	104(%rsp), %rax
.L7:
	movq	16(%rax), %rax
	addq	$24, 48(%rsp)
	movq	136(%rsp), %r14
	jmp	.L6
.L12:
	addq	$1, 40(%rsp)
	addq	$656, 24(%rsp)
	movq	40(%rsp), %rax
	cmpq	64(%rsp), %rax
	jne	.L14
.L5:
	call	get_time
	movl	$.LC0, %edi
	movq	%rax, %rbx
	call	puts
	movq	80(%rsp), %r14
	movq	72(%rsp), %rsi
	movl	$.LC3, %edi
	pxor	%xmm0, %xmm0
	pxor	%xmm6, %xmm6
	movq	%r14, %rax
	subq	%rsi, %rax
	cvtsi2ssq	%rax, %xmm0
	movq	%rbx, %rax
	subq	%rsi, %rax
	cvtsi2ssq	%rax, %xmm6
	movl	$2, %eax
	movaps	%xmm0, %xmm1
	divss	.LC2(%rip), %xmm0
	movss	%xmm6, (%rsp)
	divss	%xmm6, %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulss	.LC1(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	call	printf
	movq	88(%rsp), %r15
	pxor	%xmm0, %xmm0
	movl	$.LC4, %edi
	movl	$2, %eax
	movq	%r15, %rcx
	subq	%r14, %rcx
	cvtsi2ssq	%rcx, %xmm0
	movaps	%xmm0, %xmm1
	divss	.LC2(%rip), %xmm0
	divss	(%rsp), %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulss	.LC1(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	call	printf
	movq	96(%rsp), %r14
	pxor	%xmm0, %xmm0
	movl	$.LC5, %edi
	movq	%r14, %rax
	subq	%r14, %rbx
	subq	%r15, %rax
	cvtsi2ssq	%rax, %xmm0
	movl	$2, %eax
	movaps	%xmm0, %xmm1
	divss	.LC2(%rip), %xmm0
	divss	(%rsp), %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulss	.LC1(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	call	printf
	pxor	%xmm0, %xmm0
	movl	$.LC6, %edi
	movl	$2, %eax
	cvtsi2ssq	%rbx, %xmm0
	movaps	%xmm0, %xmm1
	divss	.LC2(%rip), %xmm0
	divss	(%rsp), %xmm1
	cvtss2sd	%xmm0, %xmm0
	mulss	.LC1(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	call	printf
	movl	$.LC7, %edi
	call	puts
	movss	(%rsp), %xmm6
	movl	$.LC8, %edi
	divss	.LC2(%rip), %xmm6
	addq	$152, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
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
	cvtss2sd	%xmm6, %xmm0
	jmp	printf
	.cfi_endproc
.LFE22:
	.size	kernel_cpu, .-kernel_cpu
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1120403456
	.align 4
.LC2:
	.long	1232348160
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC9:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
