; https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md
; exit
section .text
    global add_rdi

add_rdi:
    add rdi, 20
    ret