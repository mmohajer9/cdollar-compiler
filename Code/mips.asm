.data
backn: .asciiz "\n"
.text
.globl main

    li $t0,4
    move $s0,$t0

func:
    move $v0,$s0
    jr $ra
    jr $ra

main:
    li $t0,0
    move $s1,$t0
    li $t0,0
    move $s1,$t0

main__for13:
    li $t1,10
    slt $t2,$s1,$t1
    beq $t2,$zero,END_main__for13
    li $t3,1
    add $t4,$s1,$t3
    j main__for13
    li $t0,128
    move $s2,$t0
    j main__for13

END_main__for13:
