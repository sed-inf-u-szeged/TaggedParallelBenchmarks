	.file	"file.cc"
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"Cannot open input file\n"
	.text
	.globl	inputData
	.type	inputData, @function
inputData:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movq	%r8, -56(%rbp)
	movq	%r9, -64(%rbp)
	movq	-24(%rbp), %rax
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
	movq	-8(%rbp), %rdx
	leaq	-12(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-12(%rbp), %edx
	movq	-32(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rdx
	leaq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-16(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, (%rax)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-56(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-64(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	16(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-16(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	24(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-16(%rbp), %eax
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
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
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
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	40(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	40(%rbp), %rax
	movq	(%rax), %rax
	movq	-8(%rbp), %rcx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fread
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	48(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-12(%rbp), %eax
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
	.size	inputData, .-inputData
	.section	.rodata
.LC2:
	.string	"w"
.LC3:
	.string	"Cannot open output file\n"
	.text
	.globl	outputData
	.type	outputData, @function
outputData:
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
	movq	%rdx, -40(%rbp)
	movl	%ecx, -44(%rbp)
	movq	-24(%rbp), %rax
	movl	$.LC2, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L4
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L4:
	movl	-44(%rbp), %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rdx
	leaq	-12(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rcx
	movq	-32(%rbp), %rax
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	movl	-44(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rcx
	movq	-40(%rbp), %rax
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
.LFE1:
	.size	outputData, .-outputData
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
