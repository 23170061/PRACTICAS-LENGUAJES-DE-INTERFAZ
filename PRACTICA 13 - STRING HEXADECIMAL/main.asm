; LENGUAJES DE INTERFAZ
; 8 a 9 AM
; JOSE LUIS MEDINA JIMENEZ
; AGUIRRE GRIJALVA EDUARDO AGUSTIN

INCLUDE Irvine32.inc
 
.data
    numero      DWORD 1A2B3FFFh          
    cadenaHex   BYTE  8 DUP(?), 0 ; buffer para 8 caracteres
    msg         BYTE  "Cadena Hex ASCII: ", 0
 
.code
main PROC
    mov eax, numero ; eax sera el valor a convertir
    mov edi, OFFSET cadenaHex ; edi nos apunta el inicio del buffer de texto
    
    call BinToHexASCII                  
 
    ; mostrar resultado
    mov edx, OFFSET msg
    call WriteString
    
    mov edx, OFFSET cadenaHex ; edx apunta a la cadena ya convertida
    call WriteString
    call Crlf
 
    exit
main ENDP
 
BinToHexASCII PROC
    pushad ; guardamos todos los registros
    mov ecx, 8 ; contador de 8 digitos hexadecimales de 32 bits
 
CicloHex:
    rol eax, 4 
    mov bl, al ; movemos el byte bajo a BL para no modificar eax
    and bl, 0Fh ; solo valores de 0 a 15
 
    cmp bl, 9 ; compara si el digito es menor o igual a 9
    jbe EsNumero ; si es 0-9 salta a EsNumero
    
    ; Si es de 10 a 15 (A - F):
    add bl, 37h ; 10 + 37h (55) = 41h ('A' en ASCII)
    jmp GuardarDigito
 
EsNumero:
    ; Si es de 0 a 9:
    add bl, 30h ; 0 + 30h (48) = 30h ('0' en ASCII)
 
GuardarDigito:
    mov [edi], bl ; guardar el caracter ascii
    inc edi ; avanza a la siguiente posicion
    loop CicloHex 
 
    mov BYTE PTR [edi], 0 ; agregar el valor nulo al final
    popad ; restaura los registros 
    ret
BinToHexASCII ENDP
 
END main