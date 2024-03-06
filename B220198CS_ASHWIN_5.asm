.data
	msg: .asciiz "Enter a number : "
	msg1: .asciiz "Perfect Number"
	msg2: .asciiz "Not Perfect Number"
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $a0,$v0
perfect:
	addi $t0,$zero,1
	addi $t1,$zero,0
loop:
	slt $t2,$t0,$a0
	beq $t2,$zero,check
	div $a0,$t0
	mfhi $t3
	seq $t4,$t3,$zero
	beq $t4,$zero,next
	add $t1,$t1,$t0
next:
	add $t0,$t0,1
	j loop
check:
	seq $t0,$t1,$a0
	beq $t0,$zero,notperfect
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,10
	syscall
notperfect:
	li $v0,4
	la $a0,msg2
	syscall
	move $a0,$t1
	li $v0,10
	syscall