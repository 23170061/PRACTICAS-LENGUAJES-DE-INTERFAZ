; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

INCLUDE Irvine32.inc

.data
	msgPin BYTE "Ingrese el pin: ", 0
	msgAttempts BYTE "Intentos restantes: ", 0
	msgError BYTE "Pin INCORRECTO.", 0
	msgAcceso BYTE "Acceso permitido.", 0
	msgBloqueado BYTE "Autodestruccion comenzada...", 0

	pinCorrecto = 1234

.code
main PROC
	mov ebx, 3 ;numero de intentos para ingresar

intentar:
	mov edx, OFFSET msgPin
	call WriteString ;despliega el mensaje en consola 

	call ReadInt ;pide leer numero en consola
	cmp eax, pinCorrecto ;toma el numero ingresado y lo compara para ver si el pin es correcto

	je acceso ;brincamos al acceso en caso de que sea correcto

	mov edx, OFFSET msgError
	call WriteString
	call Crlf

	dec ebx

	jz bloqueado ;brinco a bloqueado en caso de que nos quedemos sin intentos

	mov edx, OFFSET msgAttempts
	call WriteString ;muestra el mensaje de 'intentos restantes: '

	mov eax, ebx
	call WriteDec ;mostramos el numero de intentos restantes
	call Crlf

	jmp intentar

acceso:
	mov edx, OFFSET msgAcceso
	call WriteString
	call Crlf

	jmp fin ;saltamos al fin

bloqueado: 
	mov edx, OFFSET msgBloqueado
	call WriteString
	call Crlf

fin:
	exit
main ENDP

END main