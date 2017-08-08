	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"-cores"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"ERROR: Wrong value to -cores parameter, cannot be <=0"
	.align 8
.LC2:
	.string	"ERROR: Value to -cores parameter in not a number"
	.align 8
.LC3:
	.string	"ERROR: Missing value to -cores parameter"
	.section	.rodata.str1.1
.LC4:
	.string	"-boxes1d"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"ERROR: Wrong value to -boxes1d parameter, cannot be <=0"
	.align 8
.LC6:
	.string	"ERROR: Value to -boxes1d parameter in not a number"
	.align 8
.LC7:
	.string	"ERROR: Missing value to -boxes1d parameter"
	.section	.rodata.str1.1
.LC8:
	.string	"ERROR: Unknown parameter"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Configuration used: cores = %d, boxes1d = %d\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB13:
	.section	.text.startup,"ax",@progbits
.LHOTB13:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB33:
	.cfi_startproc
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
	movl	%edi, %ebp
	movq	%rsi, %rbx
	subq	$200, %rsp
	.cfi_def_cfa_offset 256
	call	get_time
	call	get_time
	cmpl	$1, %ebp
	jle	.L38
	leal	-2(%rbp), %eax
	addq	$16, %rbx
	movl	$2, %r12d
	movl	$1, 72(%rsp)
	movl	$1, 76(%rsp)
	movl	$1, %r15d
	shrl	%eax
	movl	$.LC0, %r14d
	leal	4(%rax,%rax), %r13d
	jmp	.L11
.L76:
	cmpl	72(%rsp), %ebp
	jle	.L4
	movq	(%rbx), %rdi
	call	isInteger
	cmpl	$1, %eax
	jne	.L5
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	testl	%eax, %eax
	movl	%eax, 76(%rsp)
	js	.L74
.L6:
	addl	$2, %r12d
	addl	$2, 72(%rsp)
	addq	$16, %rbx
	cmpl	%r13d, %r12d
	je	.L75
