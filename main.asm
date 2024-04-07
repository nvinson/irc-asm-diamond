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
extern ircd_stoi
extern ircd_draw_row
        
_start:
        mov rbp, rsp

        ; check if argc <= 1
        cmp QWORD [rsp], 1
        jle .exit_failure
       
        ; load up diamond size and call stoi
        mov rdi, [rsp + 16] ; argv[1]
        mov rsi, error
        call ircd_stoi
        mov rdi, rax ; move return value into rdi
        
.exit:
        mov rax, SYS_EXIT
        syscall

.exit_failure:
        mov rax, SYS_EXIT
        mov rdi, 1
        syscall

section .bss

error: resd 1
