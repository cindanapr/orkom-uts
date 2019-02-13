extern printf
extern fflush
extern scanf
  
segment .data
in1 db "%d %d %d %d", 0
out1 db "%d",0xa,0
inta dd 4
A db "A",10,0
B db "B",10,
C db "C",10,0
D db "D",10,0
E db "E",10,0

  
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
    
    mov ebx,80
    cmp eax, ebx
    JAE L1
    
    mov ebx,60
    cmp eax, ebx
    JAE L2
    
    mov ebx,50
    cmp eax, ebx
    JAE L3
    
    mov ebx,40
    cmp eax, ebx
    JAE L4
    
    mov ebx,0
    cmp eax, ebx
    JAE L5
    
    L1:
		push A
		call printf
		add esp,4
		JMP exit 
		
	L2:
		push B
		call printf
		add esp,4
		JMP exit 
		
	L3:
		push C
		call printf
		add esp,4
		JMP exit 
		
	L4:
		push D
		call printf
		add esp,4
		JMP exit 
	
	L5:
		push E
		call printf
		add esp,4
		JMP exit 

      
exit:
	push 0
	call fflush
	add esp,4
    mov eax, 1
    mov ebx, 0 
    int 0x80
