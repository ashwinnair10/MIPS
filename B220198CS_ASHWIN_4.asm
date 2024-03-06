.data
	msg: .asciiz "Enter binary number : "
	msg1: .asciiz "Decimal Equivalent : "
	arr: .space 35
	newline: .asciiz "\n"
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	la $a0,arr
	li $a1,35
	li $v0,8
	syscall
strlen:
	la $t0,arr
	addi $t1,$zero,0
	loop:
		lb $t3,0($t0)
		beq $t3,$zero,calculate
		addi $t1,$t1,1
		addi $t0,$t0,1
		j loop
calculate:
	addi $t2,$zero,1
	addi $t1,$t1,-2
	move $t3,$zero
	la $t0,arr
	la $a0,arr
	add $t0,$t0,$t1
	loopi:
		sle $t6,$a0,$t0
		beq $t6,$zero,print
		lb $t5,0($t0)
		addi $t5,$t5,-48
		mul $t4,$t2,$t5
		add $t3,$t3,$t4
		addi $t0,$t0,-1
		mul $t2,$t2,2
		j loopi
print:
	li $v0,4
	la $a0,msg1
	syscall
	move $a0,$t3
	li $v0,1
	syscall
	li $v0,10
	syscall