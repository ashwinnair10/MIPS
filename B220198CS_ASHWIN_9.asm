.data
	msg: .asciiz "Enter n : "
	msg1: .asciiz "Nth fibonacci number : "
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $a1,$v0
	li $v0,4
	la $a0,msg1
	syscall
	li $t0,0
	addi $t1,$zero,1
	beq $a1,$t0,zero
	beq $a1,$t1,one
	addi $t2,$zero,2
	loop:
		sle $t4,$t2,$a1
		beq $t4,$zero,display
		add $t3,$t0,$t1
		move $t0,$t1
		move $t1,$t3
		addi $t2,$t2,1
		j loop
display:
	move $a0,$t3
	li $v0,1
	syscall
	j exit	
zero:
	move $a0,$t0
	li $v0,1
	syscall
	j exit
one:
	move $a0,$t1
	li $v0,1
	syscall
	j exit
exit:
	li $v0,10
	syscall