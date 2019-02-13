extern printf
extern fflush
extern scanf
  
segment .data
in1 db "%d %d %d %d", 0
out1 db "%d",0xa,0
inta dd 4
lulus db "lulus", 10,0
tidak db "tidak",10,0
  
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
    
    mov ebx,40
    cmp eax, ebx ; cmp fungsi untuk membandingkan
    JAE L1 ; lebih besar samadengan
    JB L2 ; kurang dari
    
    L1:
		push lulus ; kalo lebih dari sama dengan 40 print lulus
		call printf
		add esp,4
		JMP exit ; abis print lulus langsung masuk ke exit
	L2:
		push tidak ; kalo kurang dari 40 print tidak lulus
		call printf
		add esp,4
     
      
exit:
	push 0
	call fflush
	add esp,4
    mov eax, 1
    mov ebx, 0 
    int 0x80
