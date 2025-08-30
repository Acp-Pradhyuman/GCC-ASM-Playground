; https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md
; exit
section .text
    global _start
    extern add_rdi

_start:
    mov rax, 0x3c   ; 60
    mov rdi, 27     ; rdi carries arg (for exit it's int error code)
    call add_rdi

    syscall