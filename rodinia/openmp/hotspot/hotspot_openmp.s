	.file	"hotspot_openmp.cpp"
	.text
.Ltext0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.section	.text.unlikely
.Ltext_cold0:
	.text
	.globl	_Z16single_iterationPdS_S_iiddddd
	.type	_Z16single_iterationPdS_S_iiddddd, @function
_Z16single_iterationPdS_S_iiddddd:
.LFB19:
	.file 1 "hotspot_openmp.cpp"
	.loc 1 35 0
	.cfi_startproc
.LVL0:
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
	movl	%ecx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
.LBB11:
	.loc 1 46 0
	testl	%ecx, %ecx
.LBE11:
	.loc 1 35 0
	movl	%ecx, -68(%rsp)
.LBB12:
	.loc 1 46 0
	jle	.L1
	.loc 1 52 0
	movslq	%r8d, %rax
	movq	%rdx, %r14
	movq	%rdi, %r15
	salq	$3, %rax
	.loc 1 61 0
	leal	-1(%rbx), %r13d
	movq	%rsi, -104(%rsp)
	.loc 1 52 0
	movq	%rax, -80(%rsp)
	leaq	(%rsi,%rax), %r10
	.loc 1 55 0
	leal	-1(%r8), %eax
	.loc 1 58 0
	movl	$-1, -72(%rsp)
	movq	$0, -96(%rsp)
	xorl	%ebp, %ebp
	.loc 1 56 0
	movslq	%eax, %rdx
.LVL1:
	movl	%eax, %r12d
	salq	$3, %rdx
	.loc 1 57 0
	leaq	(%rsi,%rdx), %rcx
.LVL2:
	.loc 1 56 0
	leaq	(%r14,%rdx), %rdi
.LVL3:
	.loc 1 57 0
	movq	%rcx, -8(%rsp)
	.loc 1 58 0
	leal	(%rax,%r8), %ecx
	.loc 1 56 0
	movq	%rdi, -24(%rsp)
	.loc 1 57 0
	leaq	-8(%rsi,%rdx), %rdi
	.loc 1 58 0
	movslq	%ecx, %rdx
	movl	%ecx, -108(%rsp)
	movl	%r8d, %ecx
	.loc 1 57 0
	movq	%rdi, -16(%rsp)
	.loc 1 58 0
	leaq	(%rsi,%rdx,8), %rdi
	negl	%ecx
	movl	%ecx, -88(%rsp)
	movq	%rdi, (%rsp)
.LVL4:
	.p2align 4,,10
	.p2align 3
.L3:
	.loc 1 47 0 discriminator 1
	testl	%r8d, %r8d
	movl	%ebp, %r9d
.LVL5:
	jle	.L41
	.loc 1 62 0
	movslq	%eax, %rdx
	leal	1(%rbp), %edi
	addl	$1, %eax
	salq	$3, %rdx
	.loc 1 93 0
	cltq
	movq	-96(%rsp), %rcx
	.loc 1 62 0
	leaq	(%r14,%rdx), %rbx
	movl	%edi, -84(%rsp)
	.loc 1 63 0
	leaq	-8(%rsi,%rdx), %rdi
	movapd	%xmm4, %xmm8
	.loc 1 62 0
	movq	%rbx, -64(%rsp)
	.loc 1 63 0
	leaq	(%rsi,%rdx), %rbx
	.loc 1 64 0
	movslq	-72(%rsp), %rdx
	.loc 1 63 0
	movq	%rdi, -56(%rsp)
	divsd	%xmm0, %xmm8
	movq	%rbx, -48(%rsp)
	.loc 1 64 0
	leaq	(%rsi,%rdx,8), %rbx
	.loc 1 70 0
	movslq	-88(%rsp), %rdx
	.loc 1 64 0
	movq	%rbx, -40(%rsp)
	.loc 1 93 0
	leaq	(%rsi,%rax,8), %rbx
	xorl	%eax, %eax
	.loc 1 70 0
	leaq	(%rsi,%rdx,8), %r11
	.loc 1 81 0
	movslq	-108(%rsp), %rdx
	movq	%rbx, -120(%rsp)
	leaq	(%rsi,%rdx,8), %rdi
	.loc 1 93 0
	movq	-104(%rsp), %rdx
	.loc 1 81 0
	movq	%rdi, -32(%rsp)
	.loc 1 93 0
	xorl	%edi, %edi
	jmp	.L13
.LVL6:
	.p2align 4,,10
	.p2align 3
.L42:
	.loc 1 51 0
	movsd	(%rsi), %xmm7
	movsd	8(%rsi), %xmm6
	.loc 1 52 0
	movsd	(%r10), %xmm5
	.loc 1 51 0
	subsd	%xmm7, %xmm6
	.loc 1 52 0
	subsd	%xmm7, %xmm5
	.loc 1 51 0
	divsd	%xmm1, %xmm6
	.loc 1 52 0
	divsd	%xmm2, %xmm5
	.loc 1 50 0
	addsd	(%r14), %xmm6
	.loc 1 51 0
	addsd	%xmm6, %xmm5
	.loc 1 53 0
	movsd	amb_temp(%rip), %xmm6
	subsd	%xmm7, %xmm6
	movapd	%xmm6, %xmm7
	divsd	%xmm3, %xmm7
	.loc 1 52 0
	addsd	%xmm7, %xmm5
	movapd	%xmm5, %xmm6
	movsd	(%rdx), %xmm5
	.loc 1 53 0
	mulsd	%xmm8, %xmm6
.LVL7:
.L5:
	.loc 1 105 0 discriminator 2
	addsd	%xmm6, %xmm5
	.loc 1 47 0 discriminator 2
	addl	$1, %eax
.LVL8:
	addq	$8, %rdi
	addq	$8, %rdx
	.loc 1 105 0 discriminator 2
	movsd	%xmm5, (%r15,%rcx)
	addq	$8, %rcx
	.loc 1 47 0 discriminator 2
	cmpl	%r8d, %eax
	je	.L16
.LVL9:
.L13:
	.loc 1 49 0
	movl	%eax, %ebx
	orl	%r9d, %ebx
	je	.L42
	.loc 1 55 0
	testq	%rbp, %rbp
	je	.L43
	.loc 1 61 0
	cmpl	%r9d, %r13d
	je	.L44
	.loc 1 79 0
	cmpl	%eax, %r12d
	je	.L22
	.loc 1 91 0
	testl	%eax, %eax
	jne	.L12
	.loc 1 93 0
	movq	-104(%rsp), %rbx
	movsd	(%rbx), %xmm7
	movq	-120(%rsp), %rbx
	movapd	%xmm7, %xmm5
	movsd	(%rbx), %xmm6
	.loc 1 92 0
	movq	-96(%rsp), %rbx
	.loc 1 93 0
	addsd	%xmm7, %xmm5
	addsd	(%r11), %xmm6
	subsd	%xmm5, %xmm6
	divsd	%xmm2, %xmm6
	.loc 1 92 0
	addsd	(%r14,%rbx), %xmm6
	.loc 1 94 0
	movq	-104(%rsp), %rbx
	movsd	8(%rbx), %xmm5
	subsd	%xmm7, %xmm5
	divsd	%xmm1, %xmm5
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L12:
	.loc 1 99 0
	movq	-120(%rsp), %rbx
	movsd	(%rdx), %xmm5
	.loc 1 100 0
	movsd	8(%rdx), %xmm6
	.loc 1 99 0
	movapd	%xmm5, %xmm10
	.loc 1 98 0
	movsd	(%r14,%rcx), %xmm7
	.loc 1 99 0
	movsd	(%rbx,%rdi), %xmm9
	.loc 1 100 0
	addsd	-8(%rdx), %xmm6
	.loc 1 99 0
	addsd	%xmm5, %xmm10
	addsd	(%r11,%rdi), %xmm9
	.loc 1 100 0
	subsd	%xmm10, %xmm6
	.loc 1 99 0
	subsd	%xmm10, %xmm9
	.loc 1 100 0
	divsd	%xmm1, %xmm6
	.loc 1 99 0
	divsd	%xmm2, %xmm9
	.loc 1 98 0
	addsd	%xmm9, %xmm7
	.loc 1 99 0
	addsd	%xmm6, %xmm7
	.loc 1 101 0
	movsd	amb_temp(%rip), %xmm6
	subsd	%xmm5, %xmm6
	.loc 1 99 0
	movapd	%xmm7, %xmm9
	.loc 1 101 0
	movapd	%xmm6, %xmm7
	.loc 1 100 0
	movapd	%xmm9, %xmm6
	.loc 1 101 0
	divsd	%xmm3, %xmm7
	.loc 1 100 0
	addsd	%xmm7, %xmm6
	.loc 1 101 0
	mulsd	%xmm8, %xmm6
.LVL10:
	jmp	.L5
.LVL11:
.L41:
	leal	1(%rbp), %eax
	movl	%eax, -84(%rsp)
.LVL12:
	.p2align 4,,10
	.p2align 3
.L16:
	movq	-80(%rsp), %rbx
	addq	$1, %rbp
	addq	%rbx, -96(%rsp)
	addq	%rbx, -104(%rsp)
	.loc 1 46 0 discriminator 2
	movl	-84(%rsp), %ecx
	addl	%r8d, -88(%rsp)
	movl	-108(%rsp), %ebx
	addl	%r8d, -72(%rsp)
	movl	%ebx, %eax
	cmpl	%ecx, -68(%rsp)
	jle	.L32
	leal	(%rbx,%r8), %edi
	movl	%edi, -108(%rsp)
	jmp	.L3
.L32:
	movq	-80(%rsp), %r10
	movl	-68(%rsp), %r11d
	.loc 1 46 0 is_stmt 0
	xorl	%edi, %edi
	xorl	%r9d, %r9d
.LVL13:
	.p2align 4,,10
	.p2align 3
