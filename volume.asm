global main

extern scanf
extern fflush
extern printf

section .data
		nilai db '%d %d %d',0
		hasil db '%d',0
		
		
section .bss
		p resd 1
		l resd 1
		t resd 1

section .text

main:
		push p
		push l
		push t
		push nilai
		call scanf
		add esp, 16
		
		mov eax, [p]
		mov ebx, [l]
		mov ecx, [t]
		
volume:
		mul dword [l]
		push eax
		mul dword [t]
		push eax
		push hasil
		call printf
		add esp, 12
		jmp exit

exit: 
		push 0
		call fflush
		add  esp, 4
		
		mov eax, 1
		mov ebx, 0
		int 0x80
		
		

