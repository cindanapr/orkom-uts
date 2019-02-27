extern printf
extern fflush
extern scanf
 
section .data
    fmtScan db "%d", 0
    fmtPrint db "%d",10,0
    mat      dd 17, 14, 24, 11, 18
          dd 21, 6, 14, 19, 25
           dd 10, 2, 20, 12, 7
           dd 3, 15, 23, 5, 1
           dd 8, 4, 9, 16, 2
     
section .bss
 a resd 1
 
section .text
    global main
         
main:
 ;input
 push a
 push fmtScan
 call scanf
 add esp, 8
 
 mov eax,[a]
 mov ebx, 24
 mul ebx
 mov ebx, [mat+eax]
 
 push ebx
 push fmtPrint
 call printf
 add esp, 8
 
 
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80
