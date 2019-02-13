extern printf
extern fflush
extern scanf
  
segment .data
in1 db "%d %d %d %d", 0
out1 db "%d",0xa,0
inta dd 4
  
segment .bss
a resb 4
b resb 4
c resb 4
d resb 4
  
segment .text
global main
  
main:
    push a
    push b
    push c
    push d
    push in1
    call scanf
    add esp,20 ; ngepush sebanyak 5 kali
      
    mov eax, [a]
    mov ebx, [b]
    mov ecx, [c]
    mov edx, [d]
    add eax, ebx
    add eax, ecx
    add eax, edx
     
    cdq
    div dword [inta]
     
    push eax
    push out1
    call printf
    add esp,8
      
    push 0
    call fflush
    add esp,4
      
exit:
    mov eax, 1
    mov ebx, 0 
    int 0x80
