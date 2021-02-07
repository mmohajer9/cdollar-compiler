.data
backn: .asciiz "\n"
.text
.globl main


main:
    li $t0,3
    move $s0,$t0
    li $t0,4
    slt $t1,$s0,$t0
    beq $t1,$zero,main__if
    li $t2,6
    j END_IF_7

main__if:
    li $t0,1
    seq $t1,$s0,$t0
    beq $t1,$zero,main__elseif
    li $t2,7
    j END_IF_7

main__elseif:
    li $t0,9
    j END_IF_7

END_IF_7:

main__while:
    li $t0,5
    slt $t1,$s0,$t0
    beq $t1,$zero,END_main__while
    li $t2,6
    move $s1,$t2
    j END_main__while
    li $t0,4
    move $s2,$t0
    j main__while

END_main__while:
