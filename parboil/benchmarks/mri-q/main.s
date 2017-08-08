	.file	"main.c"
	.section	.text._Z16ComputePhiMagCPUiPfS_S_,"axG",@progbits,_Z16ComputePhiMagCPUiPfS_S_,comdat
	.weak	_Z16ComputePhiMagCPUiPfS_S_
	.type	_Z16ComputePhiMagCPUiPfS_S_, @function
_Z16ComputePhiMagCPUiPfS_S_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movq	%rcx, -48(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movss	-8(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-8(%rbp), %xmm1
	movss	-12(%rbp), %xmm0
	mulss	-12(%rbp), %xmm0
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movl	%eax, (%rdx)
	addl	$1, -4(%rbp)
.L2:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L3
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z16ComputePhiMagCPUiPfS_S_, .-_Z16ComputePhiMagCPUiPfS_S_
	.section	.text._Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_,"axG",@progbits,_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_,comdat
	.weak	_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_
	.type	_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_, @function
_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movq	%rcx, -56(%rbp)
	movq	%r8, -64(%rbp)
	movq	%r9, -72(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L5
.L8:
	movl	$0, -8(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm1
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm0, %xmm1
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	4(%rax), %xmm2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm0, %xmm1
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movss	8(%rax), %xmm2
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	movss	.LC0(%rip), %xmm1
	mulss	%xmm1, %xmm0
	movd	%xmm0, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -76(%rbp)
	movss	-76(%rbp), %xmm0
	call	cosf
	movd	%xmm0, %eax
	movl	%eax, -16(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -76(%rbp)
	movss	-76(%rbp), %xmm0
	call	sinf
	movd	%xmm0, %eax
	movl	%eax, -20(%rbp)
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	12(%rax), %eax
	movl	%eax, -24(%rbp)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	-24(%rbp), %xmm0
	mulss	-16(%rbp), %xmm0
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movl	%eax, (%rdx)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	24(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	24(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm1
	movss	-24(%rbp), %xmm0
	mulss	-20(%rbp), %xmm0
	addss	%xmm0, %xmm1
	movd	%xmm1, %eax
	movl	%eax, (%rdx)
	addl	$1, -8(%rbp)
.L6:
	movl	-8(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L7
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L8
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_, .-_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_
	.text
	.globl	_Z20createDataStructsCPUiiPPfS0_S0_
	.type	_Z20createDataStructsCPUiiPPfS0_S0_, @function
_Z20createDataStructsCPUiiPPfS0_S0_:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
	movq	%rcx, -24(%rbp)
	movq	%r8, -32(%rbp)
	movl	-4(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rsi
	movl	$16, %edi
	call	memalign
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, (%rax)
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z20createDataStructsCPUiiPPfS0_S0_, .-_Z20createDataStructsCPUiiPPfS0_S0_
	.section	.rodata
.LC1:
	.string	"Expecting one input filename\n"
	.align 8
.LC2:
	.string	"Expecting an integer parameter\n"
	.align 8
.LC3:
	.string	"%d pixels in output; %d samples in trajectory; using %d samples\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$448, %rsp
	movl	%edi, -436(%rbp)
	movq	%rsi, -448(%rbp)
	leaq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	pb_InitializeTimerSet
	movq	-448(%rbp), %rdx
	leaq	-436(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	pb_ReadParameters
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L11
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L12
.L11:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$29, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L12:
	leaq	-432(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	subq	$8, %rsp
	leaq	-64(%rbp), %r9
	leaq	-56(%rbp), %r8
	leaq	-48(%rbp), %rcx
	leaq	-36(%rbp), %rdx
	leaq	-40(%rbp), %rsi
	leaq	-104(%rbp), %rdi
	pushq	%rdi
	leaq	-96(%rbp), %rdi
	pushq	%rdi
	leaq	-88(%rbp), %rdi
	pushq	%rdi
	leaq	-80(%rbp), %rdi
	pushq	%rdi
	leaq	-72(%rbp), %rdi
	pushq	%rdi
	movq	%rax, %rdi
	call	inputData
	addq	$48, %rsp
	movl	-436(%rbp), %eax
	cmpl	$1, %eax
	jg	.L13
	movl	-40(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L14
.L13:
	movq	-448(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	leaq	-136(%rbp), %rcx
	movl	$10, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strtol
	movl	%eax, -20(%rbp)
	movq	-448(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rdx
	movq	-136(%rbp), %rax
	cmpq	%rax, %rdx
	jne	.L15
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L15:
	movl	-40(%rbp), %eax
	cmpl	%eax, -20(%rbp)
	jge	.L16
	movl	-20(%rbp), %eax
	jmp	.L17
.L16:
	movl	-40(%rbp), %eax
.L17:
	movl	%eax, -4(%rbp)
.L14:
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	-4(%rbp), %ecx
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	leaq	-432(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movl	-36(%rbp), %esi
	leaq	-128(%rbp), %rdi
	leaq	-120(%rbp), %rcx
	leaq	-112(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdi, %r8
	movl	%eax, %edi
	call	_Z20createDataStructsCPUiiPPfS0_S0_
	movq	-112(%rbp), %rcx
	movq	-104(%rbp), %rdx
	movq	-96(%rbp), %rsi
	movl	-4(%rbp), %eax
	movl	%eax, %edi
	call	_Z16ComputePhiMagCPUiPfS_S_
	movl	-4(%rbp), %eax
	cltq
	movl	$16, %esi
	movq	%rax, %rdi
	call	calloc
	movq	%rax, -32(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L18
.L19:
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-48(%rbp), %rax
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, (%rdx)
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-56(%rbp), %rax
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, 4(%rdx)
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-64(%rbp), %rax
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, 8(%rdx)
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movq	-112(%rbp), %rax
	movl	-8(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	%rcx, %rax
	movl	(%rax), %eax
	movl	%eax, 12(%rdx)
	addl	$1, -8(%rbp)
.L18:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L19
	movq	-128(%rbp), %r8
	movq	-120(%rbp), %rdi
	movq	-88(%rbp), %r9
	movq	-80(%rbp), %r10
	movq	-72(%rbp), %rcx
	movl	-36(%rbp), %esi
	movq	-32(%rbp), %rdx
	movl	-4(%rbp), %eax
	pushq	%r8
	pushq	%rdi
	movq	%r10, %r8
	movl	%eax, %edi
	call	_Z11ComputeQCPUiiP7kValuesPfS1_S1_S1_S1_
	addq	$16, %rsp
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L20
	leaq	-432(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	movl	-36(%rbp), %ecx
	movq	-128(%rbp), %rdx
	movq	-120(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	outputData
	leaq	-432(%rbp), %rax
	movl	$6, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
.L20:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-104(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-112(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-120(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leaq	-432(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	pb_SwitchToTimer
	leaq	-432(%rbp), %rax
	movq	%rax, %rdi
	call	pb_PrintTimerSet
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pb_FreeParameters
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1086918619
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
