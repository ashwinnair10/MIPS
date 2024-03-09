.data
	msg1: .asciiz "Enter array : "
	msg2: .asciiz "Sorted array : "
	space: .asciiz " "
	.align 2
	arr: .space 40
.text
main:
	li $v0,4
	la $a0,msg1
	syscall
	li $t0,0
	li $t1,40
	la $a0,arr
	input:
		beq $t0,$t1,sort
		li $v0,5
		syscall
		sw $v0,0($a0)
		addi $a0,$a0,4
		addi $t0,$t0,4
		j input
	sort:
	la $t5,arr
	li $t0,0
	li $t2,40
	la $t6,arr
	sorti:
		beq $t0,$t2,print
		move $t1,$t0
		loop:
			beq $t1,$t2,nextsort
			lw $a1,0($t6)
			lw $a2,0($t5)
			slt $t3,$a2,$a1
			beq $t3,$zero,nextloop
			move $t4,$a1
			sw $a2, arr($t0)
			sw $t4, arr($t1)
			nextloop:
				addi $t5,$t5,4
				addi $t1,$t1,4
				j loop
		nextsort:
			addi $t6,$t6,4
			addi $t0,$t0,4
			move $t5,$t6
			j sorti
	print:
		li $v0,4
		la $a0,msg2
		syscall
		la $a1,arr
		li $t0,0
		li $t1,40
		ploop:
			lw $a0,0($a1)
			li $v0,1
			syscall
			li $v0,4
			la $a0,space
			syscall
			addi $a1,$a1,4
			addi $t0,$t0,4
			beq $t0,$t1,exit
			j ploop
exit:
	li $v0,10
	syscall
		
		