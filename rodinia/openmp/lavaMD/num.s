	.file	"num.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	isInteger
	.type	isInteger, @function
isInteger:
.LFB0:
	.cfi_startproc
	movzbl	(%rdi), %eax
	leal	-48(%rax), %edx
	xorl	%eax, %eax
	cmpb	$9, %dl
	jbe	.L4
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L5:
	subl	$48, %eax
	cmpb	$9, %al
	ja	.L7
.L4:
	addq	$1, %rdi
	movzbl	(%rdi), %eax
	testb	%al, %al
	jne	.L5
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	rep; ret
	.p2align 4,,10
	.p2align 3
.L7:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	isInteger, .-isInteger
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (GNU) 4.9.1"
	.section	.note.GNU-stack,"",@progbits
