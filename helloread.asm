segment .data
    msg db 'Hello '
    panjang equ $-msg
segment .bss
    inta resd 4
segment .text
    global main
main:
    ;read  input asm
    mov eax, 3
    mov ebx, 0
    mov ecx, inta
    mov edx, 4
    int 0x80
     
    ;write  print Hello
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, panjang
    int 0x80
     
    ;write  print asm
    mov eax, 4
    mov ebx, 1
    mov ecx, inta
    mov edx, 4
    int 0x80
     
    ; exit(0)
    mov eax, 1
    mov ebx, 0
    int 0x80
