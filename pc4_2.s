	.text
	.globl main

main:	add $sp, $sp, -4
	sw $ra, 4($sp)
	jal test
	nop
	lw $ra, 4($sp)
	add $sp, $sp, 4
	jr $ra

test:	nop
	jr $ra
