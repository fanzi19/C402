	.data
prompt:	.asciiz "Enter the first non-negative integer:"
prompt2: .asciiz "Enter the second non-negative integer:"
msg_error: .asciiz "Please input non-negative integer."
msg:	.asciiz "The result is: "

	.text
	.globl main


main: 	li $v0, 4
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

	bltz $t0, is_negative
	bltz $t1, is_negative

	move $a0, $t0
	move $a1, $t1
	jal Ackermann

	move $t2, $v0

	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 1
	move $a0, $t2
	syscall

	li $v0, 10
	syscall


is_negative:

	li $v0, 4
	la $a0, msg_error
	syscall
	j main


Ackermann:

	subu $sp, $sp, 12
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 8($sp)

loop:
	lw $a0, 0($sp)
	lw $a1, 4($sp)

	beqz $a0, base_case_x0
	beqz $a1, base_case_y0

	sw $a0, 0($sp)
	sw $a1, 4($sp)

	addi $a1, $a1, -1
	jal Ackermann

	move $t2, $v0

	lw $a0, 0($sp)
	lw $a1, 4($sp)

	addi $a0, $a0, -1
	move $a1, $t2
	jal Ackermann

	j done

base_case_x0:
	addi $v0, $a1, 1
	j done

base_case_y0:

	beqz $a0, base_case_x0
	addi $a0, $a0, -1
	li $a1, 1
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	j loop

done:
	lw $ra, 8($sp)
	addu $sp, $sp, 12
	jr $ra




