; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 04.1 - MAYOR, MENOR O IGUAL CON ENTRADA DEL USUARIO
; Descripción: codigo que pide dos numeros al usuario y 
;			   compara con saltos como jg, jl y je para devolver si el 
;			   primero es mayor, menor o igual al segundo

INCLUDE Irvine32.inc

.data
	msgNum1  BYTE "Ingrese el primer numero: ", 0
	msgNum2  BYTE "Ingrese el segundo numero: ", 0

	msgMayor BYTE "el primer numero es mayor que el segundo", 0Dh, 0Ah, 0
	msgMenor BYTE "primer numero es menor que el segundo", 0Dh, 0Ah, 0
	msgIgual BYTE "son iguales", 0Dh, 0Ah, 0

.code
main PROC
	mov edx, OFFSET msgNum1
	call WriteString ; mostramos mensaje para pedir el primer numero

	call ReadInt ; leemos el numero ingresado
	mov ebx, eax ; se guarda para no perderse

	mov edx, OFFSET msgNum2 ; mostramos mensaje para pedir el segundo numero
	call WriteString 

	call ReadInt ; lee el segundo numero y lo guarda en eax

	cmp ebx, eax ; realiza la resta para determinar con las banderas activadas

	je iguales ; jump if equal, en caso de que haya dado 0 la resta interna
	jg mayor ; jump if greater, salta si es mayor el primer numero
	jl menor ; jump if less, salta si es menor el primer numero

mayor:
	mov edx, OFFSET msgMayor 
	call WriteString ; mostramos en consola el mensaje
	jmp fin ; saltamos al fin

menor:
	mov edx, OFFSET msgMenor 
	call WriteString 
	jmp fin 

iguales:
	mov edx, OFFSET msgIgual  
	call WriteString             

fin:
	call Crlf                  
	exit                         

main ENDP
END main