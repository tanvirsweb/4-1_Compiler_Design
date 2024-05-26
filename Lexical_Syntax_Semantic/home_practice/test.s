	.file	"test.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "%d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	DWORD PTR [esp+28], 0
	mov	DWORD PTR [esp+20], 10
	mov	DWORD PTR [esp+24], 0
	mov	DWORD PTR [esp+28], 0
	jmp	L2
L3:
	mov	eax, DWORD PTR [esp+28]
	lea	edx, [eax+1]
	mov	DWORD PTR [esp+28], edx
	add	DWORD PTR [esp+24], eax
	add	DWORD PTR [esp+28], 1
L2:
	mov	eax, DWORD PTR [esp+28]
	cmp	eax, DWORD PTR [esp+20]
	jl	L3
	mov	eax, DWORD PTR [esp+24]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
