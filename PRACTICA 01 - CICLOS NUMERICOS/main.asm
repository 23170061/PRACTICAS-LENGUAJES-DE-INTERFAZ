; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 01 - CICLOS NUMERICOS
; Descripción: utilizamos un ciclo con loop para imprimir los numeros 5 al 1

INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ecx, 5 ; movemos el 5 a ecx para que funcione como el contador

ciclo:
	mov eax, ecx ; copiamos el valor de ecx a eax para utilizar writedec
	call WriteDec ; escribe el numero en consola
	call Crlf ; salto de linea

	loop ciclo ; resta 1 a ecx y regresa al inicio del ciclo en caso de que siga siendo diferente de 0
	
	exit

main ENDP
END main