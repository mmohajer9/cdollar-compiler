.data
backn: .asciiz "\n"
.text
.globl main

mamad:

    add $t0,$a0,$a1
    move $s0,$t0
    jr $ra
main:

    li $t0,7
    li $t1,3
    add $t2,$t0,$t1
    move $s1,$t2
    li $t0,2
    li $t1,3
    li $t2,4
    mul $t3,$t1,$t2
    add $t4,$t0,$t3
    move $s2,$t4
    move $a1,$s2
    move $a0,$s1
    jal mamad
    move $s3,$t0
