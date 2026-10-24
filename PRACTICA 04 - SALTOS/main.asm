; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 04 - SALTOS
; Descripción: creamos un codigo que compara con saltos 2 numeros y nos
;			   dice si son iguales o no

INCLUDE Irvine32.inc

.data
	msgDiferentes byte "son diferentes", 0
	msgIguales byte "son iguales", 0
.code
main PROC
	mov eax, 10
	mov ebx, 10
	
	cmp eax, ebx ; realiza una resta internamente con los dos numeros 

	je iguales ; si la resta es 0, quiere decir que son iguales

	mov edx, OFFSET msgDiferentes ; escribe mensaje de diferentes
	call WriteString

	jmp fin ; salta al fin
	
iguales:
	mov edx, OFFSET msgiguales ; en caso de que si sean iguales, imprime mensaje
	call WriteString

fin:
	call Crlf
	exit

main ENDP
END main
