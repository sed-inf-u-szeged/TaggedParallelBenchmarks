	.file	"convert_dataset.c"
	.text
	.globl	_Z9sort_rowsPKvS0_
	.type	_Z9sort_rowsPKvS0_, @function
_Z9sort_rowsPKvS0_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z9sort_rowsPKvS0_, .-_Z9sort_rowsPKvS0_
	.globl	_Z9sort_colsPKvS0_
	.type	_Z9sort_colsPKvS0_, @function
_Z9sort_colsPKvS0_:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rax
	movl	4(%rax), %edx
	movq	-16(%rbp), %rax
	movl	4(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z9sort_colsPKvS0_, .-_Z9sort_colsPKvS0_
	.globl	_Z10sort_statsPKvS0_
	.type	_Z10sort_statsPKvS0_, @function
_Z10sort_statsPKvS0_:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movl	4(%rax), %edx
	movq	-8(%rbp), %rax
	movl	4(%rax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z10sort_statsPKvS0_, .-_Z10sort_statsPKvS0_
	.section	.rodata
.LC0:
	.string	"r"
	.align 8
.LC1:
	.string	"Could not process Matrix Market banner."
	.align 8
.LC2:
	.string	"Sorry, this application does not support "
.LC3:
	.string	"Market Market type: [%s]\n"
.LC4:
	.string	"%d %d %f\n"
.LC5:
	.string	"%d %d\n"
	.align 8
.LC7:
	.string	"Converting COO to JDS format (%dx%d)\n%d matrix entries, warp size = %d, row padding align = %d, pack size = %d\n\n"
	.align 8
.LC8:
	.string	"Padding data....%d rows, %d groups\n"
	.align 8
.LC9:
	.string	"Padding warp group %d to %d items, zn = %d\n"
	.align 8
.LC11:
	.string	"Allocating data space: %d entries (%f%% padding)\n"
.LC12:
	.string	"[%d row%d=%.3f]"
.LC13:
	.string	"%d"
	.align 8
.LC14:
	.string	"Finished converting.\nJDS format has %d columns, %d rows.\n"
.LC15:
	.string	"nz_count_len = %d\n"
	.text
	.globl	coo_to_jds
	.type	coo_to_jds, @function
coo_to_jds:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$160, %rsp
	movq	%rdi, -136(%rbp)
	movl	%esi, -140(%rbp)
	movl	%edx, -144(%rbp)
	movl	%ecx, -148(%rbp)
	movl	%r8d, -152(%rbp)
	movl	%r9d, -156(%rbp)
	movq	-136(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	sete	%al
	testb	%al, %al
	je	.L8
	movl	$1, %edi
	call	exit
.L8:
	leaq	-96(%rbp), %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z14mm_read_bannerP8_IO_FILEPA4_c
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L9
	movl	$.LC1, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L9:
	movzbl	-94(%rbp), %eax
	cmpb	$67, %al
	jne	.L10
	movzbl	-96(%rbp), %eax
	cmpb	$77, %al
	jne	.L10
	movzbl	-95(%rbp), %eax
	cmpb	$67, %al
	jne	.L10
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leaq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	_Z18mm_typecode_to_strPc
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L10:
	leaq	-100(%rbp), %rcx
	leaq	-108(%rbp), %rdx
	leaq	-104(%rbp), %rsi
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_
	movl	%eax, -68(%rbp)
	cmpl	$0, -68(%rbp)
	setne	%al
	testb	%al, %al
	je	.L11
	movl	$1, %edi
	call	exit
.L11:
	movl	-104(%rbp), %edx
	movq	72(%rbp), %rax
	movl	%edx, (%rax)
	cmpl	$0, -152(%rbp)
	je	.L12
	movl	-100(%rbp), %eax
	addl	%eax, %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
	jmp	.L13
.L12:
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
.L13:
	movl	$0, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L14
.L18:
	cmpl	$0, -156(%rbp)
	jne	.L15
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	leaq	8(%rax), %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	jmp	.L16
.L15:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	leaq	4(%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	movl	.LC6(%rip), %eax
	movl	%eax, 8(%rdx)
.L16:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	subl	$1, %edx
	movl	%edx, (%rax)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	subl	$1, %edx
	movl	%edx, 4(%rax)
	cmpl	$0, -152(%rbp)
	je	.L17
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cmpl	%eax, %ecx
	je	.L17
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	8(%rax), %eax
	movl	%eax, 8(%rcx)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, 4(%rcx)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	movl	%eax, (%rcx)
.L17:
	addl	$1, -4(%rbp)
	addl	$1, -20(%rbp)
.L14:
	movl	-100(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L18
	movl	-20(%rbp), %eax
	movl	%eax, -100(%rbp)
	cmpl	$0, 16(%rbp)
	jle	.L19
	movl	-100(%rbp), %ecx
	movl	-108(%rbp), %edx
	movl	-104(%rbp), %eax
	subq	$8, %rsp
	movl	-140(%rbp), %r8d
	movl	-144(%rbp), %edi
	movl	-148(%rbp), %esi
	pushq	%rsi
	movl	%r8d, %r9d
	movl	%edi, %r8d
	movl	%eax, %esi
	movl	$.LC7, %edi
	movl	$0, %eax
	call	printf
	addq	$16, %rsp
.L19:
	movq	stdin(%rip), %rax
	cmpq	%rax, -64(%rbp)
	je	.L20
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L20:
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -36(%rbp)
	movl	-100(%rbp), %eax
	movslq	%eax, %rsi
	movq	-16(%rbp), %rax
	movl	$_Z9sort_rowsPKvS0_, %ecx
	movl	$12, %edx
	movq	%rax, %rdi
	call	qsort
	movl	-100(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, -104(%rbp)
	movl	-104(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	je	.L21
	movl	-104(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	movl	-144(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, %edx
	movl	-104(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -104(%rbp)
.L21:
	movl	-104(%rbp), %eax
	cltq
	movl	$16, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -80(%rbp)
	movl	-104(%rbp), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, %rdx
	movq	56(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L22
.L26:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	cmpl	-24(%rbp), %eax
	jne	.L23
	movl	-100(%rbp), %eax
	subl	$1, %eax
	cmpl	-4(%rbp), %eax
	jne	.L24
.L23:
	movl	-100(%rbp), %eax
	subl	$1, %eax
	cmpl	-4(%rbp), %eax
	jne	.L25
	addl	$1, -28(%rbp)
.L25:
	movl	-24(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	movl	%eax, 4(%rdx)
	movl	-24(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	leaq	-12(%rax), %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rcx)
	movl	-24(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rax, %rdx
	movl	-32(%rbp), %eax
	movl	%eax, 8(%rdx)
	movl	$0, -28(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -32(%rbp)
.L24:
	addl	$1, -28(%rbp)
	addl	$1, -4(%rbp)
.L22:
	movl	-100(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L26
	movl	-104(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	movl	%eax, %ecx
	movl	-104(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	movl	%edx, %eax
	leal	(%rcx,%rax), %edx
	movq	88(%rbp), %rax
	movl	%edx, (%rax)
	movq	88(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	40(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-104(%rbp), %eax
	movslq	%eax, %rsi
	movq	-80(%rbp), %rax
	movl	$_Z10sort_statsPKvS0_, %ecx
	movl	$16, %edx
	movq	%rax, %rdi
	call	qsort
	cmpl	$0, 16(%rbp)
	jle	.L27
	movq	88(%rbp), %rax
	movl	(%rax), %edx
	movl	-104(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
.L27:
	movl	$0, -44(%rbp)
	movl	-140(%rbp), %eax
	imull	-148(%rbp), %eax
	movl	%eax, -140(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L28
.L35:
	movq	56(%rbp), %rax
	movq	(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-4(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L29
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cltd
	idivl	-140(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	je	.L30
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cltd
	idivl	-140(%rbp)
	movl	-140(%rbp), %eax
	subl	%edx, %eax
	movl	%eax, 12(%rcx)
	jmp	.L31
.L30:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	$0, 12(%rax)
.L31:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cltd
	idivl	-148(%rbp)
	movl	%edx, %eax
	testl	%eax, %eax
	je	.L32
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	pxor	%xmm0, %xmm0
	cvtsi2ss	%eax, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-148(%rbp), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	ceil
	cvttsd2si	%xmm0, %eax
	movl	%eax, -48(%rbp)
	jmp	.L33
.L32:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %eax
	cltd
	idivl	-148(%rbp)
	movl	%eax, -48(%rbp)
.L33:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	addq	%rcx, %rax
	movl	12(%rax), %eax
	addl	%edx, %eax
	movl	%eax, -40(%rbp)
	movq	40(%rbp), %rax
	movq	(%rax), %rcx
	movl	-4(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	cltq
	salq	$2, %rax
	leaq	(%rcx,%rax), %rdx
	movl	-48(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-40(%rbp), %eax
	imull	-144(%rbp), %eax
	addl	%eax, -36(%rbp)
	cmpl	$1, 16(%rbp)
	jle	.L34
	movl	-4(%rbp), %eax
	cltd
	idivl	-144(%rbp)
	movl	%eax, %esi
	movl	-48(%rbp), %edx
	movl	-40(%rbp), %eax
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	$.LC9, %edi
	movl	$0, %eax
	call	printf
	jmp	.L34
.L29:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rdx, %rcx
	salq	$4, %rcx
	movq	-80(%rbp), %rdx
	addq	%rcx, %rdx
	movl	4(%rdx), %edx
	movl	-40(%rbp), %ecx
	subl	%edx, %ecx
	movl	%ecx, %edx
	movl	%edx, 12(%rax)
.L34:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	addl	%eax, -44(%rbp)
	addl	$1, -4(%rbp)
.L28:
	movl	-104(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L35
	cmpl	$0, 16(%rbp)
	jle	.L36
	pxor	%xmm0, %xmm0
	cvtsi2ss	-44(%rbp), %xmm0
	movss	.LC10(%rip), %xmm1
	mulss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	cvtsi2ss	-36(%rbp), %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-36(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$1, %eax
	call	printf
.L36:
	movl	-36(%rbp), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-36(%rbp), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, %rdx
	movq	48(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-104(%rbp), %eax
	cltq
	movl	$4, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	movq	%rdx, (%rax)
	movq	80(%rbp), %rax
	movl	-36(%rbp), %edx
	movl	%edx, (%rax)
	movl	$0, -4(%rbp)
	movl	$0, -24(%rbp)
	movl	$0, -52(%rbp)
.L51:
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movl	-24(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-52(%rbp), %eax
	movl	%eax, (%rdx)
	movq	-80(%rbp), %rax
	movl	4(%rax), %edx
	movq	-80(%rbp), %rax
	movl	12(%rax), %eax
	addl	%eax, %edx
	movl	-24(%rbp), %eax
	imull	-148(%rbp), %eax
	cmpl	%eax, %edx
	jg	.L37
	nop
	cmpl	$0, 16(%rbp)
	jle	.L52
	jmp	.L54
.L37:
	movl	$0, -4(%rbp)
	jmp	.L39
.L49:
	movl	$0, -56(%rbp)
	jmp	.L40
.L48:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movl	-24(%rbp), %eax
	imull	-148(%rbp), %eax
	movl	%eax, %ecx
	movl	-56(%rbp), %eax
	addl	%ecx, %eax
	cmpl	%eax, %edx
	jle	.L41
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	8(%rax), %edx
	movl	-24(%rbp), %eax
	imull	-148(%rbp), %eax
	addl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -84(%rbp)
	movl	-84(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	%rdx, -128(%rbp)
	movl	8(%rax), %eax
	movl	%eax, -120(%rbp)
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-120(%rbp), %eax
	movl	%eax, (%rdx)
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rax, %rdx
	movl	-124(%rbp), %eax
	movl	%eax, (%rdx)
	cmpl	$1, 16(%rbp)
	jle	.L42
	cmpl	$2, -4(%rbp)
	jg	.L43
	movss	-120(%rbp), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-56(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	%ecx, %esi
	movl	$.LC12, %edi
	movl	$1, %eax
	call	printf
	jmp	.L42
.L43:
	movl	-56(%rbp), %eax
	addl	$1, %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	jmp	.L42
.L41:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	4(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rcx
	movq	-80(%rbp), %rax
	addq	%rcx, %rax
	movl	12(%rax), %eax
	leal	(%rdx,%rax), %ecx
	movl	-24(%rbp), %eax
	imull	-148(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	cmpl	%eax, %ecx
	jle	.L45
	cmpl	$1, 16(%rbp)
	jle	.L46
	movl	$48, %edi
	call	putchar
.L46:
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %edx
	movslq	%edx, %rdx
	salq	$2, %rdx
	addq	%rdx, %rax
	movl	$-1, (%rax)
	jmp	.L42
.L45:
	jmp	.L47
.L42:
	addl	$1, -52(%rbp)
	addl	$1, -56(%rbp)
.L40:
	movl	-56(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl	.L48
	addl	$1, -4(%rbp)
.L39:
	movl	-104(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L49
.L47:
	cmpl	$1, 16(%rbp)
	jle	.L50
	movl	$10, %edi
	call	putchar
.L50:
	addl	$1, -24(%rbp)
	jmp	.L51
.L54:
	movl	-104(%rbp), %eax
	movl	-24(%rbp), %edx
	movl	%eax, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
.L52:
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	88(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	movl	$.LC15, %edi
	movl	$0, %eax
	call	printf
	movl	-104(%rbp), %edx
	movq	64(%rbp), %rax
	movl	%edx, (%rax)
	movl	-24(%rbp), %eax
	leal	1(%rax), %edx
	movq	96(%rbp), %rax
	movl	%edx, (%rax)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	coo_to_jds, .-coo_to_jds
	.section	.rodata
	.align 4
.LC6:
	.long	1065353216
	.align 4
.LC10:
	.long	1120403456
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