.L14:
	.loc 1 115 0 is_stmt 1 discriminator 1
	xorl	%eax, %eax
	testl	%r8d, %r8d
	leaq	(%r15,%rdi), %rcx
	leaq	(%rsi,%rdi), %rdx
	jle	.L18
.LVL14:
	.p2align 4,,10
	.p2align 3
.L28:
	.loc 1 116 0 discriminator 3
	movsd	(%rcx,%rax,8), %xmm0
	movsd	%xmm0, (%rdx,%rax,8)
.LVL15:
	addq	$1, %rax
.LVL16:
	.loc 1 115 0 discriminator 3
	cmpl	%eax, %r8d
	jg	.L28
.L18:
	.loc 1 114 0
	addl	$1, %r9d
.LVL17:
	addq	%r10, %rdi
	cmpl	%r11d, %r9d
	jne	.L14
.LVL18:
.L1:
.LBE12:
	.loc 1 121 0
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
.LVL19:
.L43:
	.cfi_restore_state
.LBB13:
	.loc 1 55 0 discriminator 1
	cmpl	%eax, %r12d
	je	.L45
	.loc 1 61 0
	testl	%r13d, %r13d
	je	.L8
.L21:
	.loc 1 75 0
	movsd	(%rsi,%rdi), %xmm7
	movsd	8(%rsi,%rdi), %xmm6
	movapd	%xmm7, %xmm5
	addsd	-8(%rsi,%rdi), %xmm6
	addsd	%xmm7, %xmm5
	subsd	%xmm5, %xmm6
	.loc 1 76 0
	movsd	(%r10,%rdi), %xmm5
	.loc 1 75 0
	divsd	%xmm1, %xmm6
	.loc 1 74 0
	addsd	(%r14,%rdi), %xmm6
.L38:
	.loc 1 64 0
	subsd	%xmm7, %xmm5
	divsd	%xmm2, %xmm5
.L37:
	.loc 1 63 0
	addsd	%xmm5, %xmm6
	.loc 1 65 0
	movsd	amb_temp(%rip), %xmm5
	subsd	%xmm7, %xmm5
	divsd	%xmm3, %xmm5
	.loc 1 64 0
	addsd	%xmm5, %xmm6
	movsd	(%rdx), %xmm5
	.loc 1 65 0
	mulsd	%xmm8, %xmm6
.LVL20:
	jmp	.L5
.LVL21:
.L22:
	.loc 1 81 0
	movq	-48(%rsp), %rbx
	movsd	(%rbx), %xmm7
	movq	-32(%rsp), %rbx
	movapd	%xmm7, %xmm5
	movsd	(%rbx), %xmm6
	movq	-40(%rsp), %rbx
	addsd	%xmm7, %xmm5
	addsd	(%rbx), %xmm6
	.loc 1 80 0
	movq	-64(%rsp), %rbx
	.loc 1 81 0
	subsd	%xmm5, %xmm6
	divsd	%xmm2, %xmm6
	.loc 1 80 0
	addsd	(%rbx), %xmm6
	.loc 1 82 0
	movq	-56(%rsp), %rbx
	movsd	(%rbx), %xmm5
	subsd	%xmm7, %xmm5
	divsd	%xmm1, %xmm5
	jmp	.L37
.L44:
	.loc 1 61 0 discriminator 1
	cmpl	%eax, %r12d
	je	.L46
.L8:
	.loc 1 67 0 discriminator 1
	testl	%eax, %eax
	je	.L47
	.loc 1 73 0
	testq	%rbp, %rbp
	je	.L21
	.loc 1 79 0
	cmpl	%eax, %r12d
	je	.L22
	.loc 1 85 0
	cmpl	%r9d, %r13d
	jne	.L12
	.loc 1 87 0
	movsd	(%rdx), %xmm5
	movsd	8(%rdx), %xmm7
	movapd	%xmm5, %xmm6
	addsd	-8(%rdx), %xmm7
	addsd	%xmm5, %xmm6
	subsd	%xmm6, %xmm7
	.loc 1 88 0
	movsd	(%r11,%rdi), %xmm6
	subsd	%xmm5, %xmm6
	.loc 1 87 0
	divsd	%xmm1, %xmm7
	.loc 1 88 0
	divsd	%xmm2, %xmm6
	.loc 1 86 0
	addsd	(%r14,%rcx), %xmm7
	.loc 1 87 0
	addsd	%xmm6, %xmm7
	.loc 1 89 0
	movsd	amb_temp(%rip), %xmm6
	subsd	%xmm5, %xmm6
	divsd	%xmm3, %xmm6
	.loc 1 88 0
	addsd	%xmm7, %xmm6
	.loc 1 89 0
	mulsd	%xmm8, %xmm6
.LVL22:
	jmp	.L5
.LVL23:
.L45:
	.loc 1 57 0
	movq	-8(%rsp), %rbx
	movsd	(%rbx), %xmm7
	movq	-16(%rsp), %rbx
	movsd	(%rbx), %xmm6
	.loc 1 56 0
	movq	-24(%rsp), %rbx
	.loc 1 57 0
	subsd	%xmm7, %xmm6
	divsd	%xmm1, %xmm6
	.loc 1 56 0
	addsd	(%rbx), %xmm6
	.loc 1 58 0
	movq	(%rsp), %rbx
.L36:
	.loc 1 64 0
	movsd	(%rbx), %xmm5
	jmp	.L38
.L46:
	.loc 1 63 0
	movq	-48(%rsp), %rbx
	movsd	(%rbx), %xmm7
	movq	-56(%rsp), %rbx
	movsd	(%rbx), %xmm6
	.loc 1 62 0
	movq	-64(%rsp), %rbx
	.loc 1 63 0
	subsd	%xmm7, %xmm6
	divsd	%xmm1, %xmm6
	.loc 1 62 0
	addsd	(%rbx), %xmm6
	.loc 1 64 0
	movq	-40(%rsp), %rbx
	jmp	.L36
.L47:
	.loc 1 69 0
	movq	-104(%rsp), %rbx
	.loc 1 70 0
	movsd	(%r11), %xmm5
	.loc 1 69 0
	movsd	(%rbx), %xmm7
	movsd	8(%rbx), %xmm6
	.loc 1 68 0
	movq	-96(%rsp), %rbx
	.loc 1 69 0
	subsd	%xmm7, %xmm6
	divsd	%xmm1, %xmm6
	.loc 1 68 0
	addsd	(%r14,%rbx), %xmm6
	jmp	.L38
.LBE13:
	.cfi_endproc
.LFE19:
	.size	_Z16single_iterationPdS_S_iiddddd, .-_Z16single_iterationPdS_S_iiddddd
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.section	.text.unlikely
.LCOLDB8:
	.text
.LHOTB8:
	.p2align 4,,15
	.globl	_Z17compute_tran_tempPdiS_S_ii
	.type	_Z17compute_tran_tempPdiS_S_ii, @function
_Z17compute_tran_tempPdiS_S_ii:
.LFB20:
	.loc 1 128 0
	.cfi_startproc
.LVL24:
.LBB14:
	.loc 1 133 0
	pxor	%xmm0, %xmm0
.LBE14:
	.loc 1 128 0
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
.LBB18:
.LBB15:
	.loc 1 150 0
	xorl	%r13d, %r13d
.LBE15:
.LBE18:
	.loc 1 128 0
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %r15
.LBB19:
	.loc 1 133 0
	cvtsi2sd	%r8d, %xmm0
.LBE19:
	.loc 1 128 0
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %r14
	movl	%esi, %ebx
	movl	%r8d, %r12d
	subq	$48, %rsp
	.cfi_def_cfa_offset 104
.LBB20:
.LBB16:
	.loc 1 150 0
	testl	%esi, %esi
.LBE16:
.LBE20:
	.loc 1 128 0
	movl	%r9d, %ebp
.LBB21:
	.loc 1 133 0
	movsd	chip_height(%rip), %xmm2
.LBE21:
	.loc 1 128 0
	movq	%rcx, 40(%rsp)
.LBB22:
	.loc 1 134 0
	movsd	chip_width(%rip), %xmm1
	.loc 1 136 0
	movsd	.LC1(%rip), %xmm3
	.loc 1 133 0
	divsd	%xmm0, %xmm2
.LVL25:
	.loc 1 134 0
	pxor	%xmm0, %xmm0
	cvtsi2sd	%r9d, %xmm0
	.loc 1 138 0
	movapd	%xmm2, %xmm6
	.loc 1 134 0
	divsd	%xmm0, %xmm1
.LVL26:
	.loc 1 136 0
	movsd	t_chip(%rip), %xmm0
	mulsd	%xmm0, %xmm3
	.loc 1 139 0
	movapd	%xmm0, %xmm7
	.loc 1 137 0
	movapd	%xmm1, %xmm5
	.loc 1 136 0
	mulsd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm3
	movsd	%xmm3, (%rsp)
.LVL27:
	.loc 1 137 0
	movsd	.LC2(%rip), %xmm3
.LVL28:
	mulsd	%xmm0, %xmm3
	.loc 1 141 0
	mulsd	.LC4(%rip), %xmm0
	.loc 1 137 0
	movapd	%xmm3, %xmm4
	.loc 1 138 0
	mulsd	%xmm1, %xmm3
	.loc 1 137 0
	mulsd	%xmm2, %xmm4
	.loc 1 139 0
	mulsd	.LC3(%rip), %xmm2
.LVL29:
	.loc 1 141 0
	mulsd	.LC5(%rip), %xmm0
	.loc 1 138 0
	divsd	%xmm3, %xmm6
.LVL30:
	.loc 1 139 0
	mulsd	%xmm2, %xmm1
.LVL31:
	.loc 1 137 0
	divsd	%xmm4, %xmm5
