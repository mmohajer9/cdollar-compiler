.data
backn: .asciiz "\n"
.text
.globl main


func:
    li $t0,5
    mul $t1,$a0,$t0
    move $v0,$t1
    jr $ra
    jr $ra

main:
    li $t0,3
    move $s0,$t0
    move $s1,$t0
    move $a0,$s0
    jal func
    move $s0,$v0
    li $t0,5
    slt $t1,$s0,$t0
    beq $t1,$zero,main__if
    li $t2,91
    move $s1,$t2
    j END_IF_12

main__if:
    li $t0,5
    seq $t1,$s0,$t0
    beq $t1,$zero,main__elseif
    li $t2,92
    move $s1,$t2
    j END_IF_12

main__elseif:
    li $t0,93
    move $s1,$t0
    j END_IF_12

END_IF_12:
