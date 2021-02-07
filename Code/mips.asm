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
    li $t0,1
    beq $t0,$zero,main__if13
    j END_IF_13

main__if13:

END_IF_13:
    li $t0,1
    beq $t0,$zero,main__if16
    j END_IF_16

main__if16:

END_IF_16:
    li $t0,1
    beq $t0,$zero,main__if19
    move $s2,$t0
    j END_IF_19

main__if19:

END_IF_19:
    li $t0,1
    beq $t0,$zero,main__if22
    move $s3,$t0
    j END_IF_22

main__if22:

END_IF_22:
    li $t0,1
    beq $t0,$zero,main__if25
    move $s4,$t0
    j END_IF_25

main__if25:

END_IF_25:

main__for29:
    li $t0,0
    move $s5,$t0
    li $t1,5
    slt $t2,$s5,$t1
    beq $t2,$zero,END_main__for29
    li $t3,1
    add $t4,$s5,$t3
    move $s5,$t4
    j main__for29

END_main__for29:

main__for32:
    li $t0,0
    move $s6,$t0
    li $t1,5
    slt $t2,$s6,$t1
    beq $t2,$zero,END_main__for32
    li $t3,1
    add $t4,$s6,$t3
    move $s6,$t4
    j main__for32

END_main__for32:

main__while34:
    li $t0,1
    beq $t0,$zero,END_main__while34
    j main__while34

END_main__while34:

main__while35:
    li $t0,1
    beq $t0,$zero,END_main__while35
    j main__while35

END_main__while35:

main__while36:
    li $t0,1
    beq $t0,$zero,END_main__while36
    j main__while36

END_main__while36:

main__while37:
    li $t0,1
    beq $t0,$zero,END_main__while37
    j main__while37

END_main__while37:

main__while38:
    li $t0,1
    beq $t0,$zero,END_main__while38
    j main__while38

END_main__while38:

main__while39:
    li $t0,1
    beq $t0,$zero,END_main__while39
    j main__while39

END_main__while39:
