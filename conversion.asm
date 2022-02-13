# conversion.asm program
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
conv:
    # TODO: Write your function code here
    li $t0, 0
    li $t1, 0
    li $t2, 8
    li $t3, 2
    li $t4, -8
    move $t6, $a0
    move $t7, $a1
loop:
    bge $t1, $t2, loop_exit
    mult $t6, $t4
    mflo $t5
    add $t0, $t0, $t5
    add $t0, $t0, $t7
    bge $t6, $t3, inside_if
after_if:
    addiu $t6, $t6, 1
    addiu $t1, $t1, 1
    j loop
inside_if:
    addiu $t7, $t7, -1
    j after_if
loop_exit:
    move $v0, $t0
    jr $ra

main:
	li $a0, 5
    li $a1, 7

    jal conv

	move $a0, $v0
    li $v0, 1
    syscall
    j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0, 10
    syscall
