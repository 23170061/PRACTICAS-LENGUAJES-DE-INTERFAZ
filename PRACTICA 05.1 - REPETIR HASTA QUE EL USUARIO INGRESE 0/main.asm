; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

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