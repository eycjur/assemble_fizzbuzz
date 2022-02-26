.intel_syntax noprefix
.global main

main:
	mov rcx, 10  # i = 10

loop:
    # 引数の順番はrdi, rsi, rdx, r10, r8, r9
    mov rdx, 12  # サイズ
    lea rsi, [string]  # アドレスポインタ
    mov rdi, 1  # ファイルディスクリプタ
    mov rax, 1  # write
    syscall

    dec rcx  # i--
    jz exit  # 0かどうかを比較->0なら抜ける
    jmp loop  # 比較結果がfalseならloopに戻る

exit:
	mov rdi, 0  # exitのstatus
    mov rax, 60  # exit
    syscall

string:
    .ascii "Hello world\n"
