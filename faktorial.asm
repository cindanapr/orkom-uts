extern printf
extern fflush
extern scanf
 
section .data
    fmtScan db "%d", 0
    fmtPrint db "%d", 10, 0
     
section .bss
 bil1 resd 1
 
section .text
    global main
         
main:
 ;input
 push bil1
 push fmtScan
 call scanf
 add esp, 8
 
 mov ecx, [bil1]  
 mov eax, 1  ;buat hasil
 
looping:
 mul ecx   ;eax=eax*ecx
 loopnz looping ;looping selama bukan nol
 
 push eax
 push fmtPrint
 call printf
 add esp, 8
 
exit:
 push 0
 call fflush
 
 mov eax, 1
 mov ebx, 0
 int 0x80
