	.file	"kernels.c"
	.text
	.globl	_Z11cpu_stencilffPfS_iii
	.type	_Z11cpu_stencilffPfS_iii, @function
_Z11cpu_stencilffPfS_iii:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	%xmm1, -24(%rbp)
	movq	%rdi, -32(%rbp)
	movq	%rsi, -40(%rbp)
	movl	%edx, -44(%rbp)
	movl	%ecx, -48(%rbp)
	movl	%r8d, -52(%rbp)
	movl	$1, -4(%rbp)
	jmp	.L2
.L7:
	movl	$1, -8(%rbp)
	jmp	.L3
.L6:
	movl	$1, -12(%rbp)
	jmp	.L4
.L5:
	movl	-48(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rax, %rdx
	movl	-12(%rbp), %eax
	addl	$1, %eax
	imull	-48(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movl	-12(%rbp), %eax
	subl	$1, %eax
	imull	-48(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	addss	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-48(%rbp), %eax
	imull	-12(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	addss	%xmm1, %xmm0
	movl	-8(%rbp), %eax
	leal	-1(%rax), %ecx
	movl	-48(%rbp), %eax
	imull	-12(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	addss	%xmm1, %xmm0
	movl	-4(%rbp), %eax
	leal	1(%rax), %esi
	movl	-48(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	addss	%xmm1, %xmm0
	movl	-4(%rbp), %eax
	leal	-1(%rax), %esi
	movl	-48(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	addl	%esi, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	addss	%xmm1, %xmm0
	mulss	-24(%rbp), %xmm0
	movl	-48(%rbp), %eax
	imull	-12(%rbp), %eax
	movl	%eax, %ecx
	movl	-8(%rbp), %eax
	addl	%ecx, %eax
	imull	-44(%rbp), %eax
	movl	%eax, %ecx
	movl	-4(%rbp), %eax
	addl	%ecx, %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-32(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	mulss	-20(%rbp), %xmm1
	subss	%xmm1, %xmm0
	movd	%xmm0, %eax
	movl	%eax, (%rdx)
	addl	$1, -12(%rbp)
.L4:
	movl	-52(%rbp), %eax
	subl	$1, %eax
	cmpl	-12(%rbp), %eax
	jg	.L5
	addl	$1, -8(%rbp)
.L3:
	movl	-48(%rbp), %eax
	subl	$1, %eax
	cmpl	-8(%rbp), %eax
	jg	.L6
	addl	$1, -4(%rbp)
.L2:
	movl	-44(%rbp), %eax
	subl	$1, %eax
	cmpl	-4(%rbp), %eax
	jg	.L7
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z11cpu_stencilffPfS_iii, .-_Z11cpu_stencilffPfS_iii
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
