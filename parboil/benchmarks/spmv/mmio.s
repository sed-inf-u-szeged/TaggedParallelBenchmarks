	.file	"mmio.c"
	.section	.rodata
.LC0:
	.string	"r"
	.align 8
.LC1:
	.string	"mm_read_unsymetric: Could not process Matrix Market banner "
.LC2:
	.string	" in file [%s]\n"
	.align 8
.LC3:
	.string	"Sorry, this application does not support "
.LC4:
	.string	"Market Market type: [%s]\n"
	.align 8
.LC5:
	.string	"read_unsymmetric_sparse(): could not parse matrix size.\n"
.LC6:
	.string	"%d %d %lg\n"
	.text
	.globl	_Z26mm_read_unsymmetric_sparsePKcPiS1_S1_PPdPS1_S4_
	.type	_Z26mm_read_unsymmetric_sparsePKcPiS1_S1_PPdPS1_S4_, @function
_Z26mm_read_unsymmetric_sparsePKcPiS1_S1_PPdPS1_S4_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$112, %rsp
	movq	%rdi, -72(%rbp)
	movq	%rsi, -80(%rbp)
	movq	%rdx, -88(%rbp)
	movq	%rcx, -96(%rbp)
	movq	%r8, -104(%rbp)
	movq	%r9, -112(%rbp)
	movq	-72(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	sete	%al
	testb	%al, %al
	je	.L2
	movl	$-1, %eax
	jmp	.L10
.L2:
	leaq	-48(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z14mm_read_bannerP8_IO_FILEPA4_c
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L4
	movl	$.LC1, %edi
	movl	$0, %eax
	call	printf
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	movl	$-1, %eax
	jmp	.L10
.L4:
	movzbl	-46(%rbp), %eax
	cmpb	$82, %al
	jne	.L5
	movzbl	-48(%rbp), %eax
	cmpb	$77, %al
	jne	.L5
	movzbl	-47(%rbp), %eax
	cmpb	$67, %al
	je	.L6
.L5:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$41, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	_Z18mm_typecode_to_strPc
	movq	%rax, %rdx
	movq	stderr(%rip), %rax
	movl	$.LC4, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$-1, %eax
	jmp	.L10
.L6:
	leaq	-60(%rbp), %rcx
	leaq	-56(%rbp), %rdx
	leaq	-52(%rbp), %rsi
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$56, %edx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	movl	$-1, %eax
	jmp	.L10
.L7:
	movl	-52(%rbp), %edx
	movq	-80(%rbp), %rax
	movl	%edx, (%rax)
	movl	-56(%rbp), %edx
	movq	-88(%rbp), %rax
	movl	%edx, (%rax)
	movl	-60(%rbp), %edx
	movq	-96(%rbp), %rax
	movl	%edx, (%rax)
	movl	-60(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movl	-60(%rbp), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -32(%rbp)
	movl	-60(%rbp), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -40(%rbp)
	movq	-104(%rbp), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	-112(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, (%rax)
	movl	$0, -4(%rbp)
	jmp	.L8
.L9:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	subl	$1, %edx
	movl	%edx, (%rax)
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	subl	$1, %edx
	movl	%edx, (%rax)
	addl	$1, -4(%rbp)
.L8:
	movl	-60(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L9
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z26mm_read_unsymmetric_sparsePKcPiS1_S1_PPdPS1_S4_, .-_Z26mm_read_unsymmetric_sparsePKcPiS1_S1_PPdPS1_S4_
	.globl	_Z11mm_is_validPc
	.type	_Z11mm_is_validPc, @function
_Z11mm_is_validPc:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$77, %al
	je	.L12
	movl	$0, %eax
	jmp	.L13
.L12:
	movq	-8(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$65, %al
	jne	.L14
	movq	-8(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$80, %al
	jne	.L14
	movl	$0, %eax
	jmp	.L13
.L14:
	movq	-8(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$82, %al
	jne	.L15
	movq	-8(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$72, %al
	jne	.L15
	movl	$0, %eax
	jmp	.L13
.L15:
	movq	-8(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$80, %al
	jne	.L16
	movq	-8(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$72, %al
	je	.L17
	movq	-8(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$75, %al
	jne	.L16
.L17:
	movl	$0, %eax
	jmp	.L13
.L16:
	movl	$1, %eax
.L13:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	_Z11mm_is_validPc, .-_Z11mm_is_validPc
	.section	.rodata
.LC7:
	.string	"%s %s %s %s %s"
.LC8:
	.string	"%%MatrixMarket"
.LC9:
	.string	"matrix"
.LC10:
	.string	"coordinate"
.LC11:
	.string	"array"
.LC12:
	.string	"real"
.LC13:
	.string	"complex"
.LC14:
	.string	"pattern"
.LC15:
	.string	"integer"
.LC16:
	.string	"general"
.LC17:
	.string	"symmetric"
.LC18:
	.string	"hermitian"
.LC19:
	.string	"skew-symmetric"
	.text
	.globl	_Z14mm_read_bannerP8_IO_FILEPA4_c
	.type	_Z14mm_read_bannerP8_IO_FILEPA4_c, @function
_Z14mm_read_bannerP8_IO_FILEPA4_c:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1376, %rsp
	movq	%rdi, -1368(%rbp)
	movq	%rsi, -1376(%rbp)
	movq	-1376(%rbp), %rax
	movb	$32, 2(%rax)
	movq	-1376(%rbp), %rax
	movzbl	2(%rax), %edx
	movq	-1376(%rbp), %rax
	movb	%dl, 1(%rax)
	movq	-1376(%rbp), %rax
	movzbl	1(%rax), %edx
	movq	-1376(%rbp), %rax
	movb	%dl, (%rax)
	movq	-1376(%rbp), %rax
	movb	$71, 3(%rax)
	movq	-1368(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1025, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L19
	movl	$12, %eax
	jmp	.L45
.L19:
	subq	$8, %rsp
	leaq	-1168(%rbp), %r8
	leaq	-1232(%rbp), %rdi
	leaq	-1296(%rbp), %rcx
	leaq	-1360(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	leaq	-1104(%rbp), %rsi
	pushq	%rsi
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	$.LC7, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sscanf
	addq	$16, %rsp
	cmpl	$5, %eax
	setne	%al
	testb	%al, %al
	je	.L21
	movl	$12, %eax
	jmp	.L45
.L21:
	leaq	-1296(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L22
.L23:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L22:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L23
	leaq	-1232(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L24
.L25:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L24:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L25
	leaq	-1168(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L26
.L27:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L26:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L27
	leaq	-1104(%rbp), %rax
	movq	%rax, -8(%rbp)
	jmp	.L28
.L29:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	tolower
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movb	%dl, (%rax)
	addq	$1, -8(%rbp)
.L28:
	movq	-8(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L29
	leaq	-1360(%rbp), %rax
	movl	$14, %edx
	movl	$.LC8, %esi
	movq	%rax, %rdi
	call	strncmp
	testl	%eax, %eax
	je	.L30
	movl	$14, %eax
	jmp	.L45
.L30:
	leaq	-1296(%rbp), %rax
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	je	.L31
	movl	$15, %eax
	jmp	.L45
.L31:
	movq	-1376(%rbp), %rax
	movb	$77, (%rax)
	leaq	-1232(%rbp), %rax
	movl	$.LC10, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L32
	movq	-1376(%rbp), %rax
	movb	$67, 1(%rax)
	jmp	.L33
.L32:
	leaq	-1232(%rbp), %rax
	movl	$.LC11, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L34
	movq	-1376(%rbp), %rax
	movb	$65, 1(%rax)
	jmp	.L33
.L34:
	movl	$15, %eax
	jmp	.L45
.L33:
	leaq	-1168(%rbp), %rax
	movl	$.LC12, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L35
	movq	-1376(%rbp), %rax
	movb	$82, 2(%rax)
	jmp	.L36
.L35:
	leaq	-1168(%rbp), %rax
	movl	$.LC13, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L37
	movq	-1376(%rbp), %rax
	movb	$67, 2(%rax)
	jmp	.L36
.L37:
	leaq	-1168(%rbp), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L38
	movq	-1376(%rbp), %rax
	movb	$80, 2(%rax)
	jmp	.L36
.L38:
	leaq	-1168(%rbp), %rax
	movl	$.LC15, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L39
	movq	-1376(%rbp), %rax
	movb	$73, 2(%rax)
	jmp	.L36
.L39:
	movl	$15, %eax
	jmp	.L45
.L36:
	leaq	-1104(%rbp), %rax
	movl	$.LC16, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L40
	movq	-1376(%rbp), %rax
	movb	$71, 3(%rax)
	jmp	.L41
.L40:
	leaq	-1104(%rbp), %rax
	movl	$.LC17, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L42
	movq	-1376(%rbp), %rax
	movb	$83, 3(%rax)
	jmp	.L41
.L42:
	leaq	-1104(%rbp), %rax
	movl	$.LC18, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L43
	movq	-1376(%rbp), %rax
	movb	$72, 3(%rax)
	jmp	.L41
.L43:
	leaq	-1104(%rbp), %rax
	movl	$.LC19, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L44
	movq	-1376(%rbp), %rax
	movb	$75, 3(%rax)
	jmp	.L41
.L44:
	movl	$15, %eax
	jmp	.L45
.L41:
	movl	$0, %eax
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	_Z14mm_read_bannerP8_IO_FILEPA4_c, .-_Z14mm_read_bannerP8_IO_FILEPA4_c
	.section	.rodata
.LC20:
	.string	"%d %d %d\n"
	.text
	.globl	_Z21mm_write_mtx_crd_sizeP8_IO_FILEiii
	.type	_Z21mm_write_mtx_crd_sizeP8_IO_FILEiii, @function
_Z21mm_write_mtx_crd_sizeP8_IO_FILEiii:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	%ecx, -20(%rbp)
	movl	-20(%rbp), %esi
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC20, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	cmpl	$3, %eax
	setne	%al
	testb	%al, %al
	je	.L47
	movl	$17, %eax
	jmp	.L48
.L47:
	movl	$0, %eax
.L48:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	_Z21mm_write_mtx_crd_sizeP8_IO_FILEiii, .-_Z21mm_write_mtx_crd_sizeP8_IO_FILEiii
	.section	.rodata
.LC21:
	.string	"%d %d %d"
	.text
	.globl	_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_
	.type	_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_, @function
_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movq	%rdi, -1048(%rbp)
	movq	%rsi, -1056(%rbp)
	movq	%rdx, -1064(%rbp)
	movq	%rcx, -1072(%rbp)
	movq	-1072(%rbp), %rax
	movl	$0, (%rax)
	movq	-1072(%rbp), %rax
	movl	(%rax), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, (%rax)
	movq	-1064(%rbp), %rax
	movl	(%rax), %edx
	movq	-1056(%rbp), %rax
	movl	%edx, (%rax)
.L52:
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1025, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L50
	movl	$12, %eax
	jmp	.L55
.L50:
	movzbl	-1040(%rbp), %eax
	cmpb	$37, %al
	je	.L52
	movq	-1072(%rbp), %rsi
	movq	-1064(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC21, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sscanf
	cmpl	$3, %eax
	sete	%al
	testb	%al, %al
	je	.L53
	movl	$0, %eax
	jmp	.L55
.L53:
	movq	-1072(%rbp), %rsi
	movq	-1064(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	movq	-1048(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC21, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L54
	movl	$12, %eax
	jmp	.L55
.L54:
	cmpl	$3, -4(%rbp)
	jne	.L53
	movl	$0, %eax
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_, .-_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_
	.section	.rodata
.LC22:
	.string	"%d %d"
	.text
	.globl	_Z22mm_read_mtx_array_sizeP8_IO_FILEPiS1_
	.type	_Z22mm_read_mtx_array_sizeP8_IO_FILEPiS1_, @function
_Z22mm_read_mtx_array_sizeP8_IO_FILEPiS1_:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1072, %rsp
	movq	%rdi, -1048(%rbp)
	movq	%rsi, -1056(%rbp)
	movq	%rdx, -1064(%rbp)
	movq	-1064(%rbp), %rax
	movl	$0, (%rax)
	movq	-1064(%rbp), %rax
	movl	(%rax), %edx
	movq	-1056(%rbp), %rax
	movl	%edx, (%rax)
.L59:
	movq	-1048(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$1025, %esi
	movq	%rax, %rdi
	call	fgets
	testq	%rax, %rax
	sete	%al
	testb	%al, %al
	je	.L57
	movl	$12, %eax
	jmp	.L62
.L57:
	movzbl	-1040(%rbp), %eax
	cmpb	$37, %al
	je	.L59
	movq	-1064(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sscanf
	cmpl	$2, %eax
	sete	%al
	testb	%al, %al
	je	.L60
	movl	$0, %eax
	jmp	.L62
.L60:
	movq	-1064(%rbp), %rcx
	movq	-1056(%rbp), %rdx
	movq	-1048(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L61
	movl	$12, %eax
	jmp	.L62
.L61:
	cmpl	$2, -4(%rbp)
	jne	.L60
	movl	$0, %eax
.L62:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	_Z22mm_read_mtx_array_sizeP8_IO_FILEPiS1_, .-_Z22mm_read_mtx_array_sizeP8_IO_FILEPiS1_
	.section	.rodata
.LC23:
	.string	"%d %d\n"
	.text
	.globl	_Z23mm_write_mtx_array_sizeP8_IO_FILEii
	.type	_Z23mm_write_mtx_array_sizeP8_IO_FILEii, @function
_Z23mm_write_mtx_array_sizeP8_IO_FILEii:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movl	%esi, -12(%rbp)
	movl	%edx, -16(%rbp)
	movl	-16(%rbp), %ecx
	movl	-12(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	$.LC23, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	cmpl	$2, %eax
	setne	%al
	testb	%al, %al
	je	.L64
	movl	$17, %eax
	jmp	.L65
.L64:
	movl	$0, %eax
.L65:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	_Z23mm_write_mtx_array_sizeP8_IO_FILEii, .-_Z23mm_write_mtx_array_sizeP8_IO_FILEii
	.section	.rodata
.LC24:
	.string	"%d %d %lg %lg"
	.text
	.globl	_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc
	.type	_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc, @function
_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movq	%r8, -48(%rbp)
	movq	%r9, -56(%rbp)
	movq	24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L67
	movl	$0, -4(%rbp)
	jmp	.L68
.L71:
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	8(%rax), %rdx
	movq	16(%rbp), %rax
	leaq	(%rdx,%rax), %rdi
	movl	-4(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$.LC24, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$4, %eax
	setne	%al
	testb	%al, %al
	je	.L69
	movl	$12, %eax
	jmp	.L70
.L69:
	addl	$1, -4(%rbp)
.L68:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L71
	jmp	.L72
.L67:
	movq	24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$82, %al
	jne	.L73
	movl	$0, -4(%rbp)
	jmp	.L74
.L76:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$3, %eax
	setne	%al
	testb	%al, %al
	je	.L75
	movl	$12, %eax
	jmp	.L70
.L75:
	addl	$1, -4(%rbp)
.L74:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L76
	jmp	.L72
.L73:
	movq	24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$80, %al
	jne	.L77
	movl	$0, -4(%rbp)
	jmp	.L78
.L80:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$2, %eax
	setne	%al
	testb	%al, %al
	je	.L79
	movl	$12, %eax
	jmp	.L70
.L79:
	addl	$1, -4(%rbp)
.L78:
	movl	-4(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L80
	jmp	.L72
.L77:
	movl	$15, %eax
	jmp	.L70
.L72:
	movl	$0, %eax
.L70:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc, .-_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc
	.globl	_Z21mm_read_mtx_crd_entryP8_IO_FILEPiS1_PdS2_Pc
	.type	_Z21mm_read_mtx_crd_entryP8_IO_FILEPiS1_PdS2_Pc, @function
_Z21mm_read_mtx_crd_entryP8_IO_FILEPiS1_PdS2_Pc:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	%rdx, -24(%rbp)
	movq	%rcx, -32(%rbp)
	movq	%r8, -40(%rbp)
	movq	%r9, -48(%rbp)
	movq	-48(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L82
	movq	-40(%rbp), %rdi
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$.LC24, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$4, %eax
	setne	%al
	testb	%al, %al
	je	.L83
	movl	$12, %eax
	jmp	.L84
.L82:
	movq	-48(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$82, %al
	jne	.L85
	movq	-32(%rbp), %rsi
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rsi, %r8
	movl	$.LC6, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$3, %eax
	setne	%al
	testb	%al, %al
	je	.L83
	movl	$12, %eax
	jmp	.L84
.L85:
	movq	-48(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$80, %al
	jne	.L86
	movq	-24(%rbp), %rcx
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$.LC22, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$2, %eax
	setne	%al
	testb	%al, %al
	je	.L83
	movl	$12, %eax
	jmp	.L84
.L86:
	movl	$15, %eax
	jmp	.L84
.L83:
	movl	$0, %eax
.L84:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	_Z21mm_read_mtx_crd_entryP8_IO_FILEPiS1_PdS2_Pc, .-_Z21mm_read_mtx_crd_entryP8_IO_FILEPiS1_PdS2_Pc
	.section	.rodata
.LC25:
	.string	"stdin"
	.text
	.globl	_Z15mm_read_mtx_crdPcPiS0_S0_PS0_S1_PPdPA4_c
	.type	_Z15mm_read_mtx_crdPcPiS0_S0_PS0_S1_PPdPA4_c, @function
_Z15mm_read_mtx_crdPcPiS0_S0_PS0_S1_PPdPA4_c:
.LFB9:
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
	movl	$.LC25, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L88
	movq	stdin(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L89
.L88:
	movq	-24(%rbp), %rax
	movl	$.LC0, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	sete	%al
	testb	%al, %al
	je	.L89
	movl	$11, %eax
	jmp	.L90
.L89:
	movq	24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	_Z14mm_read_bannerP8_IO_FILEPA4_c
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	setne	%al
	testb	%al, %al
	je	.L91
	movl	-12(%rbp), %eax
	jmp	.L90
.L91:
	movq	24(%rbp), %rax
	movq	%rax, %rdi
	call	_Z11mm_is_validPc
	testl	%eax, %eax
	je	.L92
	movq	24(%rbp), %rax
	movzbl	1(%rax), %eax
	cmpb	$67, %al
	jne	.L92
	movq	24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$77, %al
	je	.L93
.L92:
	movl	$1, %eax
	jmp	.L94
.L93:
	movl	$0, %eax
.L94:
	testb	%al, %al
	je	.L95
	movl	$15, %eax
	jmp	.L90
.L95:
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rsi
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	_Z20mm_read_mtx_crd_sizeP8_IO_FILEPiS1_S1_
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	setne	%al
	testb	%al, %al
	je	.L96
	movl	-12(%rbp), %eax
	jmp	.L90
.L96:
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$2, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	$0, (%rax)
	movq	24(%rbp), %rax
	movzbl	2(%rax), %eax
	cmpb	$67, %al
	jne	.L97
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	addl	%eax, %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rdi
	movq	-64(%rbp), %rax
	movq	(%rax), %r9
	movq	-56(%rbp), %rax
	movq	(%rax), %r8
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-8(%rbp), %rax
	pushq	24(%rbp)
	pushq	%rdi
	movq	%rax, %rdi
	call	_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc
	addq	$16, %rsp
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L98
	movl	-12(%rbp), %eax
	jmp	.L90
.L97:
	movq	24(%rbp), %rax
	movzbl	2(%rax), %eax
	cmpb	$82, %al
	jne	.L99
	movq	-48(%rbp), %rax
	movl	(%rax), %eax
	cltq
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	movq	%rdx, (%rax)
	movq	16(%rbp), %rax
	movq	(%rax), %rdi
	movq	-64(%rbp), %rax
	movq	(%rax), %r9
	movq	-56(%rbp), %rax
	movq	(%rax), %r8
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-8(%rbp), %rax
	pushq	24(%rbp)
	pushq	%rdi
	movq	%rax, %rdi
	call	_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc
	addq	$16, %rsp
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L98
	movl	-12(%rbp), %eax
	jmp	.L90
.L99:
	movq	24(%rbp), %rax
	movzbl	2(%rax), %eax
	cmpb	$80, %al
	jne	.L98
	movq	16(%rbp), %rax
	movq	(%rax), %rdi
	movq	-64(%rbp), %rax
	movq	(%rax), %r9
	movq	-56(%rbp), %rax
	movq	(%rax), %r8
	movq	-48(%rbp), %rax
	movl	(%rax), %ecx
	movq	-40(%rbp), %rax
	movl	(%rax), %edx
	movq	-32(%rbp), %rax
	movl	(%rax), %esi
	movq	-8(%rbp), %rax
	pushq	24(%rbp)
	pushq	%rdi
	movq	%rax, %rdi
	call	_Z20mm_read_mtx_crd_dataP8_IO_FILEiiiPiS1_PdPc
	addq	$16, %rsp
	movl	%eax, -12(%rbp)
	cmpl	$0, -12(%rbp)
	je	.L98
	movl	-12(%rbp), %eax
	jmp	.L90
.L98:
	movq	stdin(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L100
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L100:
	movl	$0, %eax
.L90:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	_Z15mm_read_mtx_crdPcPiS0_S0_PS0_S1_PPdPA4_c, .-_Z15mm_read_mtx_crdPcPiS0_S0_PS0_S1_PPdPA4_c
	.section	.rodata
.LC26:
	.string	"%s %s\n"
	.text
	.globl	_Z15mm_write_bannerP8_IO_FILEPc
	.type	_Z15mm_write_bannerP8_IO_FILEPc, @function
_Z15mm_write_bannerP8_IO_FILEPc:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	_Z18mm_typecode_to_strPc
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rcx
	movl	$.LC8, %edx
	movl	$.LC26, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	%eax, -12(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	cmpl	$2, -12(%rbp)
	je	.L102
	movl	$17, %eax
	jmp	.L103
.L102:
	movl	$0, %eax
.L103:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	_Z15mm_write_bannerP8_IO_FILEPc, .-_Z15mm_write_bannerP8_IO_FILEPc
	.section	.rodata
.LC27:
	.string	"stdout"
.LC28:
	.string	"w"
.LC29:
	.string	"%s "
.LC30:
	.string	"%s\n"
.LC31:
	.string	"%d %d %20.16g\n"
.LC32:
	.string	"%d %d %20.16g %20.16g\n"
	.text
	.globl	_Z16mm_write_mtx_crdPciiiPiS0_PdS_
	.type	_Z16mm_write_mtx_crdPciiiPiS0_PdS_, @function
_Z16mm_write_mtx_crdPciiiPiS0_PdS_:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	%ecx, -36(%rbp)
	movq	%r8, -48(%rbp)
	movq	%r9, -56(%rbp)
	movq	-24(%rbp), %rax
	movl	$.LC27, %esi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L105
	movq	stdout(%rip), %rax
	movq	%rax, -8(%rbp)
	jmp	.L106
.L105:
	movq	-24(%rbp), %rax
	movl	$.LC28, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	sete	%al
	testb	%al, %al
	je	.L106
	movl	$17, %eax
	jmp	.L107
.L106:
	movq	-8(%rbp), %rax
	movl	$.LC8, %edx
	movl	$.LC29, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	24(%rbp), %rax
	movq	%rax, %rdi
	call	_Z18mm_typecode_to_strPc
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	movl	$.LC30, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	-36(%rbp), %esi
	movl	-32(%rbp), %ecx
	movl	-28(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%esi, %r8d
	movl	$.LC20, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movq	24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$80, %al
	jne	.L108
	movl	$0, -12(%rbp)
	jmp	.L109
.L110:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movl	$.LC23, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	addl	$1, -12(%rbp)
.L109:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L110
	jmp	.L111
.L108:
	movq	24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$82, %al
	jne	.L112
	movl	$0, -12(%rbp)
	jmp	.L113
.L114:
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movq	%rsi, -64(%rbp)
	movsd	-64(%rbp), %xmm0
	movl	$.LC31, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf
	addl	$1, -12(%rbp)
.L113:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L114
	jmp	.L111
.L112:
	movq	24(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L115
	movl	$0, -12(%rbp)
	jmp	.L116
.L117:
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	leaq	8(%rax), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdi
	movl	-12(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rsi
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %ecx
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-8(%rbp), %rax
	movq	%rdi, -64(%rbp)
	movsd	-64(%rbp), %xmm1
	movq	%rsi, -64(%rbp)
	movsd	-64(%rbp), %xmm0
	movl	$.LC32, %esi
	movq	%rax, %rdi
	movl	$2, %eax
	call	fprintf
	addl	$1, -12(%rbp)
.L116:
	movl	-12(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L117
	jmp	.L111
.L115:
	movq	stdout(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L118
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L118:
	movl	$15, %eax
	jmp	.L107
.L111:
	movq	stdout(%rip), %rax
	cmpq	%rax, -8(%rbp)
	je	.L119
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
.L119:
	movl	$0, %eax
.L107:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	_Z16mm_write_mtx_crdPciiiPiS0_PdS_, .-_Z16mm_write_mtx_crdPciiiPiS0_PdS_
	.globl	_Z9mm_strdupPKc
	.type	_Z9mm_strdupPKc, @function
_Z9mm_strdupPKc:
.LFB12:
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
	call	strlen
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -16(%rbp)
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	_Z9mm_strdupPKc, .-_Z9mm_strdupPKc
	.section	.rodata
.LC33:
	.string	"%s %s %s %s"
	.text
	.globl	_Z18mm_typecode_to_strPc
	.type	_Z18mm_typecode_to_strPc, @function
_Z18mm_typecode_to_strPc:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1088, %rsp
	movq	%rdi, -1080(%rbp)
	movl	$0, -4(%rbp)
	movq	-1080(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$77, %al
	jne	.L123
	movq	$.LC9, -1072(%rbp)
	jmp	.L124
.L123:
	movl	$1, -4(%rbp)
.L124:
	movq	-1080(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L125
	movq	$.LC10, -1064(%rbp)
	jmp	.L126
.L125:
	movq	-1080(%rbp), %rax
	addq	$1, %rax
	movzbl	(%rax), %eax
	cmpb	$65, %al
	jne	.L127
	movq	$.LC11, -1064(%rbp)
	jmp	.L126
.L127:
	movl	$0, %eax
	jmp	.L139
.L126:
	movq	-1080(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$82, %al
	jne	.L129
	movq	$.LC12, -1056(%rbp)
	jmp	.L130
.L129:
	movq	-1080(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$67, %al
	jne	.L131
	movq	$.LC13, -1056(%rbp)
	jmp	.L130
.L131:
	movq	-1080(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$80, %al
	jne	.L132
	movq	$.LC14, -1056(%rbp)
	jmp	.L130
.L132:
	movq	-1080(%rbp), %rax
	addq	$2, %rax
	movzbl	(%rax), %eax
	cmpb	$73, %al
	jne	.L133
	movq	$.LC15, -1056(%rbp)
	jmp	.L130
.L133:
	movl	$0, %eax
	jmp	.L139
.L130:
	movq	-1080(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$71, %al
	jne	.L134
	movq	$.LC16, -1048(%rbp)
	jmp	.L135
.L134:
	movq	-1080(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$83, %al
	jne	.L136
	movq	$.LC17, -1048(%rbp)
	jmp	.L135
.L136:
	movq	-1080(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$72, %al
	jne	.L137
	movq	$.LC18, -1048(%rbp)
	jmp	.L135
.L137:
	movq	-1080(%rbp), %rax
	addq	$3, %rax
	movzbl	(%rax), %eax
	cmpb	$75, %al
	jne	.L138
	movq	$.LC19, -1048(%rbp)
	jmp	.L135
.L138:
	movl	$0, %eax
	jmp	.L139
.L135:
	movq	-1048(%rbp), %rdi
	movq	-1056(%rbp), %rsi
	movq	-1064(%rbp), %rcx
	movq	-1072(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$.LC33, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	_Z9mm_strdupPKc
.L139:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	_Z18mm_typecode_to_strPc, .-_Z18mm_typecode_to_strPc
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
