; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

INCLUDE Irvine32.inc
 
.data
    msgPedir    BYTE "Cantidad recibida: ", 0
    msgErr      BYTE "Entrada invalida. Intente de nuevo.", 0Dh, 0Ah, 0
    msgExistencia      BYTE "Existencia actual: ", 0
    msgUnid     BYTE " unidades.", 0Dh, 0Ah, 0
 
    cantidadRecibida DWORD ?
    existenciaActual DWORD ?
    buffer           BYTE 10 DUP(0)
    outBuffer        BYTE 10 DUP(0)
 
.code
main PROC
pedir:
    mov edx, OFFSET msgPedir
    call WriteString
 
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString ; eax = cantidad de caracteres leidos

    cmp eax, 1 
    jl error ; revisamos que no sea menor a 1 en caso de que ingresen una cantidad vacia
    cmp eax, 2
    jg error ; comparamos si es mayor a 2 digitos la cantidad ingresada
 
    mov esi, OFFSET buffer
    mov ecx, eax               ; contador del bucle tomado de la longitud
    xor ebx, ebx               ; acumulado igual a 0
 
validarYconvertir:
    movzx eax, BYTE PTR [esi] ; carga byte actual en al y llenamos con 0
 
    ; Validar rango 0 a 9
    cmp al, '0' ; compara si el valor en ASCII es igual a 0 del caracter 0
    jb error ; salta a error en caso de que sea cero
    cmp al, '9' ; compara el valor en ascii
    ja error ; si el valor es mayor a 9 se va a error
 
    sub al, '0' ; convertimos char a numero 
    imul ebx, ebx, 10 ; valor acumulado en ebx * 10
    add ebx, eax ; sumamos el nuevo digito 
   
    inc esi ; avanzamos al siguiente caracter dek buffer
    loop validarYconvertir ; decrementa ecx para el ciclo
 
    ; rango 1 a 99
    cmp ebx, 1
    jl error
    cmp ebx, 99
    jg error
 
    
    mov cantidadRecibida, ebx ; guardamos el numero entero en la variable
    mov eax, ebx 
    add eax, 25 ; sumamos la existencia
    mov existenciaActual, eax 

    mov edx, OFFSET msgExistencia
    call WriteString
 
    mov eax, existenciaActual 
    mov edi, OFFSET outBuffer ; usamos edi para construir el texto
    call ConvertirACadena
 
    mov edx, OFFSET outBuffer ; direccion con la cadena convertida
    call WriteString
    mov edx, OFFSET msgUnid
    call WriteString
 
    exit
 
error:
    mov edx, OFFSET msgErr
    call WriteString
    jmp pedir
 
main ENDP

ConvertirACadena PROC
    mov ebx, 10
    xor ecx, ecx ; ecx = 0, contador de digitos que se guarda en la pila
extraer:
    xor edx, edx ; edx = 0
    div ebx ; divide edx (eax/10)
    add dl, '0' ; convierte el residuo eb codigo ascii
    push dx 
    inc ecx
    test eax, eax ; verifica si el cociente es 0
    jnz extraer ; si el cociente no es 0, continua extrayendo digitos
escribir:
    pop dx
    mov [edi], dl; escribimos el caracter ascii en la posicion actual de outbuffer señalada por edi
    inc edi
    loop escribir
    mov BYTE PTR [edi], 0 ; agregamos el byte nulo para marcar el fin de la cadena
    ret 
ConvertirACadena ENDP
 
END main
 