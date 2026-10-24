; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 02 - CAPTURA Y DESPLEGADO DE MENSAJE
; Descripción: leemos un mensaje mediante readString y lo mostramos en consola con writeString

INCLUDE Irvine32.inc

.data
	mensaje BYTE "Escribe tu nombre: ", 0 ; variable con el mensaje

	nombre BYTE 15 DUP(0) ; variable para el nombre con tamaño de 15 bytes

.code
main PROC
	mov edx, OFFSET mensaje ; movemos el mensaje a edx para imprimir el mensaje
	call WriteString ; funcion que escribe el mensaje

	mov edx, OFFSET nombre ; indicamos el movimiento de bytes en edx para nombre
	mov ecx, SIZEOF nombre

	call ReadString ; leemos la cadena
	call Crlf ; salto de linea

	mov edx, OFFSET nombre
	call WriteString ; imprimimos el nombre
	call Crlf

	exit
main ENDP

END main