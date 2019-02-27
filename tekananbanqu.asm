global main

extern scanf
extern fflush
extern printf

section .data 	;kek integer
	nilai db "%d", 0
	kempes1 db "kempes", 10, 0
	pas1 db "pas", 10, 0
	keras1 db "keras", 10, 0
	
section .bss ; kek scanf
	a resd 1
	
section .text

main:
	push a
	push nilai
	call scanf
	add esp, 8
	
	mov eax, [a]
	cmp eax, 29 ; ngebandingin nilai si eax dengan 29
	jb kempes ;jb =kurang dari
	cmp eax, 35 ; ngebandingin nilai si eax dengan 35
	jbe pas ; jbe = kurang dari sama dengan
	jmp keras ; kek else, harus pake titik karena cmp pake label
	
kempes:
	push kempes1
	call printf
	add esp, 4
	jmp exit

pas:
	push pas1
	call printf
	add esp, 4
	jmp exit
	
keras:
	push keras1
	call printf
	add esp,4
	jmp exit
	
exit:
	push 0
	call fflush
	add esp, 4
	mov eax, 1
	mov ebx, 0
	int 0x80
	

	
	
