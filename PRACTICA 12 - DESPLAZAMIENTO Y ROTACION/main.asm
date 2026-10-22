; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

INCLUDE Irvine32.inc

.code
main PROC
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA
	mov al, 10000000b  ;se recorre hacia la izquierda y desaparece el bit encendido
	shl al, 1

	call DumpRegs ; muestra las banderas
	call Writebin


	; 2 - SHR: DESPLAZAR UNA POSICION A LA DERECHA
	mov al, 00001101b  ;desaparece el ultimo bit ya que se recorre a la derecha
	shr al, 1

	call DumpRegs
	call writebin

	; 3 - SAR: CONSERVAR EL SIGNO
	mov al, -8
	sal al, 1

	call writebin
	call dumpregs

	; 4 - SAR: CON OPERACIONES NO EXACTAS
	mov al, -9
	sar al, 1

	call DumpRegs
	call writebin

	; 5 - CONTEO: DESPLAZAR 2 BITS HACIA LA IZQUIERDA CON CONSTANTE (valor directo)
	mov al, 00001111b
	shl al, 2
	
	call DumpRegs
	call writebin

	; 6 - DESPLAZAR 2 BITS HACIA LA DERECHA UTILIZANDO CL (asignamos valor al registro cl y desplazamos)
	mov al, 00001111b
	mov cl, 2
	shr al, cl

	call DumpRegs
	call writebin

	; 7 - ROR, ROL, RCL, RCR    -- ROTACIONES 
	mov al, 00001111b
	rcl al, 1

	call DumpRegs
	call writebin

	; 8 - ROL: ROTAR A LA IZQUIERDA (el bit mas significativo pasa al final)
	mov al, 10000001b
	rol al, 1

	call DumpRegs
	call Writebin

	; 9 - ROR: ROTAR A LA DERECHA (el ultimo bit pasa al inicio)
	mov al, 10000001b
	ror al, 1

	call DumpRegs
	call Writebin

	; 10 - RCR: ROTAR A LA DERECHA A TRAVES DEL CARRY (carry pasa al inicio)
	stc ; enciende la bandera Carry (CF = 1)
	mov al, 00000001b
	rcr al, 1

	call DumpRegs
	call Writebin

	exit

main ENDP

END main