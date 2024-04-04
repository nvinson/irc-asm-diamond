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

global ircd_strlen
global ircd_ctoi
        
ircd_strlen:
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

ircd_ctoi:
        ; arguments:
        ;    parameters -> ASCII char, out int
        ;    return -> int
        PROLOGUE
        mov rax, rdi
        sub rax, '0'
        cmp rax, 9
        jle .return
        mov BYTE [rsi], 1
.return:
        EPILOGUE
        
; Local Variables:
; mode: nasm
; End:
