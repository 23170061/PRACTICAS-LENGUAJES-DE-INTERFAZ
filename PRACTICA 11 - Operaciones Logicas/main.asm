; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 11 - Operaciones Logicas 
; Descripción: programa donde se usan operaciones logicas para invertir o modificar
;			   los bits de una direccion de memoria


INCLUDE Irvine32.inc

.data

.code
main PROC
	; 0 - encendido de computadora
	; 1 - alarma
	; 2 - conectado
	; Estado inicial: 00000101

	; 1.- AND: EXTRAER EL ESTADO DE ENCENDIDO
	mov eax, 0
	mov ebx, 0

	mov al, 00000101b
	mov bl, al
	and bl, 00000001b
	nop

	call dumpRegs
	nop

	; 2.- OR: ENCENDER ALARMA
	mov al, 00000101b
	or al, 00000010b

	call dumpRegs
	nop

	; 3.- XOR: DESCONECTAR Y CONECTAR COMPUTADORA
	mov al, 00000101b
	xor al, 00000100b ; desconectamos invirtiendo el bit de 1 a 0
	call dumpRegs
	nop

	xor al, 00000100b ; volvemos a conectar invirtiendo de 0 a 1
	call dumpRegs
	nop



	exit

main ENDP

END main