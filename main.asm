# inicializando as variaveis 
addi $s1, $zero, 0	 # contador (N)
addi $s0, $zero, 0   # Soma (acumulador da soma)

# Print "Digite N: "
addi $sp, $sp, -9  # reserva um espaço para "digite n: "

addi $t0, $zero, 68  # 'D'
sb $t0, 0($sp)
addi $t0, $zero, 105 # 'i'
sb $t0, 1($sp)
addi $t0, $zero, 103 # 'g'
sb $t0, 2($sp)
addi $t0, $zero, 105 # 'i'
sb $t0, 3($sp)
addi $t0, $zero, 116 # 't'
sb $t0, 4($sp)
addi $t0, $zero, 101 # 'e'
sb $t0, 5($sp)
addi $t0, $zero, 32  # ' '
sb $t0, 6($sp)
addi $t0, $zero, 78  # 'N'
sb $t0, 7($sp)
addi $t0, $zero, 0   # nulo
sb $t0, 8($sp)

addi $a0, $sp, 0    # salvou o argumento no a0
addi $v0, $zero, 51  # syscall para printar string
syscall
addu $s1, $zero, $a0   # contador (N atual)

bne $s1, $zero, loop # se o valor que está em $s1 for diferente de 0, ele execulta o loop

# calculando a soma no loop
loop:
    beq $s1, $zero, done # se o valor contido em $s1 for igual a 0, ele sai do loop

    # soma o N atual a soma
    add $s0, $s0, $s1

    # decrementa o N
    addi $s1, $s1, -1

    j loop

done:

# Print "soma ="
addi $sp, $sp, -8  # reserva um espaço para "soma ="

addi $t0, $zero, 83 # 's'
sb $t0, 0($sp)
addi $t0, $zero, 111 # 'o'
sb $t0, 1($sp)
addi $t0, $zero, 109 # 'm'
sb $t0, 2($sp)
addi $t0, $zero, 97  # 'a'
sb $t0, 3($sp)
addi $t0, $zero, 32  # ' '
sb $t0, 4($sp)
addi $t0, $zero, 61  # '='
sb $t0, 5($sp)
addi $t0, $zero, 32  # ' '
sb $t0, 6($sp)
addi $t0, $zero, 0   # nulo
sb $t0, 7($sp)

addi $a0, $sp, 0    # salvou a mensagem no $a0 
addi $a1, $s0, 0	# valor atual da soma
addi $v0, $zero, 56  # syscall para printar a string 
syscall
