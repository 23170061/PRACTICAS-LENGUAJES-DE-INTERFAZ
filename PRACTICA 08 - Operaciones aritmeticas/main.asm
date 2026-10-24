; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 08 - Operaciones aritmeticas
; Descripción: ejercicio donde vemos como funcionan las operaciones aritmeticas 
; suma, resta, multiplicacion y otro tipo de multipliacion y division que permite 
; guardar el resultado en algun registro o direccion indicada,
; con numeros positivos y negativos guardando resultados en los registros


INCLUDE Irvine32.inc

.data

.code
main PROC
	; 1. ADD: SUMA DE VALORES EN REGISTROS
	mov eax, 15
	mov ebx, 10

	add eax, ebx ; eax = 15 + 10 = 25

	nop

	; 2. SUB: RESTA DE VALORES EN REGISTROS
	mov eax, 50
	mov ebx, 20

	sub eax, ebx ; eax = 50 - 20 = 30

	nop

	; 3. MUL: MULTIPLICACION DE VALORES EN 8 BITS
	mov al, 5
	mov bl, 4

	mul bl ; al * bl = 20, el resultado de 16 bits se guarda en AX

	nop

	; 4. MUL: MULTIPLICACION DE VALROES DENTRO DE 32 BITS

	mov eax, 25
	mov ebx, 3

	mul ebx

	nop

	; 5. MUL: PRODUCTO QUE NECESITA MAS DE 32 BITS

	mov eax, 65537
	mov ebx, 65537

	; 6. IMUL: MULTIPLICACION CON SIGNO

	mov eax, -5

	imul eax, eax, 3

	nop

	; 7. DIV: DIVIDENDO SIN SIGNO

	mov eax, 125
	mov edx, 0 ; representa el residuo
	mov ebx, 12

	; IDIV: DIVISION CON SIGNO

	mov eax, -125

	cdq ; extiende el signo de eax hacia edx

	mov ebx, 12

	idiv ebx ; eax contiene el cociente, edx el residuo

	nop
	exit
main ENDP

END main