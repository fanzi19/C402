	.data
prompt:	.asciiz "Enter a non-negative integer:"
msg:	.asciiz "The factorial is: "

	.text
	.globl main


main: 	li $v0, 4
	la $a0, prompt
	syscall

input_loop:
	li $v0, 5
	syscall
	move $t0, $v0

	bltz $t0, is_negative

	move $a0, $t0
	jal Factorial

	move $t1, $v0

	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall


is_negative:

	li $v0, 4
	la $a0, prompt
	syscall
	j input_loop


Factorial:
	subu $sp, $sp, 4
	sw $ra, 4($sp)

	beqz $a0, terminate
	subu $sp, $sp, 4
	sw $a0, 4($sp)
	sub $a0, $a0, 1
	jal Factorial

	lw $t0, 4($sp)
	mul $v0, $v0, $t0
	lw $ra, 8($sp)
	addu $sp, $sp, 8
	jr $ra

terminate:
	li $v0, 1
	lw $ra, 4($sp)
	addu $sp, $sp, 4
	jr $ra




