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
	move $a3,$a0
	addi $t0,$zero,0
	addi $t6,$zero,0
	addi $t1,$zero,10
count:
	beq $a3,$zero,loop
	div $a3,$t1
	mflo $a3
	addi $t6,$t6,1
	j count
loop:
	seq $t2,$a2,$zero
	bne $t2,$zero,test
	div $a2,$t1
	mfhi $t3
	mflo $a2
	li $t4,1
	li $t5,0
	power:
		beq $t5,$t6,next
		mul $t4,$t4,$t3
		addi $t5,$t5,1
		j power		
	next:
	add $t0,$t0,$t4
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