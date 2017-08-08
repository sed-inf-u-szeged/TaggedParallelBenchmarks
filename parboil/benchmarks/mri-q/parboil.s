	.file	"parboil.c"
	.text
	.type	_ZL17free_string_arrayPPc, @function
_ZL17free_string_arrayPPc:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	jmp	.L1
.L2:
	movq	-24(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L4
.L5:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	addq	$8, -8(%rbp)
.L4:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L5
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_ZL17free_string_arrayPPc, .-_ZL17free_string_arrayPPc
	.type	_ZL17read_string_arrayPc, @function
_ZL17read_string_arrayPc:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -72(%rbp)
	movl	$1, -24(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L7
.L9:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	$44, %al
	jne	.L8
	addl	$1, -24(%rbp)
.L8:
	addl	$1, -20(%rbp)
.L7:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-72(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L9
	movl	-24(%rbp), %eax
	addl	$1, %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -48(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L10
.L14:
	movq	-32(%rbp), %rax
	movq	%rax, -40(%rbp)
	jmp	.L11
.L13:
	addq	$1, -40(%rbp)
.L11:
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$44, %al
	je	.L12
	movq	-40(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L13
.L12:
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movl	%eax, -52(%rbp)
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-52(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, (%rbx)
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rcx
	movq	-48(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movq	-32(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-52(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movb	$0, (%rax)
	movq	-40(%rbp), %rax
	addq	$1, %rax
	movq	%rax, -32(%rbp)
	addl	$1, -20(%rbp)
.L10:
	movl	-20(%rbp), %eax
	cmpl	-24(%rbp), %eax
	jl	.L14
	movl	-20(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	$0, (%rax)
	movq	-48(%rbp), %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_ZL17read_string_arrayPc, .-_ZL17read_string_arrayPc
	.type	_ZL19initialize_argparseP8argparseiPPc, @function
_ZL19initialize_argparseP8argparseiPPc:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movl	-12(%rbp), %edx
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movl	$0, 16(%rax)
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 32(%rax)
	movq	-8(%rbp), %rax
	movq	32(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_ZL19initialize_argparseP8argparseiPPc, .-_ZL19initialize_argparseP8argparseiPPc
	.type	_ZL17finalize_argparseP8argparse, @function
_ZL17finalize_argparseP8argparse:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	jmp	.L18
.L19:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	leaq	8(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, 32(%rdx)
	movq	-8(%rbp), %rdx
	movq	24(%rdx), %rdx
	leaq	8(%rdx), %rsi
	movq	-8(%rbp), %rcx
	movq	%rsi, 24(%rcx)
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 16(%rax)
.L18:
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L19
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_ZL17finalize_argparseP8argparse, .-_ZL17finalize_argparseP8argparse
	.section	.rodata
.LC0:
	.string	"delete_argument\n"
	.text
	.type	_ZL15delete_argumentP8argparse, @function
_ZL15delete_argumentP8argparse:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L21
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
.L21:
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	leal	-1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	leaq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, 24(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_ZL15delete_argumentP8argparse, .-_ZL15delete_argumentP8argparse
	.section	.rodata
.LC1:
	.string	"next_argument\n"
	.text
	.type	_ZL13next_argumentP8argparse, @function
_ZL13next_argumentP8argparse:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jl	.L23
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$14, %edx
	movl	$1, %esi
	movl	$.LC1, %edi
	call	fwrite
.L23:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	leaq	8(%rax), %rcx
	movq	-8(%rbp), %rdx
	movq	%rcx, 32(%rdx)
	movq	-8(%rbp), %rdx
	movq	24(%rdx), %rdx
	leaq	8(%rdx), %rsi
	movq	-8(%rbp), %rcx
	movq	%rsi, 24(%rcx)
	movq	(%rdx), %rdx
	movq	%rdx, (%rax)
	movq	-8(%rbp), %rax
	movl	16(%rax), %eax
	leal	1(%rax), %edx
	movq	-8(%rbp), %rax
	movl	%edx, 16(%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_ZL13next_argumentP8argparse, .-_ZL13next_argumentP8argparse
	.type	_ZL19is_end_of_argumentsP8argparse, @function
_ZL19is_end_of_argumentsP8argparse:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	16(%rax), %edx
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	sete	%al
	movzbl	%al, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL19is_end_of_argumentsP8argparse, .-_ZL19is_end_of_argumentsP8argparse
	.type	_ZL12get_argumentP8argparse, @function
_ZL12get_argumentP8argparse:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	24(%rax), %rax
	movq	(%rax), %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_ZL12get_argumentP8argparse, .-_ZL12get_argumentP8argparse
	.type	_ZL16consume_argumentP8argparse, @function
_ZL16consume_argumentP8argparse:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL12get_argumentP8argparse
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL15delete_argumentP8argparse
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL16consume_argumentP8argparse, .-_ZL16consume_argumentP8argparse
	.section	.rodata
	.align 8
.LC2:
	.string	"Expecting file name after '-o'\n"
	.align 8
.LC3:
	.string	"Expecting file name after '-i'\n"
	.align 8
.LC4:
	.string	"Unexpected command-line parameter\n"
	.text
	.globl	pb_ReadParameters
	.type	pb_ReadParameters, @function
pb_ReadParameters:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movl	$16, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	$0, (%rax)
	movl	$8, %edi
	call	malloc
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	$0, (%rax)
	movq	-72(%rbp), %rax
	movl	(%rax), %ecx
	movq	-80(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	_ZL19initialize_argparseP8argparseiPPc
	jmp	.L31
.L42:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL12get_argumentP8argparse
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$45, %al
	jne	.L32
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L32
	movq	-24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L32
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL15delete_argumentP8argparse
	movq	-24(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	cmpl	$105, %eax
	je	.L34
	cmpl	$111, %eax
	je	.L35
	cmpl	$45, %eax
	je	.L46
	jmp	.L45
.L35:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL19is_end_of_argumentsP8argparse
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L37
	movq	$.LC2, -8(%rbp)
	jmp	.L38
.L37:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL16consume_argumentP8argparse
	movq	%rax, %rdi
	call	strdup
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	jmp	.L39
.L34:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL19is_end_of_argumentsP8argparse
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L40
	movq	$.LC3, -8(%rbp)
	jmp	.L38
.L40:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL16consume_argumentP8argparse
	movq	%rax, %rdi
	call	_ZL17read_string_arrayPc
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L39
.L45:
	movq	$.LC4, -8(%rbp)
	jmp	.L38
.L39:
	jmp	.L31
.L32:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL13next_argumentP8argparse
.L31:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL19is_end_of_argumentsP8argparse
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	jne	.L42
	jmp	.L41
.L46:
	nop
.L41:
	movl	-64(%rbp), %edx
	movq	-72(%rbp), %rax
	movl	%edx, (%rax)
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	_ZL17finalize_argparseP8argparse
	movq	-16(%rbp), %rax
	jmp	.L44
.L38:
	movq	stderr(%rip), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	pb_FreeParameters
	movl	$0, %eax
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	pb_ReadParameters, .-pb_ReadParameters
	.globl	pb_FreeParameters
	.type	pb_FreeParameters, @function
pb_FreeParameters:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	_ZL17free_string_arrayPPc
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	pb_FreeParameters, .-pb_FreeParameters
	.globl	pb_Parameters_CountInputs
	.type	pb_Parameters_CountInputs, @function
pb_Parameters_CountInputs:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L49
.L50:
	addl	$1, -4(%rbp)
.L49:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	salq	$3, %rdx
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L50
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	pb_Parameters_CountInputs, .-pb_Parameters_CountInputs
	.type	_ZL15accumulate_timePyyy, @function
_ZL15accumulate_timePyyy:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	subq	-16(%rbp), %rax
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL15accumulate_timePyyy, .-_ZL15accumulate_timePyyy
	.type	_ZL8get_timev, @function
_ZL8get_timev:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	leaq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-16(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	_ZL8get_timev, .-_ZL8get_timev
	.globl	pb_ResetTimer
	.type	pb_ResetTimer, @function
pb_ResetTimer:
.LFB14:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	$0, (%rax)
	movq	-8(%rbp), %rax
	movq	$0, 8(%rax)
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
	.size	pb_ResetTimer, .-pb_ResetTimer
	.section	.rodata
	.align 8
.LC5:
	.string	"Ignoring attempt to start a running timer\n"
	.text
	.globl	pb_StartTimer
	.type	pb_StartTimer, @function
pb_StartTimer:
.LFB15:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L57
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	jmp	.L56
.L57:
	movq	-24(%rbp), %rax
	movl	$1, (%rax)
	leaq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-16(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 16(%rax)
.L56:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
	.size	pb_StartTimer, .-pb_StartTimer
	.section	.rodata
	.align 8
.LC6:
	.string	"Warning: Timer was not stopped\n"
	.align 8
.LC7:
	.string	"Warning: Subtimer was not stopped\n"
	.align 8
.LC8:
	.string	"Ignoring attempt to start running timer and subtimer\n"
	.text
	.globl	_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_
	.type	_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_, @function
_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_:
.LFB16:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$3, -4(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L60
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC6, %edi
	call	fwrite
	andl	$1, -4(%rbp)
.L60:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L61
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC7, %edi
	call	fwrite
	andl	$2, -4(%rbp)
.L61:
	cmpl	$0, -4(%rbp)
	jne	.L62
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$53, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	jmp	.L59
.L62:
	movq	-40(%rbp), %rax
	movl	$1, (%rax)
	movq	-48(%rbp), %rax
	movl	$1, (%rax)
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movl	-4(%rbp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L64
	movq	-32(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, 16(%rax)
.L64:
	movl	-4(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L59
	movq	-32(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, 16(%rax)
.L59:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE16:
	.size	_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_, .-_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_
	.section	.rodata
	.align 8
.LC9:
	.string	"Ignoring attempt to stop a stopped timer\n"
	.text
	.globl	pb_StopTimer
	.type	pb_StopTimer, @function
pb_StopTimer:
.LFB17:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L67
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$41, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	call	fwrite
	jmp	.L66
.L67:
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-32(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	-40(%rbp), %rdx
	leaq	8(%rdx), %rcx
	movq	-8(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZL15accumulate_timePyyy
	movq	-40(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L66:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE17:
	.size	pb_StopTimer, .-pb_StopTimer
	.section	.rodata
	.align 8
.LC10:
	.string	"Warning: Timer was not running\n"
	.align 8
.LC11:
	.string	"Warning: Subtimer was not running\n"
	.align 8
.LC12:
	.string	"Ignoring attempt to stop stopped timer and subtimer\n"
	.text
	.globl	_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_
	.type	_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_, @function
_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_:
.LFB18:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$3, -4(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L70
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$31, %edx
	movl	$1, %esi
	movl	$.LC10, %edi
	call	fwrite
	andl	$1, -4(%rbp)
.L70:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	je	.L71
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC11, %edi
	call	fwrite
	andl	$2, -4(%rbp)
.L71:
	cmpl	$0, -4(%rbp)
	jne	.L72
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$52, %edx
	movl	$1, %esi
	movl	$.LC12, %edi
	call	fwrite
	jmp	.L69
.L72:
	movq	-40(%rbp), %rax
	movl	$0, (%rax)
	movq	-48(%rbp), %rax
	movl	$0, (%rax)
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday
	movq	-32(%rbp), %rax
	imulq	$1000000, %rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movl	-4(%rbp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L74
	movq	-40(%rbp), %rax
	movq	16(%rax), %rax
	movq	-40(%rbp), %rdx
	leaq	8(%rdx), %rcx
	movq	-16(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZL15accumulate_timePyyy
	movq	-40(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L74:
	movl	-4(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L69
	movq	-48(%rbp), %rax
	movq	16(%rax), %rax
	movq	-48(%rbp), %rdx
	leaq	8(%rdx), %rcx
	movq	-16(%rbp), %rdx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	_ZL15accumulate_timePyyy
	movq	-48(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 16(%rax)
.L69:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE18:
	.size	_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_, .-_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_
	.section	.rodata
	.align 8
.LC13:
	.string	"Elapsed time from a running timer is inaccurate\n"
	.text
	.globl	pb_GetElapsedTime
	.type	pb_GetElapsedTime, @function
pb_GetElapsedTime:
.LFB19:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L76
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$48, %edx
	movl	$1, %esi
	movl	$.LC13, %edi
	call	fwrite
.L76:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	js	.L77
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L78
.L77:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L78:
	movsd	.LC14(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE19:
	.size	pb_GetElapsedTime, .-pb_GetElapsedTime
	.globl	pb_InitializeTimerSet
	.type	pb_InitializeTimerSet, @function
pb_InitializeTimerSet:
.LFB20:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	call	_ZL8get_timev
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, 24(%rax)
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
	movq	-24(%rbp), %rax
	movq	$0, 8(%rax)
	movl	$0, -4(%rbp)
	jmp	.L81
.L82:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	pb_ResetTimer
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	$0, (%rax,%rdx,8)
	addl	$1, -4(%rbp)
.L81:
	cmpl	$7, -4(%rbp)
	jle	.L82
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE20:
	.size	pb_InitializeTimerSet, .-pb_InitializeTimerSet
	.globl	pb_AddSubTimer
	.type	pb_AddSubTimer, @function
pb_AddSubTimer:
.LFB21:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movl	$40, %edi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	pb_ResetTimer
	movq	-16(%rbp), %rax
	movq	$0, 32(%rax)
	movl	-52(%rbp), %edx
	movq	-40(%rbp), %rax
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -32(%rbp)
	cmpq	$0, -32(%rbp)
	jne	.L84
	movl	$16, %edi
	call	malloc
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 8(%rax)
	movl	-52(%rbp), %edx
	movq	-40(%rbp), %rax
	movslq	%edx, %rdx
	leaq	28(%rdx), %rcx
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax,%rcx,8)
	jmp	.L83
.L84:
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L86
.L87:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L86:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	testq	%rax, %rax
	jne	.L87
	movq	-8(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, 32(%rax)
.L83:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE21:
	.size	pb_AddSubTimer, .-pb_AddSubTimer
	.globl	pb_SwitchToSubTimer
	.type	pb_SwitchToSubTimer, @function
pb_SwitchToSubTimer:
.LFB22:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	movq	$0, -8(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-52(%rbp), %eax
	je	.L89
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L89
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -8(%rbp)
.L89:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	-40(%rbp), %rax
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L90
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	jmp	.L91
.L90:
	movl	$0, %eax
.L91:
	movq	%rax, -32(%rbp)
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L92
	cmpq	$0, -32(%rbp)
	je	.L93
	cmpq	$0, -8(%rbp)
	je	.L93
	movq	-32(%rbp), %rax
	leaq	8(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_
	jmp	.L92
.L93:
	cmpq	$0, -32(%rbp)
	je	.L95
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	pb_StopTimer
	jmp	.L92
.L95:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	pb_StopTimer
.L92:
	movl	-52(%rbp), %edx
	movq	-40(%rbp), %rax
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -16(%rbp)
	cmpq	$0, -48(%rbp)
	je	.L96
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -16(%rbp)
	jmp	.L97
.L100:
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	-48(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L98
	nop
	jmp	.L96
.L98:
	movq	-16(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -16(%rbp)
.L97:
	cmpq	$0, -16(%rbp)
	jne	.L100
.L96:
	cmpl	$0, -52(%rbp)
	je	.L101
	cmpq	$0, -24(%rbp)
	je	.L102
	movq	-24(%rbp), %rax
	movq	-16(%rbp), %rdx
	movq	%rdx, (%rax)
.L102:
	movq	-40(%rbp), %rax
	movl	(%rax), %eax
	cmpl	-52(%rbp), %eax
	je	.L103
	cmpq	$0, -16(%rbp)
	je	.L103
	movq	-16(%rbp), %rax
	leaq	8(%rax), %rcx
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z24pb_StartTimerAndSubTimerP8pb_TimerS0_
	jmp	.L101
.L103:
	cmpq	$0, -16(%rbp)
	je	.L105
	movq	-16(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	pb_StartTimer
	jmp	.L101
.L105:
	movl	-52(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	pb_StartTimer
.L101:
	movq	-40(%rbp), %rax
	movl	-52(%rbp), %edx
	movl	%edx, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE22:
	.size	pb_SwitchToSubTimer, .-pb_SwitchToSubTimer
	.globl	pb_SwitchToTimer
	.type	pb_SwitchToTimer, @function
pb_SwitchToTimer:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L107
	movq	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L108
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
.L108:
	cmpq	$0, -8(%rbp)
	je	.L109
	movq	-8(%rbp), %rax
	leaq	8(%rax), %rcx
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	_Z23pb_StopTimerAndSubTimerP8pb_TimerS0_
	jmp	.L107
.L109:
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	pb_StopTimer
.L107:
	movq	-24(%rbp), %rax
	movl	-28(%rbp), %edx
	movl	%edx, (%rax)
	cmpl	$0, -28(%rbp)
	je	.L106
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	leaq	32(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	pb_StartTimer
.L106:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
	.size	pb_SwitchToTimer, .-pb_SwitchToTimer
	.section	.rodata
.LC15:
	.string	"IO"
.LC16:
	.string	"Kernel"
.LC17:
	.string	"Copy"
.LC18:
	.string	"Driver"
.LC19:
	.string	"Copy Async"
.LC20:
	.string	"Compute"
.LC22:
	.string	"%-*s: %f\n"
.LC23:
	.string	" -%-*s: %f\n"
.LC24:
	.string	"CPU/Kernel Overlap: %f\n"
.LC25:
	.string	"Timer Wall Time: %f\n"
	.text
	.globl	pb_PrintTimerSet
	.type	pb_PrintTimerSet, @function
pb_PrintTimerSet:
.LFB24:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -104(%rbp)
	call	_ZL8get_timev
	movq	%rax, -24(%rbp)
	movq	-104(%rbp), %rax
	addq	$32, %rax
	movq	%rax, -32(%rbp)
	movq	$0, -8(%rbp)
	movq	$.LC15, -96(%rbp)
	movq	$.LC16, -88(%rbp)
	movq	$.LC17, -80(%rbp)
	movq	$.LC18, -72(%rbp)
	movq	$.LC19, -64(%rbp)
	movq	$.LC20, -56(%rbp)
	movl	$10, -36(%rbp)
	movl	$1, -16(%rbp)
	jmp	.L113
.L121:
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	pb_GetElapsedTime
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm0, %xmm1
	setne	%al
	testb	%al, %al
	je	.L114
	movl	-16(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdi
	call	pb_GetElapsedTime
	movl	-16(%rbp), %eax
	subl	$1, %eax
	cltq
	movq	-96(%rbp,%rax,8), %rax
	movq	%rax, %rdx
	movl	$10, %esi
	movl	$.LC22, %edi
	movl	$1, %eax
	call	printf
	movq	-104(%rbp), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	je	.L114
	movq	-104(%rbp), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L115
.L117:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	movq	%rax, %rdx
	movl	-12(%rbp), %eax
	cltq
	cmpq	%rax, %rdx
	jbe	.L116
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen
	movl	%eax, -12(%rbp)
.L116:
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L115:
	cmpq	$0, -8(%rbp)
	jne	.L117
	cmpl	$10, -12(%rbp)
	jg	.L118
	movl	$10, -12(%rbp)
.L118:
	movq	-104(%rbp), %rax
	movl	-16(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	jmp	.L119
.L120:
	movq	-8(%rbp), %rax
	addq	$8, %rax
	movq	%rax, %rdi
	call	pb_GetElapsedTime
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movl	-12(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC23, %edi
	movl	$1, %eax
	call	printf
	movq	-8(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
.L119:
	cmpq	$0, -8(%rbp)
	jne	.L120
.L114:
	addl	$1, -16(%rbp)
.L113:
	cmpl	$6, -16(%rbp)
	jle	.L121
	movq	-32(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pb_GetElapsedTime
	movapd	%xmm0, %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm0, %xmm1
	setne	%al
	testb	%al, %al
	je	.L122
	movq	-32(%rbp), %rax
	addq	$168, %rax
	movq	%rax, %rdi
	call	pb_GetElapsedTime
	movl	$.LC24, %edi
	movl	$1, %eax
	call	printf
.L122:
	movq	-104(%rbp), %rax
	movq	24(%rax), %rax
	movq	-24(%rbp), %rdx
	subq	%rax, %rdx
	movq	%rdx, %rax
	testq	%rax, %rax
	js	.L123
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L124
.L123:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L124:
	movsd	.LC14(%rip), %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm2
	movss	%xmm2, -40(%rbp)
	cvtss2sd	-40(%rbp), %xmm0
	movl	$.LC25, %edi
	movl	$1, %eax
	call	printf
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	pb_PrintTimerSet, .-pb_PrintTimerSet
	.globl	pb_DestroyTimerSet
	.type	pb_DestroyTimerSet, @function
pb_DestroyTimerSet:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movq	-56(%rbp), %rax
	addq	$8, %rax
	movq	%rax, -8(%rbp)
	jmp	.L126
.L127:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	addq	$24, %rax
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	movq	-8(%rbp), %rax
	movq	$0, (%rax)
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
.L126:
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L127
	movl	$0, -12(%rbp)
	movl	$0, -12(%rbp)
	jmp	.L128
.L132:
	movq	-56(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	testq	%rax, %rax
	je	.L129
	movq	-56(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	$0, -40(%rbp)
	jmp	.L130
.L131:
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free
	movq	-24(%rbp), %rax
	movq	%rax, -40(%rbp)
	movq	-24(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free
.L130:
	cmpq	$0, -24(%rbp)
	jne	.L131
	movq	-56(%rbp), %rax
	movl	-12(%rbp), %edx
	movslq	%edx, %rdx
	addq	$28, %rdx
	movq	(%rax,%rdx,8), %rax
	movq	%rax, %rdi
	call	free
.L129:
	addl	$1, -12(%rbp)
.L128:
	cmpl	$7, -12(%rbp)
	jle	.L132
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE25:
	.size	pb_DestroyTimerSet, .-pb_DestroyTimerSet
	.section	.rodata
	.align 8
.LC14:
	.long	0
	.long	1093567616
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
