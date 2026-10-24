; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 05.1 - REPETIR HASTA QUE EL USUARIO INGRESE 0
; Descripción: creamos un ciclo con el 'cmp' y usando saltos comparandolo con jnp (jump if not equal)

INCLUDE Irvine32.inc

.data
	mensaje BYTE "Numero: ", 0

	numero BYTE 8 DUP(0)

.code
main PROC
	mov ebx, 1
ciclo: 
	mov edx, OFFSET mensaje
	call WriteString

	mov edx, OFFSET numero
	mov ecx, SIZEOF numero

	call ReadString
	call Crlf

	mov edx, OFFSET numero
	call WriteString
	call Crlf

	mov eax, ebx
	inc ebx

	cmp numero, '0' ; compara el valor ingresado con el 0

	jne ciclo ; si no es igual a 0, se repite el ciclo
	exit

exit
main ENDP

END main