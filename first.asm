section .data
    hello db 'Hello, World!', 0xA  ; '0xA' is the newline character
    len equ $ - hello              ; Calculate the length of the string

section .text
    global _start

_start:
    ; Write "Hello, World!" to stdout
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, hello      ; pointer to the string
    mov edx, len        ; length of the string
    int 0x80            ; invoke the kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    mov ebx, 0          ; exit status 0
    int 0x80            ; invoke the kernel