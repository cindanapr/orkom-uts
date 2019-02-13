global main 
extern fflush
extern printf
extern scanf

section .data
	msg db "%d %d %d",0
	nilai db "%d",10,0
	
section .bss
	a resd 4
	b resd 4
	c resd 4
	
section .text
main :
	push c
	push b
	push a
	push msg
	call scanf
	add esp ,16
	
	mov eax ,[a]
	mov ebx ,[b]
	mov ecx ,[c]
	
	cmp eax,ebx
	JGE ebx1
	JMP L2
ebx1 :
	cmp eax,ecx
	JGE L1
	JMP L2

L1: 
	mov edx,3
	JMP ecx1
L2:
	mov edx,1

	
ecx1:
	push edx
	push nilai
	call printf 
	add esp ,4
	
exit:
    push 0
    call fflush
    add esp, 4
    mov eax, 1
    mov ebx, 0
    int 0x80
