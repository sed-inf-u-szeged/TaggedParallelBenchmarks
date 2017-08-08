	.file	"file.c"
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"Cannot open input file\n"
.LC2:
	.string	"%d %d %d %d %d\n"
	.text
	.globl	_Z9inputDataPcPiS0_S0_S0_S0_PPfPS0_S3_S3_S3_
	.type	_Z9inputDataPcPiS0_S0_S0_S0_PPfPS0_S3_S3_S3_, @function
_Z9inputDataPcPiS0_S0_S0_S0_PPfPS0_S3_S3_S3_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	%r8, -72(%rbp)
	movq	%r9, -80(%rbp)
	movq	-40(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$23, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	subq	$8, %rsp
	movq	-64(%rbp), %rdi
	movq	-72(%rbp), %rsi
	movq	-56(%rbp), %rcx
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rax
	pushq	-80(%rbp)
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$.LC2, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	addq	$16, %rsp
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	-56(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -16(%rbp)
	movq	-64(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -20(%rbp)
	movq	-80(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -24(%rbp)
	movq	-72(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	24(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	32(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	32(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-20(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	40(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-28(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	48(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	48(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z9inputDataPcPiS0_S0_S0_S0_PPfPS0_S3_S3_S3_, .-_Z9inputDataPcPiS0_S0_S0_S0_PPfPS0_S3_S3_S3_
	.globl	_Z9input_vecPcPfi
	.type	_Z9input_vecPcPfi, @function
_Z9input_vecPcPfi:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z9input_vecPcPfi, .-_Z9input_vecPcPfi
	.section	.rodata
.LC3:
	.string	"w"
.LC4:
	.string	"Cannot open output file\n"
	.text
	.globl	_Z10outputDataPcPfi
	.type	_Z10outputDataPcPfi, @function
_Z10outputDataPcPfi:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movq	-24(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L5
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L5:
	movl	-36(%rbp), %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rdx
	leaq	-12(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z10outputDataPcPfi, .-_Z10outputDataPcPfi
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
