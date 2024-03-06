.data

	msg: .asciiz "Enter 10 elements : "
	msg3: .asciiz "Enter element to be searched : "
	msg1: .asciiz "Element found"
	msg2: .asciiz "Element not found"
	.align  2
	arr: .space 40
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	li $t0,0
	la $a1,arr
read:
	add $a1,$a1,$t0
	li $v0,5
	syscall
	sw $v0,0($a1)
	addi $t0,$t0,4
	beq $t0,40,next
	j read
next:
	li $v0,4
	la $a0,msg3
	syscall
	li $v0,5
	syscall
	move $a2,$v0
	la $a1,arr
	li $t0,0
search:
	beq $t0,40,exit
	add $a1,$a1,$t0
	lw $a0,0($a1)
	beq $a2,$a0,found
	addi $t0,$t0,4
	j search
found:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,10
	syscall
exit:
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,10
	syscall
