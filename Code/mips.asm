.data
backn: .asciiz "\n"
.text
.globl main
    li $t0,7
    li $t1,2
    move $s2,$s2
    move $s3,$s3
    add $t2,$s2,$s3
    li $t3,2
    li $t4,3
    add $t5,$t3,$t4
    li $t6,2
    li $t7,3
    mul $t8,$t6,$t7
    li $t9,4
    add no register,$t8,$t9
    move $s5,$s5
    li $t0,3
    add $t1,$s5,$t0
    li $t0,0