.L11:
	movq	-8(%rbx), %rax
	movq	%r14, %rdi
	movl	$7, %ecx
	movq	%rax, %rsi
	repz; cmpsb
	je	.L76
	movl	$.LC4, %edi
	movl	$9, %ecx
	movq	%rax, %rsi
	repz; cmpsb
	jne	.L8
	cmpl	72(%rsp), %ebp
	jle	.L9
	movq	(%rbx), %rdi
	call	isInteger
	cmpl	$1, %eax
	jne	.L10
	movq	(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
	testl	%eax, %eax
	movl	%eax, %r15d
	jns	.L6
	movl	$.LC5, %edi
	call	puts
.L66:
	addq	$200, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
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
	ret
.L38:
	.cfi_restore_state
	movq	$656, 120(%rsp)
	movl	$656, %ebx
	movq	$800, 112(%rsp)
	movq	$800, 80(%rsp)
	movq	$3200, 104(%rsp)
	movl	$1, %r15d
	movq	$3200, 64(%rsp)
	movq	$100, 56(%rsp)
	movq	$1, 96(%rsp)
	movl	$1, 72(%rsp)
	movl	$1, 76(%rsp)
.L2:
	movl	76(%rsp), %esi
	movl	%r15d, %edx
	movl	$.LC9, %edi
	xorl	%eax, %eax
	call	printf
	call	get_time
	call	get_time
	call	get_time
	movq	%rbx, %rdi
	call	malloc
	testl	%r15d, %r15d
	movq	%rax, 88(%rsp)
	jle	.L24
	movl	%r15d, %eax
	movl	$0, 32(%rsp)
	movl	$0, 28(%rsp)
	negl	%eax
	movl	%eax, 36(%rsp)
	movl	32(%rsp), %eax
.L13:
	subl	$1, %eax
	movl	$0, 24(%rsp)
	movl	%eax, 48(%rsp)
	.p2align 4,,10
	.p2align 3
.L25:
	movl	28(%rsp), %edi
	movl	$-1, %r14d
	movq	$0, 8(%rsp)
	xorl	%r13d, %r13d
	movslq	%edi, %rax
	leaq	(%rax,%rax,4), %rdx
	leaq	(%rax,%rdx,8), %r8
	imull	$100, %edi, %eax
	salq	$4, %r8
	addq	88(%rsp), %r8
	cltq
	movq	%rax, 40(%rsp)
	movl	24(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	movl	24(%rsp), %eax
	movl	48(%rsp), %ecx
	leal	1(%r13), %ebp
	movl	36(%rsp), %r10d
	movl	%r13d, (%r8)
	movl	$-1, %r9d
	movl	$0, 24(%r8)
	movl	%r13d, %r12d
	movl	%r13d, 20(%rsp)
	movl	%eax, 4(%r8)
	movl	32(%rsp), %eax
	movl	%eax, 8(%r8)
	movl	28(%rsp), %eax
	addl	%r13d, %eax
	movl	%eax, 12(%r8)
	movq	8(%rsp), %rax
	addq	40(%rsp), %rax
	movq	%rax, 16(%r8)
.L14:
	movl	16(%rsp), %eax
	movl	$-1, %edx
.L20:
	cmpl	$-1, %ecx
	je	.L16
	cmpl	$-1, %eax
	je	.L16
	cmpl	%ecx, %r15d
	setg	%sil
	cmpl	%r15d, %eax
	setl	%dil
	cmpl	%r15d, %r14d
	setl	%bl
	cmpl	$-1, %r14d
	setne	%r11b
	andl	%ebx, %r11d
	testb	%sil, %r11b
	je	.L18
	testb	%dil, %dil
	je	.L18
	movslq	24(%r8), %r11
	movl	%r11d, 52(%rsp)
	leaq	(%r11,%r11,2), %r11
	leaq	(%r8,%r11,8), %rbx
	leal	(%r10,%rax), %r11d
	imull	%r15d, %r11d
	movl	%r14d, 32(%rbx)
	movl	%eax, 36(%rbx)
	movl	%ecx, 40(%rbx)
	addl	%r14d, %r11d
	movl	%r11d, 44(%rbx)
	imull	$100, %r11d, %r11d
	movslq	%r11d, %r11
	movq	%r11, 48(%rbx)
	movl	52(%rsp), %ebx
	leal	1(%rbx), %r11d
	movl	%r11d, 24(%r8)
	.p2align 4,,10
	.p2align 3
.L18:
	cmpl	%r15d, %r12d
	setl	%r11b
	testb	%r11b, %sil
	je	.L35
	testb	%dil, %dil
	je	.L35
	movl	%edx, %ebx
	orl	%r9d, %ebx
	je	.L35
	movslq	24(%r8), %r11
	movl	%r11d, 52(%rsp)
	leaq	(%r11,%r11,2), %r11
	leaq	(%r8,%r11,8), %rbx
	movl	20(%rsp), %r11d
	movl	%eax, 36(%rbx)
	movl	%ecx, 40(%rbx)
	movl	%r11d, 32(%rbx)
	leal	(%r10,%rax), %r11d
	imull	%r15d, %r11d
	addl	20(%rsp), %r11d
	movl	%r11d, 44(%rbx)
	imull	$100, %r11d, %r11d
	movslq	%r11d, %r11
	movq	%r11, 48(%rbx)
	movl	52(%rsp), %ebx
	leal	1(%rbx), %r11d
	movl	%r11d, 24(%r8)
	.p2align 4,,10
	.p2align 3
.L35:
	testb	%dil, %sil
	je	.L16
	cmpl	%ebp, %r15d
	jle	.L16
	movslq	24(%r8), %rsi
	movq	%rsi, %rdi
	leaq	(%rsi,%rsi,2), %rsi
	addl	$1, %edi
	leaq	(%r8,%rsi,8), %r11
	leal	(%r10,%rax), %esi
	imull	%r15d, %esi
	movl	%ebp, 32(%r11)
	movl	%eax, 36(%r11)
	movl	%ecx, 40(%r11)
	addl	%ebp, %esi
	movl	%esi, 44(%r11)
	imull	$100, %esi, %esi
	movslq	%esi, %rsi
	movq	%rsi, 48(%r11)
	movl	%edi, 24(%r8)
	.p2align 4,,10
	.p2align 3
.L16:
	addl	$1, %edx
	addl	$1, %eax
	cmpl	$2, %edx
	jne	.L20
	addl	$1, %r9d
	addl	$1, %ecx
	addl	%r15d, %r10d
	cmpl	$2, %r9d
	jne	.L14
	addq	$656, %r8
	addq	$100, 8(%rsp)
	addl	$1, %r14d
	cmpl	%r15d, %ebp
	movl	%ebp, %r13d
	jne	.L22
	addl	$1, 24(%rsp)
	addl	%r15d, 28(%rsp)
	movl	24(%rsp), %eax
	cmpl	%r15d, %eax
	jne	.L25
	addl	$1, 32(%rsp)
	addl	%r15d, 36(%rsp)
	movl	32(%rsp), %eax
	cmpl	%r15d, %eax
	jne	.L13
.L24:
	xorl	%edi, %edi
	call	time
	movl	%eax, %edi
	call	srand
	movq	64(%rsp), %rdi
	call	malloc
	cmpq	$0, 56(%rsp)
	movq	%rax, %rbp
	jle	.L69
	leaq	8(%rax), %rbx
	movq	56(%rsp), %rax
	movl	$1717986919, %r12d
	salq	$5, %rax
	leaq	8(%rbp,%rax), %r13
.L27:
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%r12d
	addq	$32, %rbx
	movl	%edx, %eax
	movl	%ecx, %edx
	sarl	$31, %edx
	sarl	$2, %eax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -40(%rbx)
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%r12d
	movl	%edx, %eax
	movl	%ecx, %edx
	sarl	$31, %edx
	sarl	$2, %eax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -32(%rbx)
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%r12d
	movl	%edx, %eax
	movl	%ecx, %edx
	sarl	$31, %edx
	sarl	$2, %eax
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -24(%rbx)
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%r12d
	movl	%edx, %eax
	movl	%ecx, %edx
	sarl	$2, %eax
	sarl	$31, %edx
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -16(%rbx)
	cmpq	%r13, %rbx
	jne	.L27
	movq	80(%rsp), %rdi
	movl	$1717986919, %r13d
	call	malloc
	movq	%rax, %rbx
	movq	%rax, %r14
	movq	56(%rsp), %rax
	leaq	(%rbx,%rax,8), %r12
.L29:
	call	rand
	movl	%eax, %ecx
	pxor	%xmm0, %xmm0
	imull	%r13d
	addq	$8, %r14
	movl	%edx, %eax
	movl	%ecx, %edx
	sarl	$2, %eax
	sarl	$31, %edx
	subl	%edx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	divsd	.LC11(%rip), %xmm0
	movsd	%xmm0, -8(%r14)
	cmpq	%r12, %r14
	jne	.L29
	movq	64(%rsp), %rdi
	call	malloc
	movq	%rax, %r12
	movq	%rax, %rdx
	xorl	%eax, %eax
.L31:
	movq	$0, (%rdx)
	movq	$0, 8(%rdx)
	addq	$1, %rax
	movq	$0, 16(%rdx)
	movq	$0, 24(%rdx)
	addq	$32, %rdx
	cmpq	56(%rsp), %rax
	jl	.L31
	jmp	.L32
.L10:
	movl	$.LC6, %edi
	call	puts
	jmp	.L66
.L75:
	movl	%r15d, %eax
	imull	%r15d, %eax
	imull	%r15d, %eax
	cltq
	movq	%rax, %rdi
	movq	%rax, 96(%rsp)
	leaq	(%rax,%rax,4), %rax
	leaq	(%rax,%rax,4), %rdx
	leaq	(%rdi,%rax,8), %rbx
	leaq	0(,%rdx,4), %rsi
	salq	$4, %rbx
	movq	%rbx, 120(%rsp)
	movq	%rsi, 56(%rsp)
	movq	%rdx, %rsi
	salq	$5, %rdx
	salq	$7, %rsi
	movq	%rdx, 80(%rsp)
	movq	%rdx, 112(%rsp)
	movq	%rsi, 64(%rsp)
	movq	%rsi, 104(%rsp)
	jmp	.L2
.L74:
	movl	$.LC1, %edi
	call	puts
	jmp	.L66
.L5:
	movl	$.LC2, %edi
	call	puts
	jmp	.L66
.L4:
	movl	$.LC3, %edi
	call	puts
	jmp	.L66
.L9:
	movl	$.LC7, %edi
	call	puts
	jmp	.L66
.L8:
	movl	$.LC8, %edi
	call	puts
	jmp	.L66
.L69:
	movq	80(%rsp), %rdi
	call	malloc
	movq	64(%rsp), %rdi
	movq	%rax, %rbx
	call	malloc
	movq	%rax, %r12
.L32:
	call	get_time
	movl	72(%rsp), %eax
	movl	%r15d, 140(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 264
	movsd	.LC10(%rip), %xmm0
	movq	%r12, %rcx
	movq	%rbx, %rdx
	movq	%rbp, %rsi
	movl	%eax, 136(%rsp)
	movl	84(%rsp), %eax
	movl	%eax, 144(%rsp)
	pushq	120(%rsp)
	.cfi_def_cfa_offset 272
	pushq	120(%rsp)
	.cfi_def_cfa_offset 280
	pushq	80(%rsp)
	.cfi_def_cfa_offset 288
	pushq	152(%rsp)
	.cfi_def_cfa_offset 296
	pushq	136(%rsp)
	.cfi_def_cfa_offset 304
	pushq	184(%rsp)
	.cfi_def_cfa_offset 312
	pushq	184(%rsp)
	.cfi_def_cfa_offset 320
	movq	152(%rsp), %r14
	movq	%r14, %rdi
	call	kernel_cpu
	addq	$64, %rsp
	.cfi_def_cfa_offset 256
	call	get_time
	movq	%rbp, %rdi
	call	free
	movq	%rbx, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	call	get_time
	jmp	.L66
	.cfi_endproc
.LFE33:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE13:
	.section	.text.startup
.LHOTE13:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	0
	.long	1071644672
	.align 8
.LC11:
	.long	0
	.long	1076101120
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
