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
global ircd_stoi
        
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


ircd_stoi:
        ; arguments
        ;    parameters -> char*, (out) int*
        ;    return -> int
        PROLOGUE
        mov rax, 0
        mov r8, 0

.loop:
        mov r8b, [rdi]
        inc rdi
        cmp r8b, 0
        je .return

        sub r8, '0'
        cmp r8, 9
        ja .error
        imul rax, 10
        add rax, r8
        jmp .loop
        
.error:
        mov DWORD [rsi], 1
        
.return:
        EPILOGUE
        
; Local Variables:
; mode: nasm
; End:
