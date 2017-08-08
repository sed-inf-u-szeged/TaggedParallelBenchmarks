	.file	"nn_openmp.c"
	.section	.rodata
.LC0:
	.string	"Invalid set of arguments\n"
.LC1:
	.string	"r"
.LC2:
	.string	"error opening flist"
.LC3:
	.string	"no room for neighbors\n"
.LC5:
	.string	"%s\n"
.LC6:
	.string	"error reading filelist\n"
.LC7:
	.string	"error opening a db"
.LC8:
	.string	"Error"
.LC10:
	.string	"%f %f"
	.align 8
.LC12:
	.string	"The %d nearest neighbors are:\n"
.LC13:
	.string	"%s --> %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$696, %rsp
	.cfi_offset 3, -24
	movl	%edi, -676(%rbp)
	movq	%rsi, -688(%rbp)
	movl	$0, -28(%rbp)
	movl	$0, -32(%rbp)
	movl	$0, -52(%rbp)
	movl	$0, -56(%rbp)
	movl	$0, -36(%rbp)
	movq	$0, -64(%rbp)
	cmpl	$4, -676(%rbp)
	jg	.L2
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$25, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$-1, %edi
	call	exit
.L2:
	movq	-688(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -72(%rbp)
	cmpq	$0, -72(%rbp)
	jne	.L3
	movl	$.LC2, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L3:
	movq	-688(%rbp), %rax
	addq	$16, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -52(%rbp)
	movq	-688(%rbp), %rax
	addq	$24, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	cvtsd2ss	%xmm0, %xmm3
	movss	%xmm3, -76(%rbp)
	movq	-688(%rbp), %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atof
	cvtsd2ss	%xmm0, %xmm4
	movss	%xmm4, -80(%rbp)
	movl	-52(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	jne	.L4
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$22, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movl	$0, %edi
	call	exit
.L4:
	movl	$0, -32(%rbp)
	jmp	.L5
.L6:
	movl	-32(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movabsq	$4666723172467343360, %rax
	movq	%rax, 56(%rdx)
	addl	$1, -32(%rbp)
.L5:
	movl	-32(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L6
	leaq	-672(%rbp), %rdx
	movq	-72(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$1, %eax
	setne	%al
	testb	%al, %al
	je	.L7
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$23, %edx
	movl	$1, %esi
	movl	$.LC6, %edi
	call	fwrite
	movl	$0, %edi
	call	exit
.L7:
	leaq	-672(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L8
	movl	$.LC2, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L8:
	movl	$40, %eax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -88(%rbp)
	jmp	.L9
.L24:
	movq	-24(%rbp), %rdx
	leaq	-608(%rbp), %rax
	movq	%rdx, %rcx
	movl	$10, %edx
	movl	$49, %esi
	movq	%rax, %rdi
	call	fread
	movl	%eax, -56(%rbp)
	cmpl	$10, -56(%rbp)
	je	.L10
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	ferror
	testl	%eax, %eax
	sete	%al
	testb	%al, %al
	je	.L11
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	feof
	testl	%eax, %eax
	setne	%al
	testb	%al, %al
	je	.L12
	movl	$1, -36(%rbp)
	jmp	.L10
.L12:
	leaq	-672(%rbp), %rdx
	movq	-72(%rbp), %rax
	movl	$.LC5, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf
	cmpl	$1, %eax
	setne	%al
	testb	%al, %al
	je	.L13
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$23, %edx
	movl	$1, %esi
	movl	$.LC6, %edi
	call	fwrite
	movl	$0, %edi
	call	exit
.L13:
	leaq	-672(%rbp), %rax
	movl	$.LC1, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L10
	movl	$.LC7, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L11:
	movl	$.LC8, %edi
	call	perror
	movl	$0, %edi
	call	exit
.L10:
	movl	$0, -40(%rbp)
	jmp	.L14
.L15:
	movl	-40(%rbp), %eax
	imull	$49, %eax, %eax
	cltq
	leaq	27(%rax), %rdx
	leaq	-608(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -96(%rbp)
	movl	.LC9(%rip), %eax
	movl	%eax, -100(%rbp)
	movl	.LC9(%rip), %eax
	movl	%eax, -104(%rbp)
	leaq	-104(%rbp), %rcx
	leaq	-100(%rbp), %rdx
	movq	-96(%rbp), %rax
	movl	$.LC10, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sscanf
	movl	-40(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-88(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movss	-100(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	subss	-76(%rbp), %xmm1
	movss	-100(%rbp), %xmm0
	subss	-76(%rbp), %xmm0
	mulss	%xmm0, %xmm1
	movss	-104(%rbp), %xmm0
	movaps	%xmm0, %xmm2
	subss	-80(%rbp), %xmm2
	movss	-104(%rbp), %xmm0
	subss	-80(%rbp), %xmm0
	mulss	%xmm2, %xmm0
	addss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	call	sqrt
	cvtsd2ss	%xmm0, %xmm5
	movd	%xmm5, %eax
	movl	%eax, (%rbx)
	addl	$1, -40(%rbp)
.L14:
	movl	-40(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L15
	movl	$0, -28(%rbp)
	jmp	.L16
.L23:
	movl	.LC11(%rip), %eax
	movl	%eax, -44(%rbp)
	movl	$0, -48(%rbp)
	movl	$0, -32(%rbp)
	jmp	.L17
.L20:
	movl	-32(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movsd	56(%rax), %xmm1
	cvtss2sd	-44(%rbp), %xmm0
	ucomisd	%xmm0, %xmm1
	jbe	.L18
	movl	-32(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movsd	56(%rax), %xmm0
	cvtsd2ss	%xmm0, %xmm6
	movss	%xmm6, -44(%rbp)
	movl	-32(%rbp), %eax
	movl	%eax, -48(%rbp)
.L18:
	addl	$1, -32(%rbp)
.L17:
	movl	-32(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L20
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-88(%rbp), %rax
	addq	%rdx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm0
	movl	-48(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movsd	56(%rax), %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L21
	movl	-28(%rbp), %eax
	addl	$1, %eax
	imull	$49, %eax, %eax
	subl	$1, %eax
	cltq
	movb	$0, -608(%rbp,%rax)
	movl	-28(%rbp), %eax
	imull	$49, %eax, %eax
	cltq
	leaq	-608(%rbp), %rdx
	addq	%rdx, %rax
	movl	-48(%rbp), %edx
	movslq	%edx, %rdx
	movq	%rdx, %rcx
	salq	$6, %rcx
	movq	-64(%rbp), %rdx
	addq	%rcx, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy
	movl	-48(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rax, %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-88(%rbp), %rax
	addq	%rcx, %rax
	movss	(%rax), %xmm0
	cvtss2sd	%xmm0, %xmm7
	movq	%xmm7, %rax
	movq	%rax, 56(%rdx)
.L21:
	addl	$1, -28(%rbp)
.L16:
	movl	-28(%rbp), %eax
	cmpl	-56(%rbp), %eax
	jl	.L23
.L9:
	cmpl	$0, -36(%rbp)
	je	.L24
	movq	stderr(%rip), %rax
	movl	-52(%rbp), %edx
	movl	$.LC12, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, -32(%rbp)
	jmp	.L25
.L28:
	movl	-32(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movsd	56(%rax), %xmm0
	ucomisd	.LC4(%rip), %xmm0
	jp	.L32
	ucomisd	.LC4(%rip), %xmm0
	je	.L26
.L32:
	movl	-32(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	addq	%rdx, %rax
	movq	56(%rax), %rdx
	movl	-32(%rbp), %eax
	cltq
	salq	$6, %rax
	movq	%rax, %rcx
	movq	-64(%rbp), %rax
	addq	%rcx, %rax
	movq	%rax, %rcx
	movq	stderr(%rip), %rax
	movq	%rdx, -696(%rbp)
	movsd	-696(%rbp), %xmm0
	movq	%rcx, %rdx
	movl	$.LC13, %esi
	movq	%rax, %rdi
	movl	$1, %eax
	call	fprintf
.L26:
	addl	$1, -32(%rbp)
.L25:
	movl	-32(%rbp), %eax
	cmpl	-52(%rbp), %eax
	jl	.L28
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	addq	$696, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1086556160
	.align 4
.LC9:
	.long	0
	.align 4
.LC11:
	.long	3212836864
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
