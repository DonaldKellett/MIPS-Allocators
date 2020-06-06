.data

_Gender_str0: .asciiz "FEMALE"
_Gender_str1: .asciiz "MALE"

_print_person_str0: .asciiz "Person { name = "
_print_person_str1: .asciiz "; age = "
_print_person_str2: .asciiz "; gender = "
_print_person_str3: .asciiz " }\n"

_main_str0: .asciiz "Kevin Walker"
_main_str1: .asciiz "Alice Buzzard"
_main_str2: .asciiz "Jonathan Lomas"
_main_str3: .asciiz "Catherine Forbes"

.text

.globl main

# void main(void);
main:
  la $a0, _main_str0
  addi $a1, $zero, 42
  addi $a2, $zero, 1
  jal create_person
  add $s0, $v0, $zero

  la $a0, _main_str1
  addi $a1, $zero, 70
  addi $a2, $zero, 0
  jal create_person
  add $s1, $v0, $zero

  add $a0, $s0, $zero
  jal print_person

  la $a0, _main_str2
  addi $a1, $zero, 13
  addi $a2, $zero, 1
  jal create_person
  add $s2, $v0, $zero

  add $a0, $s1, $zero
  jal print_person

  add $a0, $s2, $zero
  jal print_person

  add $a0, $s2, $zero
  jal destroy_person

  la $a0, _main_str3
  addi $a1, $zero, 28
  addi $a2, $zero, 0
  jal create_person
  add $s3, $v0, $zero

  add $a0, $s0, $zero
  jal destroy_person

  add $a0, $s1, $zero
  jal destroy_person

  add $a0, $s3, $zero
  jal print_person

  add $a0, $s3, $zero
  jal destroy_person

  li $v0, 10
  syscall

# strcpy as defined in string.h in C
strcpy:
  add $v0, $a0, $zero
  _strcpy_while0:
    lb $t0, 0($a1)
    beq $t0, $zero, _strcpy_while0_end
    sb $t0, 0($a0)
    addiu $a0, $a0, 1
    addiu $a1, $a1, 1
    j _strcpy_while0
  _strcpy_while0_end:
  sb $t0, 0($a0)
  jr $ra

# strlen as defined in string.h in C
strlen:
  addiu $v0, $zero, 0
  _strlen_while0:
    lb $t0, 0($a0)
    beq $t0, $zero, _strlen_while0_end
    addiu $v0, $v0, 1
    addiu $a0, $a0, 1
    j _strlen_while0
  _strlen_while0_end:
  jr $ra

# enum Gender { FEMALE, MALE };
# struct Person {
#   char *name;
#   int age;
#   enum Gender gender;
# };

# struct Person *create_person(char *name, int age, enum Gender gender);
create_person:
  addiu $sp, $sp, -4
  sw $ra, 0($sp)

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  addiu $sp, $sp, -4
  sw $a1, 0($sp)
  addiu $sp, $sp, -4
  sw $a2, 0($sp)
  addiu $a0, $zero, 12
  jal malloc
  lw $a2, 0($sp)
  addiu $sp, $sp, 4
  lw $a1, 0($sp)
  addiu $sp, $sp, 4
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $s0, 0($sp)
  add $s0, $v0, $zero

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  addiu $sp, $sp, -4
  sw $a1, 0($sp)
  addiu $sp, $sp, -4
  sw $a2, 0($sp)
  jal strlen
  lw $a2, 0($sp)
  addiu $sp, $sp, 4
  lw $a1, 0($sp)
  addiu $sp, $sp, 4
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  addiu $sp, $sp, -4
  sw $a1, 0($sp)
  addiu $sp, $sp, -4
  sw $a2, 0($sp)
  addiu $a0, $v0, 1
  jal malloc
  lw $a2, 0($sp)
  addiu $sp, $sp, 4
  lw $a1, 0($sp)
  addiu $sp, $sp, 4
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  sw $v0, 0($s0)

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  addiu $sp, $sp, -4
  sw $a1, 0($sp)
  addiu $sp, $sp, -4
  sw $a2, 0($sp)
  add $a1, $a0, $zero
  add $a0, $v0, $zero
  jal strcpy
  lw $a2, 0($sp)
  addiu $sp, $sp, 4
  lw $a1, 0($sp)
  addiu $sp, $sp, 4
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  sw $a1, 4($s0)
  sw $a2, 8($s0)

  add $v0, $s0, $zero
  lw $s0, 0($sp)
  addiu $sp, $sp, 4
  lw $ra, 0($sp)
  addiu $sp, $sp, 4
  jr $ra

# void print_person(struct Person const *person)
print_person:
  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 4
  la $a0, _print_person_str0
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 4
  lw $a0, 0($a0)
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 4
  la $a0, _print_person_str1
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 1
  lw $a0, 4($a0)
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 4
  la $a0, _print_person_str2
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 4
  lw $t0, 8($a0)
  beq $t0, $zero, _print_person_if0
  la $a0, _Gender_str1
  j _print_person_if0_end
  _print_person_if0:
    la $a0, _Gender_str0
  _print_person_if0_end:
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  li $v0, 4
  la $a0, _print_person_str3
  syscall
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  jr $ra

# void destroy_person(struct Person *person)
destroy_person:
  addiu $sp, $sp, -4
  sw $ra, 0($sp)

  addiu $sp, $sp, -4
  sw $a0, 0($sp)
  lw $a0, 0($a0)
  jal free
  lw $a0, 0($sp)
  addiu $sp, $sp, 4

  jal free

  lw $ra, 0($sp)
  addiu $sp, $sp, 4
  jr $ra
