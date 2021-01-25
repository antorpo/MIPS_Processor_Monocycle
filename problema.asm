.data
contador: .word 400, 4, 28, 428, 468, 508, 548
vector: .word -934, 80, 71, 819, -945, -469, 762, 790, 120, -718, -999, -310, 647, -345, -847, -762, -584, 407, -574, -678, -583, -137, -66, -350, -422, 580, 370, 717, 311, 54, 0, 251, 261, -979, -208, -806, 596, 215, 468, 298, -195, 644, -371, 464, 25, 784, 763, -992, -320, 516, -751, 284, 381, 53, -881, 306, 966, 635, -174, -737, -194, 353, 59, -739, 535, -906, 193, 994, -132, -693, -50, 559, -883, 91, -529, 140, -173, 866, 148, -28, -28, -159, 278, -419, -989, -561, -121, 110, -636, -171, 889, 281, 783, 816, -651, 436, 500, -509, -895, 17
MayoresFila: .space 40 # 4 bytes * 10
MenoresFila: .space 40
MayoresColumna: .space 40
MenoresColumna: .space 40
tope: .word 36

.text

# Cargamos los parametros para llamar un procedimiento:
add $a0, $zero, $zero # numf
add $a1, $zero, $zero # numc 
jal contarMatriz

j finalPrograma

##########################################################
# Procedimiento contarMatriz
# Utilidad: Calcula el numero mayor y menor de las filas
# y columans dentro de una matriz 10x10
# Entrada: 
# $a0 - contador de la fila
# $a1 - contador de la columna
contarMatriz:

	add $t0, $zero, $zero # contador = 0
	lw $t1, 0($zero) # cargamos en $t1 el numero 400 que es el tope.
	lw $t2, 4($zero) # cargamos en $t2 el numero 4 que sera el valor del incremento.
	lw $t3, 8($zero) # direccion base del vector.
	lw $t4, 12($zero) # direccion base del vector MayoresFila.
	lw $t5, 16($zero) # direccion base del vector MenoresFila.
	lw $t6, 20($zero) # direccion base del vector MayoresColumna.
	lw $t7, 24($zero) # direccion base del vector MenoresColumna.
	
	add $s0, $t3, $zero # copia direccion base del vector.
	add $s1, $t4, $zero # copia direccion base del vector MayoresFila.
	add $s2, $t5, $zero # copia direccion base del vector MenoresFila.
	add $s3, $t6, $zero # copia direccion base del vector MayoresColumna.
	add $s4, $t7, $zero # copia direccion base del vector MenoresColumna.
	
	loop:	beq $t0, $t1, endLoop
	
		# if (vector[i] < mfila[numf])  (Menores fila)
		add $s0, $t3, $t0  # obtenemos el indice para buscar en el vector.
		lw $t8, 0($s0) # cargamos vector[i]
		
		add $s2, $t5, $a0 # obtenemos el indice para buscar en mfila
		lw $t9, 0($s2) # cargamos mfila[numf] 
	
		slt $s5, $t8, $t9 # Si vector[i] < mfila[numf]
		
		beq $s5, $zero, endPrimerIf # Si $s5 == 0 no se cumplio el if
		sw $t8, 0($s2) # guardamos el valor de $t8 en donde esta $t9
		
		endPrimerIf:
		
		 # if( vector[i] > Mfila[numf] ) (Mayores fila)
		 add $s1, $t4, $a0 # obtenemos el indice para buscar en MFila
		 lw $t9, 0($s1) # cargamos MFila[numf]
		 
		 slt $s5, $t9, $t8 # Si Mfila[numf] < vector[i]
		 
		 beq $s5, $zero, endSegundoIf
		 sw $t8, 0($s1) # guardamos el valor de $t8 en donde esta $t9
		 
		 endSegundoIf:
		 
		 # if (vector[i] < mcolumna[numc]) (Menores columna)
		 add $s4, $t7, $a1 # obtenemos el indice para buscar en mcolumna
		 lw $t9, 0($s4) # cargamos mcolumna[numc]
		 
		 slt $s5, $t8, $t9 # Si vector[i] < mcolumna[numc]
		 
		 beq $s5, $zero, endTercerIf 
		 sw $t8, 0($s4) # guardamos el valor de $t8 donde esta $t9
		 
		 endTercerIf:
		 
		 # if( vector[i] > Mcolumna[numc]) (Mayores columna)
		 add $s3, $t6, $a1 # obtenemos el indice para buscar en Mcolumna
		 lw $t9, 0($s3) # cargamos Mcolumna[numc]
		 
		 slt $s5, $t9, $t8 # Si Mcolumna[numc] < vector[i]
		
		 beq $s5, $zero, endCuartoIf
		 sw $t8, 0($s3) # guardamos el valor de $t8 en donde esta $t9
		 
		 endCuartoIf:
		 
		 add $a1, $a1, $t2 # numc = numc + 4
		 
		 #  if( numc == 9) 588
		 lw $s6, 588($zero) # cargo el valor 36 de la memoria
		 
		 beq $a1, $s6, quintoIf
		 j endQuintoIf
		 
		 quintoIf:
		 	add $a1, $zero, $zero # numc = 0
		 	add $a0, $a0, $t2 # numf = numf + 4
		 endQuintoIf:
		 
		add $t0, $t0, $t2 # contador++
		j loop
	endLoop: 
	
	jr $ra
	
finalPrograma:
add $s7, $zero, $zero