.LVL32:
	.loc 1 138 0
	movsd	%xmm6, 16(%rsp)
	.loc 1 139 0
	divsd	%xmm1, %xmm7
	.loc 1 137 0
	movsd	%xmm5, 8(%rsp)
.LVL33:
	.loc 1 141 0
	movsd	.LC6(%rip), %xmm1
	divsd	%xmm0, %xmm1
	.loc 1 139 0
	movsd	%xmm7, 24(%rsp)
.LVL34:
	.loc 1 141 0
	movapd	%xmm1, %xmm0
	.loc 1 142 0
	movsd	.LC7(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movsd	%xmm1, 32(%rsp)
.LVL35:
.LBB17:
	.loc 1 150 0
	jle	.L48
.LVL36:
	.p2align 4,,10
	.p2align 3
.L52:
	.loc 1 155 0 discriminator 3
	movq	40(%rsp), %rdx
	movl	%ebp, %r8d
	movl	%r12d, %ecx
	movsd	32(%rsp), %xmm4
	movq	%r14, %rsi
	movsd	24(%rsp), %xmm3
	movq	%r15, %rdi
	movsd	16(%rsp), %xmm2
	.loc 1 150 0 discriminator 3
	addl	$1, %r13d
.LVL37:
	.loc 1 155 0 discriminator 3
	movsd	8(%rsp), %xmm1
	movsd	(%rsp), %xmm0
	call	_Z16single_iterationPdS_S_iiddddd
.LVL38:
	.loc 1 150 0 discriminator 3
	cmpl	%ebx, %r13d
	jne	.L52
.LVL39:
.L48:
.LBE17:
.LBE22:
	.loc 1 161 0
	addq	$48, %rsp
	.cfi_def_cfa_offset 56
.LVL40:
	popq	%rbx
	.cfi_def_cfa_offset 48
.LVL41:
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL42:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL43:
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL44:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL45:
	ret
	.cfi_endproc
.LFE20:
	.size	_Z17compute_tran_tempPdiS_S_ii, .-_Z17compute_tran_tempPdiS_S_ii
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC9:
	.string	"error: %s\n"
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	_Z5fatalPc
	.type	_Z5fatalPc, @function
_Z5fatalPc:
.LFB21:
	.loc 1 164 0
	.cfi_startproc
.LVL46:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 164 0
	movq	%rdi, %rdx
	.loc 1 165 0
	movq	stderr(%rip), %rdi
.LVL47:
	movl	$.LC9, %esi
	xorl	%eax, %eax
	call	fprintf
.LVL48:
	.loc 1 166 0
	movl	$1, %edi
	call	exit
.LVL49:
	.cfi_endproc
.LFE21:
	.size	_Z5fatalPc, .-_Z5fatalPc
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.rodata.str1.1
.LC11:
	.string	"r"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC12:
	.string	"file could not be opened for reading"
	.section	.rodata.str1.1
.LC13:
	.string	"not enough lines in file"
.LC14:
	.string	"%lf"
.LC15:
	.string	"invalid file format"
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	_Z10read_inputPdiiPc
	.type	_Z10read_inputPdiiPc, @function
_Z10read_inputPdiiPc:
.LFB22:
	.loc 1 170 0
	.cfi_startproc
.LVL50:
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
.LBB23:
	.loc 1 176 0
	movl	$.LC11, %esi
.LVL51:
.LBE23:
	.loc 1 170 0
	movq	%rdi, %rbx
.LBB24:
	.loc 1 176 0
	movq	%rcx, %rdi
.LVL52:
.LBE24:
	.loc 1 170 0
	movl	%edx, %r12d
	subq	$280, %rsp
	.cfi_def_cfa_offset 320
.LBB25:
	.loc 1 176 0
	call	fopen
.LVL53:
	.loc 1 177 0
	testq	%rax, %rax
	.loc 1 176 0
	movq	%rax, %rbp
.LVL54:
	.loc 1 177 0
	je	.L58
.LVL55:
	.loc 1 180 0 discriminator 1
	movl	%r13d, %edx
	imull	%r12d, %edx
	testl	%edx, %edx
	jle	.L63
	subl	$1, %edx
	leaq	8(%rbx,%rdx,8), %r12
.LVL56:
	.p2align 4,,10
	.p2align 3
.L62:
	.loc 1 181 0
	leaq	16(%rsp), %rdi
	movq	%rbp, %rdx
	movl	$256, %esi
	call	fgets
.LVL57:
	.loc 1 182 0
	movq	%rbp, %rdi
	call	feof
.LVL58:
	testl	%eax, %eax
	jne	.L67
	.loc 1 184 0
	leaq	8(%rsp), %rdx
	leaq	16(%rsp), %rdi
	xorl	%eax, %eax
	movl	$.LC14, %esi
	call	sscanf
.LVL59:
	cmpl	$1, %eax
	jne	.L68
	.loc 1 186 0 discriminator 2
	movsd	8(%rsp), %xmm0
	addq	$8, %rbx
	movsd	%xmm0, -8(%rbx)
	.loc 1 180 0 discriminator 2
	cmpq	%r12, %rbx
	jne	.L62
.L63:
	.loc 1 189 0
	movq	%rbp, %rdi
	call	fclose
.LVL60:
.LBE25:
	.loc 1 190 0
	addq	$280, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
.LVL61:
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL62:
	ret
.LVL63:
.L67:
	.cfi_restore_state
.LBB26:
	.loc 1 183 0
	movl	$.LC13, %edi
	call	_Z5fatalPc
.LVL64:
.L68:
	.loc 1 185 0
	movl	$.LC15, %edi
	call	_Z5fatalPc
.LVL65:
.L58:
	.loc 1 178 0
	movl	$.LC12, %edi
	call	_Z5fatalPc
.LVL66:
.LBE26:
	.cfi_endproc
.LFE22:
	.size	_Z10read_inputPdiiPc, .-_Z10read_inputPdiiPc
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Usage: %s <grid_rows> <grid_cols> <sim_time> <no. of threads><temp_file> <power_file>\n"
	.align 8
.LC18:
	.string	"\t<grid_rows>  - number of rows in the grid (positive integer)\n"
	.align 8
.LC19:
	.string	"\t<grid_cols>  - number of columns in the grid (positive integer)\n"
	.align 8
.LC20:
	.string	"\t<sim_time>   - number of iterations\n"
	.align 8
.LC21:
	.string	"\t<no. of threads>   - number of threads\n"
	.align 8
.LC22:
	.string	"\t<temp_file>  - name of the file containing the initial temperature values of each cell\n"
	.align 8
.LC23:
	.string	"\t<power_file> - name of the file containing the dissipated power values of each cell\n"
	.section	.text.unlikely
.LCOLDB24:
	.text
.LHOTB24:
	.p2align 4,,15
	.globl	_Z5usageiPPc
	.type	_Z5usageiPPc, @function
_Z5usageiPPc:
.LFB23:
	.loc 1 193 0
	.cfi_startproc
.LVL67:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 194 0
	movq	(%rsi), %rdx
	movq	stderr(%rip), %rdi
.LVL68:
	movl	$.LC17, %esi
.LVL69:
	xorl	%eax, %eax
	call	fprintf
.LVL70:
	.loc 1 195 0
	movq	stderr(%rip), %rcx
	movl	$62, %edx
	movl	$1, %esi
	movl	$.LC18, %edi
	call	fwrite
.LVL71:
	.loc 1 196 0
	movq	stderr(%rip), %rcx
	movl	$65, %edx
	movl	$1, %esi
	movl	$.LC19, %edi
	call	fwrite
.LVL72:
	.loc 1 197 0
	movq	stderr(%rip), %rcx
	movl	$37, %edx
	movl	$1, %esi
	movl	$.LC20, %edi
	call	fwrite
.LVL73:
	.loc 1 198 0
	movq	stderr(%rip), %rcx
	movl	$40, %edx
	movl	$1, %esi
	movl	$.LC21, %edi
	call	fwrite
.LVL74:
	.loc 1 199 0
	movq	stderr(%rip), %rcx
	movl	$88, %edx
	movl	$1, %esi
	movl	$.LC22, %edi
	call	fwrite
.LVL75:
	.loc 1 200 0
	movq	stderr(%rip), %rcx
	movl	$.LC23, %edi
	movl	$85, %edx
	movl	$1, %esi
	call	fwrite
.LVL76:
	.loc 1 201 0
	movl	$1, %edi
	call	exit
.LVL77:
	.cfi_endproc
.LFE23:
	.size	_Z5usageiPPc, .-_Z5usageiPPc
	.section	.text.unlikely
.LCOLDE24:
	.text
.LHOTE24:
	.section	.rodata.str1.1
.LC25:
	.string	"unable to allocate memory"
	.section	.rodata.str1.8
	.align 8
.LC26:
	.string	"Start computing the transient temperature"
	.section	.rodata.str1.1
.LC27:
	.string	"Ending simulation"
	.section	.text.unlikely
.LCOLDB28:
	.section	.text.startup,"ax",@progbits
.LHOTB28:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.loc 1 205 0
	.cfi_startproc
.LVL78:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r15
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
.LBB27:
	.loc 1 211 0
	cmpl	$7, %edi
	jne	.L81
.LVL79:
.LBB28:
.LBB29:
	.file 2 "/usr/include/stdlib.h"
	.loc 2 286 0
	movq	8(%rsi), %rdi
.LVL80:
	movl	$10, %edx
	xorl	%esi, %esi
.LVL81:
	call	strtol
.LVL82:
.LBE29:
.LBE28:
	.loc 1 215 0
	testl	%eax, %eax
.LBB31:
.LBB30:
	.loc 2 286 0
	movq	%rax, %rbx
.LBE30:
.LBE31:
	.loc 1 215 0
	jle	.L73
.LVL83:
.LBB32:
.LBB33:
	.loc 2 286 0
	movq	16(%r15), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
.LVL84:
.LBE33:
.LBE32:
	.loc 1 213 0
	testl	%eax, %eax
.LBB35:
.LBB34:
	.loc 2 286 0
	movq	%rax, %rbp
.LBE34:
.LBE35:
	.loc 1 213 0
	jle	.L73
.LVL85:
.LBB36:
.LBB37:
	.loc 2 286 0
	movq	24(%r15), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
.LVL86:
.LBE37:
.LBE36:
	.loc 1 214 0
	testl	%eax, %eax
.LBB39:
.LBB38:
	.loc 2 286 0
	movq	%rax, (%rsp)
.LBE38:
.LBE39:
	.loc 1 214 0
	jle	.L73
.LVL87:
.LBB40:
.LBB41:
	.loc 2 286 0 discriminator 2
	movq	32(%r15), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol
.LVL88:
.LBE41:
.LBE40:
	.loc 1 215 0 discriminator 2
	testl	%eax, %eax
	movl	%eax, num_omp_threads(%rip)
	jle	.L73
.LVL89:
	.loc 1 221 0
	movl	%ebp, %r14d
	movl	$8, %esi
	imull	%ebx, %r14d
	movslq	%r14d, %r14
	movq	%r14, %rdi
	call	calloc
.LVL90:
	.loc 1 222 0
	movl	$8, %esi
	movq	%r14, %rdi
	.loc 1 221 0
	movq	%rax, %r12
.LVL91:
	.loc 1 222 0
	call	calloc
.LVL92:
	.loc 1 223 0
	movl	$8, %esi
	.loc 1 222 0
	movq	%rax, %r13
.LVL93:
	.loc 1 223 0
	movq	%r14, %rdi
	call	calloc
.LVL94:
	.loc 1 224 0
	testq	%r13, %r13
	.loc 1 223 0
	movq	%rax, 8(%rsp)
.LVL95:
	.loc 1 224 0
	je	.L75
	testq	%r12, %r12
	je	.L75
.LVL96:
	.loc 1 229 0
	movq	48(%r15), %r14
.LVL97:
	.loc 1 230 0
	movq	40(%r15), %rcx
	movl	%ebp, %edx
	movl	%ebx, %esi
	movq	%r12, %rdi
	call	_Z10read_inputPdiiPc
.LVL98:
	.loc 1 231 0
	movq	%r14, %rcx
	movl	%ebp, %edx
	movl	%ebx, %esi
	movq	%r13, %rdi
	call	_Z10read_inputPdiiPc
.LVL99:
	.loc 1 233 0
	movl	$.LC26, %edi
	call	puts
.LVL100:
	.loc 1 234 0
	movl	(%rsp), %esi
	movq	8(%rsp), %rdi
	movl	%ebp, %r9d
	movl	%ebx, %r8d
	movq	%r13, %rcx
	movq	%r12, %rdx
	call	_Z17compute_tran_tempPdiS_S_ii
.LVL101:
	.loc 1 235 0
	movl	$.LC27, %edi
	call	puts
.LVL102:
	.loc 1 246 0
	movq	%r12, %rdi
	call	free
.LVL103:
	.loc 1 247 0
	movq	%r13, %rdi
	call	free
.LVL104:
.LBE27:
	.loc 1 250 0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
.LVL105:
	popq	%r12
	.cfi_def_cfa_offset 32
.LVL106:
	popq	%r13
	.cfi_def_cfa_offset 24
.LVL107:
	popq	%r14
	.cfi_def_cfa_offset 16
.LVL108:
	popq	%r15
	.cfi_def_cfa_offset 8
.LVL109:
	ret
.LVL110:
	.p2align 4,,10
	.p2align 3
.L73:
	.cfi_restore_state
.LBB42:
	.loc 1 218 0
	movq	%r15, %rsi
	movl	$7, %edi
	call	_Z5usageiPPc
.LVL111:
.L75:
	.loc 1 225 0
	movl	$.LC25, %edi
	call	_Z5fatalPc
.LVL112:
.L81:
	.loc 1 212 0
	call	_Z5usageiPPc
.LVL113:
.LBE42:
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE28:
	.section	.text.startup
.LHOTE28:
	.globl	num_omp_threads
	.bss
	.align 4
	.type	num_omp_threads, @object
	.size	num_omp_threads, 4
num_omp_threads:
	.zero	4
	.globl	amb_temp
	.data
	.align 8
	.type	amb_temp, @object
	.size	amb_temp, 8
amb_temp:
	.long	0
	.long	1079246848
	.globl	chip_width
	.align 8
	.type	chip_width, @object
	.size	chip_width, 8
chip_width:
	.long	3539053052
	.long	1066426957
	.globl	chip_height
	.align 8
	.type	chip_height, @object
	.size	chip_height, 8
chip_height:
	.long	3539053052
	.long	1066426957
	.globl	t_chip
	.align 8
	.type	t_chip, @object
	.size	t_chip, 8
t_chip:
	.long	3539053052
	.long	1061184077
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093317616
	.align 8
.LC2:
	.long	0
	.long	1080623104
	.align 8
.LC3:
	.long	0
	.long	1079574528
	.align 8
.LC4:
	.long	0
	.long	1071644672
	.align 8
.LC5:
	.long	0
	.long	1094366192
	.align 8
.LC6:
	.long	0
	.long	1095164768
	.align 8
.LC7:
	.long	3539053052
	.long	1062232653
	.text
.Letext0:
	.section	.text.unlikely
.Letext_cold0:
	.file 3 "/opt/gcc-4.9.1/lib/gcc/x86_64-unknown-linux-gnu/4.9.1/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/stdio.h"
	.file 6 "/usr/include/libio.h"
	.file 7 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xdc7
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF101
	.byte	0x4
	.long	.LASF102
	.long	.LASF103
	.long	.Ldebug_ranges0+0x200
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF8
	.byte	0x3
	.byte	0xd4
	.long	0x3b
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF6
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF9
	.byte	0x4
	.byte	0x8d
	.long	0x6c
	.uleb128 0x3
	.long	.LASF10
	.byte	0x4
	.byte	0x8e
	.long	0x6c
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x98
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x3
	.long	.LASF13
	.byte	0x5
	.byte	0x31
	.long	0xaa
	.uleb128 0x7
	.long	.LASF43
	.byte	0xd8
	.byte	0x6
	.value	0x10f
	.long	0x231
	.uleb128 0x8
	.long	.LASF14
	.byte	0x6
	.value	0x110
	.long	0x65
	.byte	0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x6
	.value	0x115
	.long	0x92
	.byte	0x8
	.uleb128 0x8
	.long	.LASF16
	.byte	0x6
	.value	0x116
	.long	0x92
	.byte	0x10
	.uleb128 0x8
	.long	.LASF17
	.byte	0x6
	.value	0x117
	.long	0x92
	.byte	0x18
	.uleb128 0x8
	.long	.LASF18
	.byte	0x6
	.value	0x118
	.long	0x92
	.byte	0x20
	.uleb128 0x8
	.long	.LASF19
	.byte	0x6
	.value	0x119
	.long	0x92
	.byte	0x28
	.uleb128 0x8
	.long	.LASF20
	.byte	0x6
	.value	0x11a
	.long	0x92
	.byte	0x30
	.uleb128 0x8
	.long	.LASF21
	.byte	0x6
	.value	0x11b
	.long	0x92
	.byte	0x38
	.uleb128 0x8
	.long	.LASF22
	.byte	0x6
	.value	0x11c
	.long	0x92
	.byte	0x40
	.uleb128 0x8
	.long	.LASF23
	.byte	0x6
	.value	0x11e
	.long	0x92
	.byte	0x48
	.uleb128 0x8
	.long	.LASF24
	.byte	0x6
	.value	0x11f
	.long	0x92
	.byte	0x50
	.uleb128 0x8
	.long	.LASF25
	.byte	0x6
	.value	0x120
	.long	0x92
	.byte	0x58
	.uleb128 0x8
	.long	.LASF26
	.byte	0x6
	.value	0x122
	.long	0x269
	.byte	0x60
	.uleb128 0x8
	.long	.LASF27
	.byte	0x6
	.value	0x124
	.long	0x26f
	.byte	0x68
	.uleb128 0x8
	.long	.LASF28
	.byte	0x6
	.value	0x126
	.long	0x65
	.byte	0x70
	.uleb128 0x8
	.long	.LASF29
	.byte	0x6
	.value	0x12a
	.long	0x65
	.byte	0x74
	.uleb128 0x8
	.long	.LASF30
	.byte	0x6
	.value	0x12c
	.long	0x73
	.byte	0x78
	.uleb128 0x8
	.long	.LASF31
	.byte	0x6
	.value	0x130
	.long	0x49
	.byte	0x80
	.uleb128 0x8
	.long	.LASF32
	.byte	0x6
	.value	0x131
	.long	0x57
	.byte	0x82
	.uleb128 0x8
	.long	.LASF33
	.byte	0x6
	.value	0x132
	.long	0x275
	.byte	0x83
	.uleb128 0x8
	.long	.LASF34
	.byte	0x6
	.value	0x136
	.long	0x285
	.byte	0x88
	.uleb128 0x8
	.long	.LASF35
	.byte	0x6
	.value	0x13f
	.long	0x7e
	.byte	0x90
	.uleb128 0x8
	.long	.LASF36
	.byte	0x6
	.value	0x148
	.long	0x90
	.byte	0x98
	.uleb128 0x8
	.long	.LASF37
	.byte	0x6
	.value	0x149
	.long	0x90
	.byte	0xa0
	.uleb128 0x8
	.long	.LASF38
	.byte	0x6
	.value	0x14a
	.long	0x90
	.byte	0xa8
	.uleb128 0x8
	.long	.LASF39
	.byte	0x6
	.value	0x14b
	.long	0x90
	.byte	0xb0
	.uleb128 0x8
	.long	.LASF40
	.byte	0x6
	.value	0x14c
	.long	0x30
	.byte	0xb8
	.uleb128 0x8
	.long	.LASF41
	.byte	0x6
	.value	0x14e
	.long	0x65
	.byte	0xc0
	.uleb128 0x8
	.long	.LASF42
	.byte	0x6
	.value	0x150
	.long	0x28b
	.byte	0xc4
	.byte	0
	.uleb128 0x9
	.long	.LASF104
	.byte	0x6
	.byte	0xb4
	.uleb128 0xa
	.long	.LASF44
	.byte	0x18
	.byte	0x6
	.byte	0xba
	.long	0x269
	.uleb128 0xb
	.long	.LASF45
	.byte	0x6
	.byte	0xbb
	.long	0x269
	.byte	0
	.uleb128 0xb
	.long	.LASF46
	.byte	0x6
	.byte	0xbc
	.long	0x26f
	.byte	0x8
	.uleb128 0xb
	.long	.LASF47
	.byte	0x6
	.byte	0xc0
	.long	0x65
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x238
	.uleb128 0x6
	.byte	0x8
	.long	0xaa
	.uleb128 0xc
	.long	0x98
	.long	0x285
	.uleb128 0xd
	.long	0x89
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x231
	.uleb128 0xc
	.long	0x98
	.long	0x29b
	.uleb128 0xd
	.long	0x89
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x2a1
	.uleb128 0xe
	.long	0x98
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF48
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF49
	.uleb128 0x6
	.byte	0x8
	.long	0x2ba
	.uleb128 0xf
	.uleb128 0x10
	.string	"std"
	.byte	0x7
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.byte	0x5
	.long	0x2bb
	.uleb128 0x12
	.long	.LASF88
	.byte	0x2
	.value	0x11c
	.long	0x65
	.byte	0x3
	.long	0x2e7
	.uleb128 0x13
	.long	.LASF105
	.byte	0x2
	.value	0x11c
	.long	0x29b
	.byte	0
	.uleb128 0x14
	.long	.LASF55
	.byte	0x1
	.byte	0x20
	.long	.LASF57
	.quad	.LFB19
	.quad	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.long	0x3bf
	.uleb128 0x15
	.long	.LASF50
	.byte	0x1
	.byte	0x20
	.long	0x3bf
	.long	.LLST0
	.uleb128 0x16
	.long	.LASF51
	.byte	0x1
	.byte	0x20
	.long	0x3bf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x15
	.long	.LASF52
	.byte	0x1
	.byte	0x20
	.long	0x3bf
	.long	.LLST1
	.uleb128 0x17
	.string	"row"
	.byte	0x1
	.byte	0x20
	.long	0x65
	.long	.LLST2
	.uleb128 0x18
	.string	"col"
	.byte	0x1
	.byte	0x20
	.long	0x65
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x17
	.string	"Cap"
	.byte	0x1
	.byte	0x21
	.long	0x29
	.long	.LLST3
	.uleb128 0x18
	.string	"Rx"
	.byte	0x1
	.byte	0x21
	.long	0x29
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x18
	.string	"Ry"
	.byte	0x1
	.byte	0x21
	.long	0x29
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x18
	.string	"Rz"
	.byte	0x1
	.byte	0x21
	.long	0x29
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x16
	.long	.LASF53
	.byte	0x1
	.byte	0x22
	.long	0x29
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x19
	.long	.Ldebug_ranges0+0
	.uleb128 0x1a
	.long	.LASF54
	.byte	0x1
	.byte	0x26
	.long	0x29
	.long	.LLST4
	.uleb128 0x1b
	.string	"r"
	.byte	0x1
	.byte	0x27
	.long	0x65
	.long	.LLST5
	.uleb128 0x1b
	.string	"c"
	.byte	0x1
	.byte	0x27
	.long	0x65
	.long	.LLST6
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x29
	.uleb128 0x14
	.long	.LASF56
	.byte	0x1
	.byte	0x7f
	.long	.LASF58
	.quad	.LFB20
	.quad	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.long	0x532
	.uleb128 0x15
	.long	.LASF50
	.byte	0x1
	.byte	0x7f
	.long	0x3bf
	.long	.LLST7
	.uleb128 0x15
	.long	.LASF59
	.byte	0x1
	.byte	0x7f
	.long	0x65
	.long	.LLST8
	.uleb128 0x15
	.long	.LASF51
	.byte	0x1
	.byte	0x7f
	.long	0x3bf
	.long	.LLST9
	.uleb128 0x15
	.long	.LASF52
	.byte	0x1
	.byte	0x7f
	.long	0x3bf
	.long	.LLST10
	.uleb128 0x17
	.string	"row"
	.byte	0x1
	.byte	0x7f
	.long	0x65
	.long	.LLST11
	.uleb128 0x17
	.string	"col"
	.byte	0x1
	.byte	0x7f
	.long	0x65
	.long	.LLST12
	.uleb128 0x19
	.long	.Ldebug_ranges0+0x40
	.uleb128 0x1a
	.long	.LASF60
	.byte	0x1
	.byte	0x85
	.long	0x29
	.long	.LLST13
	.uleb128 0x1a
	.long	.LASF61
	.byte	0x1
	.byte	0x86
	.long	0x29
	.long	.LLST14
	.uleb128 0x1b
	.string	"Cap"
	.byte	0x1
	.byte	0x88
	.long	0x29
	.long	.LLST15
	.uleb128 0x1b
	.string	"Rx"
	.byte	0x1
	.byte	0x89
	.long	0x29
	.long	.LLST16
	.uleb128 0x1b
	.string	"Ry"
	.byte	0x1
	.byte	0x8a
	.long	0x29
	.long	.LLST17
	.uleb128 0x1b
	.string	"Rz"
	.byte	0x1
	.byte	0x8b
	.long	0x29
	.long	.LLST18
	.uleb128 0x1c
	.long	.LASF62
	.byte	0x1
	.byte	0x8d
	.long	0x29
	.uleb128 0x1a
	.long	.LASF53
	.byte	0x1
	.byte	0x8e
	.long	0x29
	.long	.LLST19
	.uleb128 0x1d
	.string	"t"
	.byte	0x1
	.byte	0x8f
	.long	0x29
	.uleb128 0x19
	.long	.Ldebug_ranges0+0xb0
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0x96
	.long	0x65
	.long	.LLST20
	.uleb128 0x1e
	.quad	.LVL38
	.long	0x2e7
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -64
	.byte	0x6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x61
	.uleb128 0x5
	.byte	0x77
	.sleb128 0
	.byte	0xf6
	.byte	0x8
	.uleb128 0x29
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x62
	.uleb128 0x6
	.byte	0x91
	.sleb128 -96
	.byte	0xf6
	.byte	0x8
	.uleb128 0x29
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x63
	.uleb128 0x6
	.byte	0x91
	.sleb128 -88
	.byte	0xf6
	.byte	0x8
	.uleb128 0x29
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x64
	.uleb128 0x6
	.byte	0x91
	.sleb128 -80
	.byte	0xf6
	.byte	0x8
	.uleb128 0x29
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x65
	.uleb128 0x6
	.byte	0x91
	.sleb128 -72
	.byte	0xf6
	.byte	0x8
	.uleb128 0x29
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF63
	.byte	0x1
	.byte	0xa3
	.long	.LASF64
	.quad	.LFB21
	.quad	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.long	0x59a
	.uleb128 0x17
	.string	"s"
	.byte	0x1
	.byte	0xa3
	.long	0x92
	.long	.LLST21
	.uleb128 0x20
	.quad	.LVL48
	.long	0xc95
	.long	0x586
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x1e
	.quad	.LVL49
	.long	0xcb1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF65
	.byte	0x1
	.byte	0xa9
	.long	.LASF66
	.quad	.LFB22
	.quad	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.long	0x744
	.uleb128 0x15
	.long	.LASF67
	.byte	0x1
	.byte	0xa9
	.long	0x3bf
	.long	.LLST22
	.uleb128 0x15
	.long	.LASF68
	.byte	0x1
	.byte	0xa9
	.long	0x65
	.long	.LLST23
	.uleb128 0x15
	.long	.LASF69
	.byte	0x1
	.byte	0xa9
	.long	0x65
	.long	.LLST24
	.uleb128 0x15
	.long	.LASF70
	.byte	0x1
	.byte	0xa9
	.long	0x92
	.long	.LLST25
	.uleb128 0x19
	.long	.Ldebug_ranges0+0xf0
	.uleb128 0x1b
	.string	"i"
	.byte	0x1
	.byte	0xab
	.long	0x65
	.long	.LLST26
	.uleb128 0x1c
	.long	.LASF71
	.byte	0x1
	.byte	0xab
	.long	0x65
	.uleb128 0x1b
	.string	"fp"
	.byte	0x1
	.byte	0xac
	.long	0x744
	.long	.LLST27
	.uleb128 0x21
	.string	"str"
	.byte	0x1
	.byte	0xad
	.long	0x74a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x21
	.string	"val"
	.byte	0x1
	.byte	0xae
	.long	0x29
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.uleb128 0x20
	.quad	.LVL53
	.long	0xcc3
	.long	0x666
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.byte	0
	.uleb128 0x20
	.quad	.LVL57
	.long	0xcde
	.long	0x68c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.value	0x100
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL58
	.long	0xcfe
	.long	0x6a4
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL59
	.long	0xd14
	.long	0x6d1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0x91
	.sleb128 -304
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC14
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x3
	.byte	0x91
	.sleb128 -312
	.byte	0
	.uleb128 0x20
	.quad	.LVL60
	.long	0xd30
	.long	0x6e9
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL64
	.long	0x532
	.long	0x708
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC13
	.byte	0
	.uleb128 0x20
	.quad	.LVL65
	.long	0x532
	.long	0x727
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC15
	.byte	0
	.uleb128 0x1e
	.quad	.LVL66
	.long	0x532
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC12
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x9f
	.uleb128 0xc
	.long	0x98
	.long	0x75a
	.uleb128 0xd
	.long	0x89
	.byte	0xff
	.byte	0
	.uleb128 0x14
	.long	.LASF72
	.byte	0x1
	.byte	0xc0
	.long	.LASF73
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x8c8
	.uleb128 0x15
	.long	.LASF74
	.byte	0x1
	.byte	0xc0
	.long	0x65
	.long	.LLST28
	.uleb128 0x15
	.long	.LASF75
	.byte	0x1
	.byte	0xc0
	.long	0x8c8
	.long	.LLST29
	.uleb128 0x20
	.quad	.LVL70
	.long	0xc95
	.long	0x7b8
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC17
	.byte	0
	.uleb128 0x20
	.quad	.LVL71
	.long	0xd45
	.long	0x7e2
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC18
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x3e
	.byte	0
	.uleb128 0x20
	.quad	.LVL72
	.long	0xd45
	.long	0x80c
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC19
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x41
	.byte	0
	.uleb128 0x20
	.quad	.LVL73
	.long	0xd45
	.long	0x836
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC20
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x25
	.byte	0
	.uleb128 0x20
	.quad	.LVL74
	.long	0xd45
	.long	0x860
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC21
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x28
	.byte	0
	.uleb128 0x20
	.quad	.LVL75
	.long	0xd45
	.long	0x88a
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC22
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x58
	.byte	0
	.uleb128 0x20
	.quad	.LVL76
	.long	0xd45
	.long	0x8b4
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC23
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x8
	.byte	0x55
	.byte	0
	.uleb128 0x1e
	.quad	.LVL77
	.long	0xcb1
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x92
	.uleb128 0x22
	.long	.LASF76
	.byte	0x1
	.byte	0xcc
	.long	0x65
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0xc0b
	.uleb128 0x15
	.long	.LASF74
	.byte	0x1
	.byte	0xcc
	.long	0x65
	.long	.LLST30
	.uleb128 0x15
	.long	.LASF75
	.byte	0x1
	.byte	0xcc
	.long	0x8c8
	.long	.LLST31
	.uleb128 0x19
	.long	.Ldebug_ranges0+0x140
	.uleb128 0x1c
	.long	.LASF68
	.byte	0x1
	.byte	0xce
	.long	0x65
	.uleb128 0x1a
	.long	.LASF69
	.byte	0x1
	.byte	0xce
	.long	0x65
	.long	.LLST32
	.uleb128 0x1c
	.long	.LASF77
	.byte	0x1
	.byte	0xce
	.long	0x65
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.byte	0xce
	.long	0x65
	.uleb128 0x1a
	.long	.LASF51
	.byte	0x1
	.byte	0xcf
	.long	0x3bf
	.long	.LLST33
	.uleb128 0x1a
	.long	.LASF52
	.byte	0x1
	.byte	0xcf
	.long	0x3bf
	.long	.LLST34
	.uleb128 0x1a
	.long	.LASF50
	.byte	0x1
	.byte	0xcf
	.long	0x3bf
	.long	.LLST35
	.uleb128 0x1a
	.long	.LASF78
	.byte	0x1
	.byte	0xd0
	.long	0x92
	.long	.LLST36
	.uleb128 0x1a
	.long	.LASF79
	.byte	0x1
	.byte	0xd0
	.long	0x92
	.long	.LLST37
	.uleb128 0x23
	.long	0x2c9
	.quad	.LBB28
	.long	.Ldebug_ranges0+0x170
	.byte	0x1
	.byte	0xd7
	.long	0x9c4
	.uleb128 0x24
	.long	0x2da
	.long	.LLST38
	.uleb128 0x1e
	.quad	.LVL82
	.long	0xd6b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x2c9
	.quad	.LBB32
	.long	.Ldebug_ranges0+0x1a0
	.byte	0x1
	.byte	0xd5
	.long	0x9fd
	.uleb128 0x24
	.long	0x2da
	.long	.LLST39
	.uleb128 0x1e
	.quad	.LVL84
	.long	0xd6b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x23
	.long	0x2c9
	.quad	.LBB36
	.long	.Ldebug_ranges0+0x1d0
	.byte	0x1
	.byte	0xd6
	.long	0xa36
	.uleb128 0x24
	.long	0x2da
	.long	.LLST40
	.uleb128 0x1e
	.quad	.LVL86
	.long	0xd6b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x25
	.long	0x2c9
	.quad	.LBB40
	.quad	.LBE40-.LBB40
	.byte	0x1
	.byte	0xd8
	.long	0xa73
	.uleb128 0x24
	.long	0x2da
	.long	.LLST41
	.uleb128 0x1e
	.quad	.LVL88
	.long	0xd6b
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x3a
	.byte	0
	.byte	0
	.uleb128 0x20
	.quad	.LVL90
	.long	0xd8a
	.long	0xa90
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x20
	.quad	.LVL92
	.long	0xd8a
	.long	0xaad
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x20
	.quad	.LVL94
	.long	0xd8a
	.long	0xaca
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x38
	.byte	0
	.uleb128 0x20
	.quad	.LVL98
	.long	0x59a
	.long	0xaee
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL99
	.long	0x59a
	.long	0xb18
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7e
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL100
	.long	0xda5
	.long	0xb37
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC26
	.byte	0
	.uleb128 0x20
	.quad	.LVL101
	.long	0x3c5
	.long	0xb71
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x4
	.byte	0x91
	.sleb128 -72
	.byte	0x6
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x77
	.sleb128 0
	.byte	0x94
	.byte	0x4
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x58
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x59
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL102
	.long	0xda5
	.long	0xb90
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC27
	.byte	0
	.uleb128 0x20
	.quad	.LVL103
	.long	0xdbc
	.long	0xba8
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL104
	.long	0xdbc
	.long	0xbc0
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL111
	.long	0x75a
	.long	0xbdd
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x37
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x7f
	.sleb128 0
	.byte	0
	.uleb128 0x20
	.quad	.LVL112
	.long	0x532
	.long	0xbfc
	.uleb128 0x1f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC25
	.byte	0
	.uleb128 0x26
	.quad	.LVL113
	.long	0x75a
	.byte	0
	.byte	0
	.uleb128 0x27
	.long	.LASF80
	.byte	0x5
	.byte	0xa5
	.long	0x26f
	.uleb128 0x27
	.long	.LASF81
	.byte	0x5
	.byte	0xa6
	.long	0x26f
	.uleb128 0x27
	.long	.LASF82
	.byte	0x5
	.byte	0xa7
	.long	0x26f
	.uleb128 0x28
	.long	.LASF83
	.byte	0x1
	.byte	0x14
	.long	0x29
	.uleb128 0x9
	.byte	0x3
	.quad	t_chip
	.uleb128 0x28
	.long	.LASF84
	.byte	0x1
	.byte	0x15
	.long	0x29
	.uleb128 0x9
	.byte	0x3
	.quad	chip_height
	.uleb128 0x28
	.long	.LASF85
	.byte	0x1
	.byte	0x16
	.long	0x29
	.uleb128 0x9
	.byte	0x3
	.quad	chip_width
	.uleb128 0x28
	.long	.LASF86
	.byte	0x1
	.byte	0x18
	.long	0x29
	.uleb128 0x9
	.byte	0x3
	.quad	amb_temp
	.uleb128 0x28
	.long	.LASF87
	.byte	0x1
	.byte	0x1a
	.long	0x65
	.uleb128 0x9
	.byte	0x3
	.quad	num_omp_threads
	.uleb128 0x29
	.long	.LASF89
	.byte	0x5
	.value	0x161
	.long	0x65
	.long	0xcb1
	.uleb128 0x2a
	.long	0x744
	.uleb128 0x2a
	.long	0x29b
	.uleb128 0x2b
	.byte	0
	.uleb128 0x2c
	.long	.LASF106
	.byte	0x2
	.value	0x220
	.long	0xcc3
	.uleb128 0x2a
	.long	0x65
	.byte	0
	.uleb128 0x29
	.long	.LASF90
	.byte	0x5
	.value	0x10d
	.long	0x744
	.long	0xcde
	.uleb128 0x2a
	.long	0x29b
	.uleb128 0x2a
	.long	0x29b
	.byte	0
	.uleb128 0x29
	.long	.LASF91
	.byte	0x5
	.value	0x270
	.long	0x92
	.long	0xcfe
	.uleb128 0x2a
	.long	0x92
	.uleb128 0x2a
	.long	0x65
	.uleb128 0x2a
	.long	0x744
	.byte	0
	.uleb128 0x29
	.long	.LASF92
	.byte	0x5
	.value	0x335
	.long	0x65
	.long	0xd14
	.uleb128 0x2a
	.long	0x744
	.byte	0
	.uleb128 0x29
	.long	.LASF93
	.byte	0x5
	.value	0x1b3
	.long	0x65
	.long	0xd30
	.uleb128 0x2a
	.long	0x29b
	.uleb128 0x2a
	.long	0x29b
	.uleb128 0x2b
	.byte	0
	.uleb128 0x2d
	.long	.LASF94
	.byte	0x5
	.byte	0xea
	.long	0x65
	.long	0xd45
	.uleb128 0x2a
	.long	0x744
	.byte	0
	.uleb128 0x2e
	.long	.LASF95
	.long	.LASF99
	.long	0x3b
	.long	0xd6b
	.uleb128 0x2a
	.long	0x2b4
	.uleb128 0x2a
	.long	0x30
	.uleb128 0x2a
	.long	0x30
	.uleb128 0x2a
	.long	0x744
	.byte	0
	.uleb128 0x2d
	.long	.LASF96
	.byte	0x2
	.byte	0xb8
	.long	0x6c
	.long	0xd8a
	.uleb128 0x2a
	.long	0x29b
	.uleb128 0x2a
	.long	0x8c8
	.uleb128 0x2a
	.long	0x65
	.byte	0
	.uleb128 0x29
	.long	.LASF97
	.byte	0x2
	.value	0x1d9
	.long	0x90
	.long	0xda5
	.uleb128 0x2a
	.long	0x30
	.uleb128 0x2a
	.long	0x30
	.byte	0
	.uleb128 0x2e
	.long	.LASF98
	.long	.LASF100
	.long	0x65
	.long	0xdbc
	.uleb128 0x2a
	.long	0x29b
	.byte	0
	.uleb128 0x2f
	.long	.LASF107
	.byte	0x2
	.value	0x1e8
	.uleb128 0x2a
	.long	0x90
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x39
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x3a
	.byte	0
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL0
	.quad	.LVL3
	.value	0x1
	.byte	0x55
	.quad	.LVL3
	.quad	.LVL18
	.value	0x1
	.byte	0x5f
	.quad	.LVL18
	.quad	.LVL19
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL19
	.quad	.LFE19
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x51
	.quad	.LVL1
	.quad	.LVL18
	.value	0x1
	.byte	0x5e
	.quad	.LVL18
	.quad	.LVL19
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL19
	.quad	.LFE19
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x52
	.quad	.LVL2
	.quad	.LVL4
	.value	0x1
	.byte	0x53
	.quad	.LVL4
	.quad	.LFE19
	.value	0x3
	.byte	0x91
	.sleb128 -132
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL0
	.quad	.LVL13
	.value	0x1
	.byte	0x61
	.quad	.LVL13
	.quad	.LVL19
	.value	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x11
	.uleb128 0x29
	.byte	0x9f
	.quad	.LVL19
	.quad	.LFE19
	.value	0x1
	.byte	0x61
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL7
	.quad	.LVL9
	.value	0x1
	.byte	0x67
	.quad	.LVL10
	.quad	.LVL11
	.value	0x1
	.byte	0x67
	.quad	.LVL20
	.quad	.LVL21
	.value	0x1
	.byte	0x67
	.quad	.LVL22
	.quad	.LVL23
	.value	0x1
	.byte	0x67
	.quad	0
	.quad	0
.LLST5:
	.quad	.LVL0
	.quad	.LVL4
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL12
	.value	0x1
	.byte	0x56
	.quad	.LVL12
	.quad	.LVL13
	.value	0x3
	.byte	0x91
	.sleb128 -148
	.quad	.LVL13
	.quad	.LVL18
	.value	0x1
	.byte	0x59
	.quad	.LVL19
	.quad	.LFE19
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST6:
	.quad	.LVL5
	.quad	.LVL6
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL6
	.quad	.LVL11
	.value	0x1
	.byte	0x50
	.quad	.LVL11
	.quad	.LVL12
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL13
	.quad	.LVL14
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL14
	.quad	.LVL15
	.value	0x1
	.byte	0x50
	.quad	.LVL15
	.quad	.LVL16
	.value	0x3
	.byte	0x70
	.sleb128 1
	.byte	0x9f
	.quad	.LVL19
	.quad	.LFE19
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LLST7:
	.quad	.LVL24
	.quad	.LVL36
	.value	0x1
	.byte	0x55
	.quad	.LVL36
	.quad	.LVL45
	.value	0x1
	.byte	0x5f
	.quad	.LVL45
	.quad	.LFE20
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST8:
	.quad	.LVL24
	.quad	.LVL36
	.value	0x1
	.byte	0x54
	.quad	.LVL36
	.quad	.LVL41
	.value	0x1
	.byte	0x53
	.quad	.LVL41
	.quad	.LFE20
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST9:
	.quad	.LVL24
	.quad	.LVL36
	.value	0x1
	.byte	0x51
	.quad	.LVL36
	.quad	.LVL44
	.value	0x1
	.byte	0x5e
	.quad	.LVL44
	.quad	.LFE20
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	0
	.quad	0
.LLST10:
	.quad	.LVL24
	.quad	.LVL36
	.value	0x1
	.byte	0x52
	.quad	.LVL36
	.quad	.LFE20
	.value	0x2
	.byte	0x91
	.sleb128 -64
	.quad	0
	.quad	0
.LLST11:
	.quad	.LVL24
	.quad	.LVL36
	.value	0x1
	.byte	0x58
	.quad	.LVL36
	.quad	.LVL43
	.value	0x1
	.byte	0x5c
	.quad	.LVL43
	.quad	.LFE20
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x58
	.byte	0x9f
	.quad	0
	.quad	0
.LLST12:
	.quad	.LVL24
	.quad	.LVL36
	.value	0x1
	.byte	0x59
	.quad	.LVL36
	.quad	.LVL42
	.value	0x1
	.byte	0x56
	.quad	.LVL42
	.quad	.LFE20
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x59
	.byte	0x9f
	.quad	0
	.quad	0
.LLST13:
	.quad	.LVL25
	.quad	.LVL29
	.value	0x1
	.byte	0x63
	.quad	.LVL29
	.quad	.LVL30
	.value	0x1
	.byte	0x67
	.quad	0
	.quad	0
.LLST14:
	.quad	.LVL26
	.quad	.LVL31
	.value	0x1
	.byte	0x62
	.quad	.LVL31
	.quad	.LVL32
	.value	0x1
	.byte	0x66
	.quad	0
	.quad	0
.LLST15:
	.quad	.LVL27
	.quad	.LVL28
	.value	0x1
	.byte	0x64
	.quad	.LVL28
	.quad	.LVL40
	.value	0x2
	.byte	0x77
	.sleb128 0
	.quad	.LVL40
	.quad	.LFE20
	.value	0x3
	.byte	0x91
	.sleb128 -104
	.quad	0
	.quad	0
.LLST16:
	.quad	.LVL33
	.quad	.LVL36
	.value	0x1
	.byte	0x66
	.quad	.LVL36
	.quad	.LFE20
	.value	0x3
	.byte	0x91
	.sleb128 -96
	.quad	0
	.quad	0
.LLST17:
	.quad	.LVL33
	.quad	.LVL36
	.value	0x1
	.byte	0x67
	.quad	.LVL36
	.quad	.LFE20
	.value	0x3
	.byte	0x91
	.sleb128 -88
	.quad	0
	.quad	0
.LLST18:
	.quad	.LVL34
	.quad	.LVL36
	.value	0x1
	.byte	0x68
	.quad	.LVL36
	.quad	.LFE20
	.value	0x3
	.byte	0x91
	.sleb128 -80
	.quad	0
	.quad	0
.LLST19:
	.quad	.LVL35
	.quad	.LVL36
	.value	0x1
	.byte	0x62
	.quad	.LVL36
	.quad	.LFE20
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST20:
	.quad	.LVL35
	.quad	.LVL36
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL36
	.quad	.LVL37
	.value	0x1
	.byte	0x5d
	.quad	.LVL37
	.quad	.LVL38
	.value	0x3
	.byte	0x7d
	.sleb128 -1
	.byte	0x9f
	.quad	.LVL38
	.quad	.LVL39
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST21:
	.quad	.LVL46
	.quad	.LVL47
	.value	0x1
	.byte	0x55
	.quad	.LVL47
	.quad	.LVL48-1
	.value	0x1
	.byte	0x51
	.quad	.LVL48-1
	.quad	.LFE21
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST22:
	.quad	.LVL50
	.quad	.LVL52
	.value	0x1
	.byte	0x55
	.quad	.LVL52
	.quad	.LVL56
	.value	0x1
	.byte	0x53
	.quad	.LVL56
	.quad	.LVL65
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL65
	.quad	.LFE22
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LLST23:
	.quad	.LVL50
	.quad	.LVL51
	.value	0x1
	.byte	0x54
	.quad	.LVL51
	.quad	.LVL62
	.value	0x1
	.byte	0x5d
	.quad	.LVL62
	.quad	.LVL63
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL63
	.quad	.LFE22
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST24:
	.quad	.LVL50
	.quad	.LVL53-1
	.value	0x1
	.byte	0x51
	.quad	.LVL53-1
	.quad	.LVL56
	.value	0x1
	.byte	0x5c
	.quad	.LVL56
	.quad	.LVL65
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x51
	.byte	0x9f
	.quad	.LVL65
	.quad	.LFE22
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST25:
	.quad	.LVL50
	.quad	.LVL53-1
	.value	0x1
	.byte	0x52
	.quad	.LVL53-1
	.quad	.LFE22
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x52
	.byte	0x9f
	.quad	0
	.quad	0
.LLST26:
	.quad	.LVL55
	.quad	.LVL56
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	0
	.quad	0
.LLST27:
	.quad	.LVL54
	.quad	.LVL56
	.value	0x1
	.byte	0x50
	.quad	.LVL56
	.quad	.LVL61
	.value	0x1
	.byte	0x56
	.quad	.LVL63
	.quad	.LVL65
	.value	0x1
	.byte	0x56
	.quad	.LVL65
	.quad	.LVL66-1
	.value	0x1
	.byte	0x50
	.quad	.LVL66-1
	.quad	.LFE22
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST28:
	.quad	.LVL67
	.quad	.LVL68
	.value	0x1
	.byte	0x55
	.quad	.LVL68
	.quad	.LFE23
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST29:
	.quad	.LVL67
	.quad	.LVL69
	.value	0x1
	.byte	0x54
	.quad	.LVL69
	.quad	.LFE23
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST30:
	.quad	.LVL78
	.quad	.LVL80
	.value	0x1
	.byte	0x55
	.quad	.LVL80
	.quad	.LVL112
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	.LVL112
	.quad	.LVL113-1
	.value	0x1
	.byte	0x55
	.quad	.LVL113-1
	.quad	.LFE24
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST31:
	.quad	.LVL78
	.quad	.LVL81
	.value	0x1
	.byte	0x54
	.quad	.LVL81
	.quad	.LVL109
	.value	0x1
	.byte	0x5f
	.quad	.LVL109
	.quad	.LVL110
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	.LVL110
	.quad	.LVL112
	.value	0x1
	.byte	0x5f
	.quad	.LVL112
	.quad	.LVL113-1
	.value	0x1
	.byte	0x54
	.quad	.LVL113-1
	.quad	.LFE24
	.value	0x1
	.byte	0x5f
	.quad	0
	.quad	0
.LLST32:
	.quad	.LVL89
	.quad	.LVL105
	.value	0x1
	.byte	0x56
	.quad	.LVL111
	.quad	.LVL112
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST33:
	.quad	.LVL91
	.quad	.LVL92-1
	.value	0x1
	.byte	0x50
	.quad	.LVL92-1
	.quad	.LVL106
	.value	0x1
	.byte	0x5c
	.quad	.LVL111
	.quad	.LVL112
	.value	0x1
	.byte	0x5c
	.quad	0
	.quad	0
.LLST34:
	.quad	.LVL93
	.quad	.LVL94-1
	.value	0x1
	.byte	0x50
	.quad	.LVL94-1
	.quad	.LVL107
	.value	0x1
	.byte	0x5d
	.quad	.LVL111
	.quad	.LVL112
	.value	0x1
	.byte	0x5d
	.quad	0
	.quad	0
.LLST35:
	.quad	.LVL95
	.quad	.LVL98-1
	.value	0x1
	.byte	0x50
	.quad	.LVL98-1
	.quad	.LVL110
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	.LVL111
	.quad	.LVL112-1
	.value	0x1
	.byte	0x50
	.quad	.LVL112-1
	.quad	.LVL112
	.value	0x3
	.byte	0x91
	.sleb128 -72
	.quad	0
	.quad	0
.LLST36:
	.quad	.LVL96
	.quad	.LVL98-1
	.value	0x2
	.byte	0x7f
	.sleb128 40
	.quad	0
	.quad	0
.LLST37:
	.quad	.LVL97
	.quad	.LVL108
	.value	0x1
	.byte	0x5e
	.quad	0
	.quad	0
.LLST38:
	.quad	.LVL79
	.quad	.LVL81
	.value	0x2
	.byte	0x74
	.sleb128 8
	.quad	.LVL81
	.quad	.LVL82-1
	.value	0x1
	.byte	0x55
	.quad	0
	.quad	0
.LLST39:
	.quad	.LVL83
	.quad	.LVL84-1
	.value	0x2
	.byte	0x7f
	.sleb128 16
	.quad	0
	.quad	0
.LLST40:
	.quad	.LVL85
	.quad	.LVL86-1
	.value	0x2
	.byte	0x7f
	.sleb128 24
	.quad	0
	.quad	0
.LLST41:
	.quad	.LVL87
	.quad	.LVL88-1
	.value	0x2
	.byte	0x7f
	.sleb128 32
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB11
	.quad	.LBE11
	.quad	.LBB12
	.quad	.LBE12
	.quad	.LBB13
	.quad	.LBE13
	.quad	0
	.quad	0
	.quad	.LBB14
	.quad	.LBE14
	.quad	.LBB18
	.quad	.LBE18
	.quad	.LBB19
	.quad	.LBE19
	.quad	.LBB20
	.quad	.LBE20
	.quad	.LBB21
	.quad	.LBE21
	.quad	.LBB22
	.quad	.LBE22
	.quad	0
	.quad	0
	.quad	.LBB15
	.quad	.LBE15
	.quad	.LBB16
	.quad	.LBE16
	.quad	.LBB17
	.quad	.LBE17
	.quad	0
	.quad	0
	.quad	.LBB23
	.quad	.LBE23
	.quad	.LBB24
	.quad	.LBE24
	.quad	.LBB25
	.quad	.LBE25
	.quad	.LBB26
	.quad	.LBE26
	.quad	0
	.quad	0
	.quad	.LBB27
	.quad	.LBE27
	.quad	.LBB42
	.quad	.LBE42
	.quad	0
	.quad	0
	.quad	.LBB28
	.quad	.LBE28
	.quad	.LBB31
	.quad	.LBE31
	.quad	0
	.quad	0
	.quad	.LBB32
	.quad	.LBE32
	.quad	.LBB35
	.quad	.LBE35
	.quad	0
	.quad	0
	.quad	.LBB36
	.quad	.LBE36
	.quad	.LBB39
	.quad	.LBE39
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB24
	.quad	.LFE24
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF50:
	.string	"result"
.LASF98:
	.string	"__builtin_puts"
.LASF0:
	.string	"double"
.LASF72:
	.string	"usage"
.LASF79:
	.string	"pfile"
.LASF93:
	.string	"sscanf"
.LASF86:
	.string	"amb_temp"
.LASF64:
	.string	"_Z5fatalPc"
.LASF25:
	.string	"_IO_save_end"
.LASF101:
	.string	"GNU C++ 4.9.1 -fpreprocessed -mtune=generic -march=x86-64 -g -O2 -std=c++11 -fopenmp -fpermissive"
.LASF6:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF11:
	.string	"sizetype"
.LASF35:
	.string	"_offset"
.LASF61:
	.string	"grid_width"
.LASF83:
	.string	"t_chip"
.LASF76:
	.string	"main"
.LASF19:
	.string	"_IO_write_ptr"
.LASF14:
	.string	"_flags"
.LASF102:
	.string	"hotspot_openmp.cpp"
.LASF10:
	.string	"__off64_t"
.LASF85:
	.string	"chip_width"
.LASF70:
	.string	"file"
.LASF26:
	.string	"_markers"
.LASF16:
	.string	"_IO_read_end"
.LASF73:
	.string	"_Z5usageiPPc"
.LASF71:
	.string	"index"
.LASF91:
	.string	"fgets"
.LASF94:
	.string	"fclose"
.LASF107:
	.string	"free"
.LASF54:
	.string	"delta"
.LASF82:
	.string	"stderr"
.LASF44:
	.string	"_IO_marker"
.LASF48:
	.string	"long long int"
.LASF34:
	.string	"_lock"
.LASF7:
	.string	"long int"
.LASF84:
	.string	"chip_height"
.LASF60:
	.string	"grid_height"
.LASF31:
	.string	"_cur_column"
.LASF47:
	.string	"_pos"
.LASF89:
	.string	"fprintf"
.LASF59:
	.string	"num_iterations"
.LASF75:
	.string	"argv"
.LASF106:
	.string	"exit"
.LASF46:
	.string	"_sbuf"
.LASF30:
	.string	"_old_offset"
.LASF92:
	.string	"feof"
.LASF95:
	.string	"__builtin_fwrite"
.LASF88:
	.string	"atoi"
.LASF2:
	.string	"unsigned char"
.LASF74:
	.string	"argc"
.LASF68:
	.string	"grid_rows"
.LASF5:
	.string	"signed char"
.LASF103:
	.string	"/home/zealot/svn/columbus/branches/repara/deliverables/D7.3_benchmarks/rodinia_2.4/openmp/hotspot"
.LASF49:
	.string	"long long unsigned int"
.LASF55:
	.string	"single_iteration"
.LASF4:
	.string	"unsigned int"
.LASF33:
	.string	"_shortbuf"
.LASF51:
	.string	"temp"
.LASF36:
	.string	"__pad1"
.LASF100:
	.string	"puts"
.LASF18:
	.string	"_IO_write_base"
.LASF42:
	.string	"_unused2"
.LASF62:
	.string	"max_slope"
.LASF15:
	.string	"_IO_read_ptr"
.LASF22:
	.string	"_IO_buf_end"
.LASF12:
	.string	"char"
.LASF43:
	.string	"_IO_FILE"
.LASF77:
	.string	"sim_time"
.LASF65:
	.string	"read_input"
.LASF66:
	.string	"_Z10read_inputPdiiPc"
.LASF87:
	.string	"num_omp_threads"
.LASF45:
	.string	"_next"
.LASF97:
	.string	"calloc"
.LASF37:
	.string	"__pad2"
.LASF38:
	.string	"__pad3"
.LASF39:
	.string	"__pad4"
.LASF40:
	.string	"__pad5"
.LASF69:
	.string	"grid_cols"
.LASF52:
	.string	"power"
.LASF78:
	.string	"tfile"
.LASF99:
	.string	"fwrite"
.LASF1:
	.string	"long unsigned int"
.LASF96:
	.string	"strtol"
.LASF20:
	.string	"_IO_write_end"
.LASF57:
	.string	"_Z16single_iterationPdS_S_iiddddd"
.LASF28:
	.string	"_fileno"
.LASF3:
	.string	"short unsigned int"
.LASF27:
	.string	"_chain"
.LASF9:
	.string	"__off_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF80:
	.string	"stdin"
.LASF21:
	.string	"_IO_buf_base"
.LASF29:
	.string	"_flags2"
.LASF63:
	.string	"fatal"
.LASF41:
	.string	"_mode"
.LASF17:
	.string	"_IO_read_base"
.LASF32:
	.string	"_vtable_offset"
.LASF90:
	.string	"fopen"
.LASF23:
	.string	"_IO_save_base"
.LASF13:
	.string	"FILE"
.LASF58:
	.string	"_Z17compute_tran_tempPdiS_S_ii"
.LASF105:
	.string	"__nptr"
.LASF67:
	.string	"vect"
.LASF53:
	.string	"step"
.LASF81:
	.string	"stdout"
.LASF104:
	.string	"_IO_lock_t"
.LASF56:
	.string	"compute_tran_temp"
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
