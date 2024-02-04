%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1
%define NEWLINE 0xa

%macro PROLOUGE 0
        push rbp
        mov rbp, rsp
%endmacro

%macro EPILOGUE 0
        pop rbp
        ret
%endmacro

section .text
global _start
        
_start:
        mov rbp, rsp
.exit:
        mov rax, SYS_EXIT
        syscall

strlen:
        ; arguments:
        ;    in -> QWORD pointer to string
        ;    out -> QWORD length
        PROLOUGE                ; pushes rbp, and sets rbp to rsp
        mov rsi, [rbp + 16 + 8] ; load pointer from arguments
        mov rax, 0              ; zero counter
.loop:
        cmp BYTE [rsi], 0       ; check if the end is reached
        je .return
        inc rax
        inc rsi
        jmp .loop
.return:
        mov [rbp + 16], rax
        EPILOGUE

; Local Variables:
; mode: nasm
; End:
