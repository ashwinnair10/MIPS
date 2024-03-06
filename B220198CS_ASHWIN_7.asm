.data
	msg1: .asciiz "Enter first number : "
	msg2: .asciiz "Enter second number : "
	msg3: .asciiz "Invalid Input"
	msg4: .asciiz "Number of Prime Numbers in given range : "
	space: .asciiz " "
	newline: .asciiz "\n"
	msg5: .asciiz "Prime Numbers : "
.text
main:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,5
	syscall
	move $a1,$v0
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,5
	syscall
	move $a2,$v0
	move $t5,$zero
	li $v0,4
	la $a0,msg5
	syscall
	slt $t0,$a1,$a2
	beq $t0,$zero,invalid
loop:
	beq $a1,$a2,exit
	prime:
		addi $t0,$zero,1
		addi $t1,$zero,0
	ploop:
		sle $t2,$t0,$a1
		beq $t2,$zero,check
		div $a1,$t0
		mfhi $t3
		seq $t4,$t3,$zero
		beq $t4,$zero,next
		add $t1,$t1,$t0
	next:
		add $t0,$t0,1
		j ploop
	check:
		addi $t6,$a1,1
		beq $t6,$t1,isprime
		addi $a1,$a1,1
		j loop
	isprime:
		addi $t5,$t5,1
		move $a0,$a1
		li $v0,1
		syscall
		li $v0,4
		la $a0,space
		syscall
		addi $a1,$a1,1
		j loop
exit:
	li $v0,4
	la $a0,newline
	syscall
	li $v0,4
	la $a0,msg4
	syscall
	move $a0,$t5
	li $v0,1
	syscall
	li $v0,10
	syscall	
invalid:
	li $v0,4
	la $a0,msg3
	syscall
	li $v0,10
	syscall