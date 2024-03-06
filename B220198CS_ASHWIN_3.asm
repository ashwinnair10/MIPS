.data
	msg: .asciiz "Enter a number : "
	msg1: .asciiz "Palindrome"
	msg2: .asciiz "Not Palindrome"
.text
main:
	li $v0,4
	la $a0,msg
	syscall
	li $v0,5
	syscall
	move $a0,$v0
	add $a1,$a0,$zero
	jal rev
	beq $a1,$v0,palin
	li $v0,4
	la $a0,msg2
	syscall
	li $v0,10
	syscall
palin:
	li $v0,4
	la $a0,msg1
	syscall
	li $v0,10
	syscall
rev:
    addi $v0,$zero,0        
    addi $t2,$zero,10
loop:
    beq $a0,$zero,return    
    div $a0,$t2              
    mflo $t0                  
    mfhi $t1                  
    mul $v0,$v0, $t2         
    add $v0,$v0,$t1         
    move $a0,$t0             
    j loop                    
return:
    jr $ra                    

