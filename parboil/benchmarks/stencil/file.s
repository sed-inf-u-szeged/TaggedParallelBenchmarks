	.file	"file.c"
	.section	.rodata
.LC0:
	.string	"w"
.LC1:
	.string	"Cannot open output file\n"
	.text
	.globl	_Z10outputDataPcPfiii
	.type	_Z10outputDataPcPfiii, @function
_Z10outputDataPcPfiii:
.LFB0:
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
	movl	%ecx, -40(%rbp)
	movl	%r8d, -44(%rbp)
	movq	-24(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$24, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	movl	-36(%rbp), %eax
	imull	-40(%rbp), %eax
	imull	-44(%rbp), %eax
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rdx
	leaq	-12(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1, %edx
	movl	$4, %esi
	movq	%rax, %rdi
	call	fwrite
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movq	-8(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movq	%rsi, %rdx
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
.LFE0:
	.size	_Z10outputDataPcPfiii, .-_Z10outputDataPcPfiii
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
