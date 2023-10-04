	.data
prompt:	.asciiz "Enter the first integer:"
prompt2: .asciiz "Enter the second integer:"

	.text
	.globl main

main:	
	li $v0, 4
	la $a0, prompt
	syscall

	li $v0, 5
	syscall

	add $sp, $sp, -8
	sw $v0, 8($sp)

	li $v0, 4
	la $a0, prompt2
	syscall

	li $v0, 5
	syscall
	sw $v0, 4($sp)

	jal Largest
	nop

	move $v0, $a0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

Largest:
	lw $t1, 4($sp)
	add $sp, $sp, 4
	lw $t0, 4($sp)
	bgt $t0, $t1, To_larger
	move $a0, $t1
	jr $ra

To_larger:
	move $a0, $t0
	jr $ra
