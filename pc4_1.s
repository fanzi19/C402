	.text
	.globl main

main:	move $s0, $ra
	jal test
	nop
	move $ra, $s0
	jr $ra

test:	nop
	jr $ra
