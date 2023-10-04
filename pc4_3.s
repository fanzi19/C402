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
	move $t0, $v0

	li $v0, 4
	la $a0, prompt2
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	jal Largest
	nop

	move $a0, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall

Largest:
	bgt $t0, $t1, To_larger
	move $v0, $t1
	jr $ra

To_larger:
	move $v0, $t0
	jr $ra
