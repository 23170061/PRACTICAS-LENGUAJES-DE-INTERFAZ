; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

INCLUDE Irvine32.inc

.data
	nombreArchivo BYTE "inventario.txt", 0 ;nombre del archivo donde se guardarán los datos
	texto BYTE "125", 0 ; dato a guardar
	archivoHandle DWORD ? ; manejador de archivos

	mensajeExito BYTE "Archivo guardado.", 0
	mensajeError BYTE "ERROR. No se guardó el archivo correctamente.", 0
.code
main PROC
	; 1. CREAR EL ARCHIVO
	mov edx, OFFSET nombreArchivo ; va a la primera posicion de nombreArchivo, toma la direccion y escribe el nombre del archivo
	call CreateOutputFile

	cmp eax, INVALID_HANDLE_VALUE ; verificame si ese valor al crear el archivo corresponde a un valor invalido que identifique el error
	je error 

	mov archivoHandle, eax ; guardamos el identificador guardado en eax generado a partir del CreateOutputFile

	; 2. ESCRIBIR TEXTO ('125')
	mov eax, archivoHandle ; almacenar el id de nuestro archivo
	mov edx, OFFSET texto
	mov ecx, SIZEOF texto - 1 ; ponemos - 1 para no incluir el cero en la cadena
	call WriteToFile

	jc errorEscritura ; verificamos si la bandera carryflag (CF) se activo y determina si hay error
	
	; determinar si se escribio correctamente en el archivo
	cmp eax, SIZEOF texto - 1 ; comparamos el tamaño de texto con eax ya que contiene la longitud de bytes escritos
	jne errorEscritura

	; 3. CERRAR ARCHIVO TXT
	mov eax, archivoHandle
	call CloseFile

	test eax, eax ; verifica si eax = 0 para determinar si hay error o no, activando la zeroFlag
	jz error

	mov edx, OFFSET mensajeExito
	call WriteString
	jmp fin

errorEscritura:
	mov eax, archivoHandle 
	call CloseFile 
error:
	mov edx, OFFSET mensajeError
	call WriteString
fin:
	exit

	exit
main ENDP

END main