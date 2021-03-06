/* multiboot header constants */
.set ALIGN, 1<<0
.set MEMINFO, 1<<1
.set FLAGS, ALIGN | MEMINFO
.set MAGIC, 0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)
/* decalre multiboot header that marks program as kernel */
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/*  */
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

/*  */
.section .text
.global _start
.type _start, @function
_start:
	/*  */
	mov $stack_top, %esp

	/* global constructors */
	call _init
	/* move into the kernel main routine */
	call kernel_main

	/* infinite system loop
	1)
	2)
	3)
	 */
	cli
1:	hlt
	jmp 1b

/* */
.size _start, . - _start

