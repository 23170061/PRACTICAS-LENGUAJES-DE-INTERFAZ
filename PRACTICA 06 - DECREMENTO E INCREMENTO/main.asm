; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 06 - DECREMENTO E INCREMENTO
; Descripción: empleamos ciclos tipo while y do while, incrementando y decrementando valores
;			   usando un cmp para el while para evaluar si se cumplio la condicion, usando un 
;			   jg (jump if greater than) entonces si excede la condicion, se sale

INCLUDE Irvine32.inc

.data

.code
main PROC
	; ciclo while con incremento
	mov ebx, 0 ;valor inicial para incrementar

ciclo_while:
	cmp ebx, 100 ;condicion de salida
		
	jg fin_while ;salto a finalizar el codigo cuando se cumpla la condicion de salida

	mov eax, ebx ;se copia el valor de EBX a EAX para desplegarlo en consola
	call WriteDec ;despliega en consola el numero que va incrementando
	call crlf ;salto de linea

	inc ebx ;realiza el incremento de +1 en el registro señalado (EBX)

	jmp ciclo_while ;salto sin condicion para repetir el codigo mientras no se siga cumpliendo la condicion de salida
fin_while:

	; ciclo do while con incremento
	mov ebx, 1 ;valor inicial para el ciclo DO WHILE (valor que incrementa)

ciclo_dowhile:
	mov eax, ebx ;movemos el valor al imprimir al registro de lectura de WRITEDEC
	call WriteDec ;se imprime en consola el valor actual antes de incrementar
	call crlf ;salto de linea

	inc ebx ;se realiza el incremento de +1 en el registro EBX

	cmp ebx, 100 ;condicion de salida para finalizar el codigo. Cumple una funcion como un DO WHILE
	jle ciclo_dowhile ;salto condicional al bloque de codigo del ciclo.

	exit
main ENDP

END main