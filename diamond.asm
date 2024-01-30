%define SYSCALL_WRITE 1
%define SYSCALL_EXIT 60
%define STDOUT 1

section .text
global _start
_start:
  mov rax, SYSCALL_EXIT
  mov rdi, 0
  syscall
