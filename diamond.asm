%define SYS_WRITE 1
%define SYS_EXIT 60
%define STDOUT 1
%define NEWLINE 0xa

%macro PROLOGUE 0
        push rbp
        mov rbp, rsp
%endmacro

%macro EPILOGUE 0
        mov rsp, rbp
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
        ;    parameters -> pointer to string
        ;    return -> length
        PROLOGUE
        mov rax, 0
.loop:
        cmp BYTE [rdi], 0
        je .return
        inc rax
        inc rdi
        jmp .loop
.return:
        EPILOGUE

ctoi:
        ; arguments:
        ;    parameters -> ASCII char
        ;    return -> int, error
        PROLOGUE
        mov rdx, 0
        mov rax, rdi
        sub rax, '0'
        cmp rax, 9
        jle return
        mov rdx, 1        
.return:
        EPILOGUE
        
; Local Variables:
; mode: nasm
; End:
