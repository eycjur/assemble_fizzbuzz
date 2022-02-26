# syscallの番号
# https://www.mztn.org/lxasm64/x86_x64_table.html

.intel_syntax noprefix
.global main

main:
    mov eax, 60
    syscall
