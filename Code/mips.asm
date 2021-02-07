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
