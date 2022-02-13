# print_array.asm program
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	array: .word 1 2 3 4 5 6 7 8 9 10
	cout: .asciiz "The contents of the array in reverse order are:\n"
	newline: .asciiz "\n"

.text
printA:
    # TODO: Write your function code here
	li $t1, 4
	move $t2, $a1
	mult $t1, $t2
	mflo $t3
	addiu $t3, -4 

	move $t0, $a0
	addu $t0, $t0, $t3

loop:
	blt $t3, $zero, loop_exit
	lw $t4, ($t0)

	li $v0, 1
	move $a0, $t4
	syscall

	li $v0, 4
	la $a0, newline
	syscall

	addiu $t3, $t3, -4
	addiu $t0, $t0, -4
	j loop

loop_exit:
	j after_printA

main:
	li $v0, 4
	la $a0, cout
	syscall

	la $a0, array
	li $a1, 10
	jal printA

after_printA:
	j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0, 10
	syscall

