.data
	msg: .asciiz "Enter a number : "
	msg1: .asciiz "Armstrong Number"
	msg2: .asciiz "Not Armstrong Number"
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $a0,$v0
	move $a1,$a0
	move $a2,$a0
	addi $t0,$zero,0
	addi $t1,$zero,10
loop:
	seq $t2,$a2,$zero
	bne $t2,$zero,test
	div $a2,$t1
	mfhi $t3
	mflo $a2
	move $t4,$t3
	mul $t3,$t3,$t3
	mul $t3,$t3,$t4
	add $t0,$t0,$t3
	j loop
test:
	beq $a1,$t0,yes
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,10
	syscall
yes:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,10
	syscall