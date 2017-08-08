	.file	"main.c"
	.text
	.type	_ZL9read_dataPfiiiP8_IO_FILE, @function
_ZL9read_dataPfiiiP8_IO_FILE:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movq	%r8, -48(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L7:
	movl	$0, -12(%rbp)
	jmp	.L3
.L6:
	movl	$0, -16(%rbp)
	jmp	.L4
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	leaq	(%rdx,%rax), %rdi
	movq	-48(%rbp), %rax
	movq	%rax, %rcx
	movl	$1, %edx
	movl	$4, %esi
	call	fread
	addl	$1, -4(%rbp)
	addl	$1, -16(%rbp)
.L4:
	movl	-16(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L5
	addl	$1, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jl	.L6
	addl	$1, -8(%rbp)
.L2:
	movl	-8(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L7
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_ZL9read_dataPfiiiP8_IO_FILE, .-_ZL9read_dataPfiiiP8_IO_FILE
	.section	.rodata
	.align 8
.LC0:
	.string	"CPU-based 7 points stencil codes****"
	.align 8
.LC1:
	.string	"Original version by Li-Wen Chang <lchang20@illinois.edu> and I-Jui Sung<sung10@illinois.edu>"
	.align 8
.LC2:
	.string	"This version maintained by Chris Rodrigues  ***********"
	.align 8
.LC5:
	.string	"Usage: probe nx ny nz tx ty t\nnx: the grid size x\nny: the grid size y\nnz: the grid size z\nt: the iteration time"
.LC6:
	.string	"rb"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$400, %rsp
	movl	%edi, -388(%rbp)
	movq	%rsi, -400(%rbp)
	movl	$.LC0, %edi
	call	puts
	movl	$.LC1, %edi
	call	puts
	movl	$.LC2, %edi
	call	puts
	movq	-400(%rbp), %rdx
	leaq	-388(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	pb_ReadParameters
	movq	%rax, -32(%rbp)
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	pb_InitializeTimerSet
	leaq	-384(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movl	.LC3(%rip), %eax
	movl	%eax, -36(%rbp)
	movl	.LC4(%rip), %eax
	movl	%eax, -40(%rbp)
	movl	-388(%rbp), %eax
	cmpl	$4, %eax
	jg	.L10
	movl	$.LC5, %edi
	call	puts
	movl	$-1, %eax
	jmp	.L19
.L10:
	movq	-400(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -44(%rbp)
	cmpl	$0, -44(%rbp)
	jg	.L12
	movl	$-1, %eax
	jmp	.L19
.L12:
	movq	-400(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -48(%rbp)
	cmpl	$0, -48(%rbp)
	jg	.L13
	movl	$-1, %eax
	jmp	.L19
.L13:
	movq	-400(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -52(%rbp)
	cmpl	$0, -52(%rbp)
	jg	.L14
	movl	$-1, %eax
	jmp	.L19
.L14:
	movq	-400(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -56(%rbp)
	cmpl	$0, -56(%rbp)
	jg	.L15
	movl	$-1, %eax
	jmp	.L19
.L15:
	movl	-44(%rbp), %eax
	imull	-48(%rbp), %eax
	imull	-52(%rbp), %eax
	movl	%eax, -60(%rbp)
	movl	-60(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	movl	-60(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movl	$.LC6, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -72(%rbp)
	movq	-72(%rbp), %rdi
	movl	-52(%rbp), %ecx
	movl	-48(%rbp), %edx
	movl	-44(%rbp), %esi
	movq	-8(%rbp), %rax
	movq	%rdi, %r8
	movq	%rax, %rdi
	call	_ZL9read_dataPfiiiP8_IO_FILE
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	-60(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-8(%rbp), %rcx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	movl	$0, -20(%rbp)
	jmp	.L16
.L17:
	movl	-52(%rbp), %r8d
	movl	-48(%rbp), %ecx
	movl	-44(%rbp), %edx
	movq	-16(%rbp), %rsi
	movq	-8(%rbp), %rdi
	movl	-40(%rbp), %r9d
	movl	-36(%rbp), %eax
	movl	%r9d, -392(%rbp)
	movss	-392(%rbp), %xmm1
	movl	%eax, -392(%rbp)
	movss	-392(%rbp), %xmm0
	call	_Z11cpu_stencilffPfS_iii
	movq	-8(%rbp), %rax
	movq	%rax, -80(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, -16(%rbp)
	addl	$1, -20(%rbp)
.L16:
	movl	-20(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L17
	movq	-8(%rbp), %rax
	movq	%rax, -88(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-88(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L18
	leaq	-384(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	-52(%rbp), %edi
	movl	-48(%rbp), %ecx
	movl	-44(%rbp), %edx
	movq	-16(%rbp), %rsi
	movl	%edi, %r8d
	movq	%rax, %rdi
	call	_Z10outputDataPcPfiii
.L18:
	leaq	-384(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leaq	-384(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	leaq	-384(%rbp), %rax
	movq	%rax, %rdi
	call	pb_PrintTimerSet
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	pb_FreeParameters
	movl	$0, %eax
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC3:
	.long	1042983595
	.align 4
.LC4:
	.long	1021546041
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
