.data
	ip: .space 100
	op: .space 100
	msg: .asciiz "Enter input string : "
	msg1: .asciiz "Output string : "
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	la $a0,ip
	la $a1,100
	li $v0,8
	syscall
	la $t0,ip
	la $t6,op
	convert:
		lb $t1,0($t0)
		beq $t1,$zero,exit
		uppercase:
			li $t3,65
			li $t4,90
			sle $t2,$t1,$t4
			beq $t2,$zero,lowercase
			sle $t2,$t3,$t1
			beq $t2,$zero,increment
			addi $t1,$t1,32
			sb $t1,0($t6)
			j increment
		lowercase:
			li $t3,97
			li $t4,122
			sle $t2,$t1,$t4
			beq $t2,$zero,increment
			sle $t2,$t3,$t1
			beq $t2,$zero,increment
			addi $t1,$t1,-32
			sb $t1,0($t6)
			j increment
		increment:
			sb $t1,0($t6)
			addi $t0,$t0,1
			addi $t6,$t6,1
			j convert
exit:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,4
	la $a0,op
	syscall
	li $v0,10
	syscall