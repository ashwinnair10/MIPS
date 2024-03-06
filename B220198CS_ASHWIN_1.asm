.data
	msg1: .asciiz "EVEN"
	msg2: .asciiz "ODD"
	msg: .asciiz "Enter a number :"
.text
main:
	la $a0,msg
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $a0,$v0
	addi $t0,$zero,2
	div $a0,$t0
	mfhi $t1
	addi $t2,$zero,1
	bne $t1,$t2,EVEN
	la $a0,msg2
	li $v0,4
	syscall
	li $v0 10
	syscall
EVEN:
	li $v0 4
	la $a0,msg1
	syscall
	li $v0 10
	syscall