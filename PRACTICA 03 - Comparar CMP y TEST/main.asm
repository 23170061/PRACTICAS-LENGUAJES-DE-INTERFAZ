; Materia: Lenguajes de Interfaz - Alumno: Aguirre Grijalva Eduardo Agustin
; Horario: 8-9 AM
; Docente: Dr. José Luis Medina Jiménez 
; Práctica: PRACTICA 03 - COMPARACION Y PRUEBA
; Descripción: empleamos cmp y test para jugar con distintos valores,
; y revisar las banderas que se encienden dependiendo los valores comparados

INCLUDE Irvine32.inc

.code
main PROC

	; condicion 1: ZERO FLAG
	; mov EBX, 1
	; cmp ebx, 1
	; call dumpRegs

	; mov EAX, 01h
	; call dumpRegs
	; cmp EAX, EBX

	mov ECX, 0
	mov cl, 1111111b
	cmp cl, cl ; activa zeroflag ya que se resta a si mismo el registro y queda el residuo 0
	call dumpRegs
	
	; condicion 2: SIGN FLAG
	mov EAX, 0 ; limpiamos registros
	mov EBX, 0 ; limpiar registros

	mov al, -5
	mov bl, 1
	cmp al, bl ; se activa dicha bandera ya que el bit de hasta la izquierda es 1
	call dumpRegs

	; CONDICION 3: CARRY FLAG
	mov EAX, 0
	mov EBX, 0

	mov al, 255
	add al, 1
	; se activa carryflag porque al no caber ese bit de mas en 255, el noveno bit se acarrea hacia afuera y activa carryflag

	call dumpRegs

	; CONDICION 4: OVERFLOW FLAG
	mov EAX, 0
	mov EBX, 0

	mov al, -128
	mov bl, 1

	cmp al, bl ; activa of porque esta fuera del rango -129, desbordandose
	call dumpRegs

	; CASO 5: TEST
	
	mov EAX, 0
	
	mov EAX, 5 ;00000101 bits
	test eax, 1 

	; 00000101 bits
	; -
	; 00000001 bits
	;-----------------
	; 00000001 bits

	call dumpRegs
	
	; ----------------
	; agreagar por que se activa la sing flag en este test
	; se activa la sign flag ya que el bit mas alto tiene un valor de uno, intel determina que el bit esta encendido y enciende la bandera 
	mov EAX, 0
	mov al, 10000000b
	test al, al

	call dumpRegs


	exit
main ENDP

END main