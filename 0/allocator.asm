.globl malloc free

malloc:
  _malloc_while0:
    andi $t0, $a0, 0x3
    beq $t0, $zero, _malloc_while0_end
    addiu $a0, $a0, 1
    j _malloc_while0
  _malloc_while0_end:
  li $v0, 9
  syscall
  jr $ra

free:
  jr $ra
