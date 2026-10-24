; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

INCLUDE Irvine32.inc

.data
	msgIngresar BYTE "Ingrese la cadena: ", 0
	msgError BYTE "FORMATO INVALIDO", 0
	msgValido BYTE "FORMATO VALIDO", 0

	cadena BYTE 8 DUP(0)
	
.code
main PROC

	mov edx, OFFSET msgIngresar
	call WriteString

	mov edx, OFFSET cadena
	mov ecx, SIZEOF cadena

	call ReadString
	call Crlf

	mov edx, OFFSET cadena
	call WriteString
	call Crlf

validarLetra: 
	mov ESI, 0
	mov AL, cadena[ESI]
	cmp AL, 'A'
	jb
	ja 'Z'
	je validarGuion

	inc ESI
	jmp validar

validarGuion:
	mov ESI, 3
	mov AL, cadena[ESI]
	cmp AL, '-'
	je validarNum

	jz invalido

invalido:


	exit
main ENDP

END main