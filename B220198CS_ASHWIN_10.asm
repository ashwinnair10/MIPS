.data
	msg: .asciiz "Enter signed binary number : "
	msg1: .asciiz "Sum of given number with its 2's complement : "
	arr: .space 35
	arr1: .space 35
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
		beq $t3,$zero,copy
		addi $t1,$t1,1
		addi $t0,$t0,1
		j loop	
copy:
	la $t0,arr1
	la $t4,arr
	li $t6,48
	addi $t1,$t1,-2
	addi $t2,$zero,0
	loopi:
		lb $t5,0($t4)
		sb $t6,0($t0)
		beq $t2,$t1,exit
		addi $t0,$t0,1
		addi $t2,$t2,1
		addi $t4,$t4,1
		j loopi
exit:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,4
	la $a0,arr1
	syscall
	li $v0,10
	syscall