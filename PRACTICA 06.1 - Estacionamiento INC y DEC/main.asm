; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 06.1 - ESTACIONAMIENTO INC Y DEC
; Descripción: creamos un sistema de entrada y salida de carros a un
;			   estacionamiento con un contador de espacios que incrementa o decrementa
;			   dependiendo lo que se ingrese por teclado


INCLUDE Irvine32.inc

.data
	msgEspacio BYTE "Entro carro? ", 0
	msgLleno BYTE "No hay mas espacio en el estacionamiento. ", 0
	msgBloqueado BYTE "Espera a que salgan carros del estacionamiento.", 0
	msgEntrada BYTE "Espacios disponibles: ", 0

	entradaCarro = 1
	salidaCarro = 2

.code
main PROC
	mov ebx, 10 ;numero de espacios en el estacionamiento

entradaSalida:
	mov edx, OFFSET msgEspacio
	call WriteString ;despliega el mensaje en consola 

	call ReadInt ;pide leer numero en consola

	cmp eax, entradaCarro ;toma el numero ingresado y lo compara para ver si entra carro
	jne checarSalida ; si no es 1, salta a ver si es salida
	dec ebx ; decrementa en caso de que haya entrado carro
	jmp estado

checarSalida:
	cmp eax, salidaCarro
	jne estado ; si no es 2, salta sin modificar nada
	inc ebx ;aumenta el espacio disponible en el estacionamiento

estado:
	cmp ebx, 0 ; revisa si ya no hay lugares
	jle lleno 

	mov edx, OFFSET msgEntrada
	call WriteString
	call Crlf

	mov eax, ebx
	call writedec ; restamos el numero de espacios disponibles
	call crlf
	call crlf

	jmp entradaSalida ; salto para regresar y registrar mas carros

bloqueado:
	mov edx, OFFSET msgBloqueado
	call WriteString
	jmp fin ;saltamos al fin

lleno: 
	mov edx, OFFSET msgLleno
	call WriteString
	call Crlf
	jmp bloqueado

fin:
	exit
main ENDP

END main