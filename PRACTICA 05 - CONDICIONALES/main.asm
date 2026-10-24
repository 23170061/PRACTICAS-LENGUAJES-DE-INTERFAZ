; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 05 - CONDICIONALES
; Descripción: creamos un codigo para verificar el formato de una cadena 
;			   evaluando cada caracter con comparaciones y 
;			   saltos para determinar si el formato es valido o invalido


INCLUDE Irvine32.inc

.data
	msgIngresar BYTE "Ingrese la cadena: ", 0
	msgError BYTE "FORMATO INVALIDO", 0
	msgValido BYTE "FORMATO VALIDO", 0

	cadena BYTE 8 DUP(0)
	
.code
main PROC
	
	; pedimos la cadena
	mov edx, OFFSET msgIngresar
	call WriteString ; desplegamos mensaje

	mov edx, OFFSET cadena ; direccion del buffer
	mov ecx, SIZEOF cadena ; cantidad de bytes a leer

	call ReadString ; leemos el texto
	call Crlf

	mov edx, OFFSET cadena
	call WriteString
	call Crlf

validarLetra: 
	mov ESI, 0 ; primera posicion en los caracteres
	mov AL, cadena[ESI]
	cmp AL, 'A' ; se compara con la letra a para validar
	jb invalido

	cmp AL, 'Z' ; comparamos el caracter 
	ja invalido ; compara si el codigo ascii es mayor que z

validarGuion:
	mov ESI, 3 ; evaluamos el 4to caracter
	mov AL, cadena[ESI]
	cmp AL, '-' ; revisamos si existe el guion
	jne invalido

valido: 
	mov edx, OFFSET msgValido
	call WriteString
	jmp fin
	
invalido:
	mov edx, OFFSET msgError
	call WriteString
	jmp fin

fin:
	exit
main ENDP

END main