.intel_syntax noprefix
.global main

main:
	mov rcx, 1  # i = 10

loop:
    mov r15, 15
    mov r13, 3
    mov r14, 5

    # 割り算(rdx*64 + rax) / 15 = rax ... rdx
    mov rdx, 0
    mov rax, rcx
    div r15
    cmp rdx, 0
    je print_fizzbuzz

    # 割り算(rdx*64 + rax) / 3 = rax ... rdx
    mov rdx, 0
    mov rax, rcx
    div r13
    cmp rdx, 0
    je print_fizz

    # 割り算(rdx*64 + rax) / 5 = rax ... rdx
    mov rdx, 0
    mov rax, rcx
    div r14
    cmp rdx, 0
    je print_buzz

    # 引数の順番はrdi, rsi, rdx, r10, r8, r9
    mov rdx, 2  # サイズ
    mov rsi, rcx  # ポインタ
    mov rdi, 1  # ファイルディスクリプタ
    mov rax, 1  # write
    syscall
    jmp print_new_line

next:
    inc rcx  # i--
    cmp rcx, 16
    je exit  # 0かどうかを比較->0なら抜ける
    jmp loop  # 比較結果がfalseならloopに戻る

print_fizz:
    # 引数の順番はrdi, rsi, rdx, r10, r8, r9
    mov rdx, 5  # サイズ
    lea rsi, [string_fizz]  # アドレスポインタ
    mov rdi, 1  # ファイルディスクリプタ
    mov rax, 1  # write
    syscall
    jmp next

print_buzz:
    # 引数の順番はrdi, rsi, rdx, r10, r8, r9
    mov rdx, 5  # サイズ
    lea rsi, [string_buzz]  # アドレスポインタ
    mov rdi, 1  # ファイルディスクリプタ
    mov rax, 1  # write
    syscall
    jmp next

print_fizzbuzz:
    # 引数の順番はrdi, rsi, rdx, r10, r8, r9
    mov rdx, 9  # サイズ
    lea rsi, [string_fizzbuzz]  # アドレスポインタ
    mov rdi, 1  # ファイルディスクリプタ
    mov rax, 1  # write
    syscall
    jmp next

print_new_line:
    # 引数の順番はrdi, rsi, rdx, r10, r8, r9
    mov rdx, 1  # サイズ
    lea rsi, [string_new_line]  # アドレスポインタ
    mov rdi, 1  # ファイルディスクリプタ
    mov rax, 1  # write
    syscall
    jmp next

exit:
	mov rdi, 0  # exitのstatus
    mov rax, 60  # exit
    syscall

string_fizz:
    .ascii "fizz\n"

string_buzz:
    .ascii "buzz\n"

string_fizzbuzz:
    .ascii "fizzbuzz\n"

string_new_line:
    .ascii "\n"
