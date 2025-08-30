global add_numbers        ; make the function visible to C
global sum8
global sum2

extern scanf             ; declare external function

section .data
    input_fmt db "%ld", 0 ; format string for scanf

section .text
add_numbers:
    ; Signature: long add_numbers(long a, long b)
    ; a is in rdi, b is in rsi (System V AMD64 calling convention)
    mov rax, rdi
    add rax, rsi           ; rax = a + b
    ret

sum8:
    mov rax, rdi            ; a
    add rax, rsi            ; b
    add rax, rdx            ; c
    add rax, rcx            ; d
    add rax, r8             ; e
    add rax, r9             ; f
    add rax, [rsp + 8]      ; g (7th argument on the stack)
    add rax, [rsp + 16]     ; h (8th argument on the stack)
    add rax, [rsp + 24]     ; h (9th argument on the stack)
    ret

sum2:
    ; Reserve space for local variables (a and b)
    sub rsp, 40            ; 16 bytes for locals + 8 bytes for alignment

    ; ----------- First scanf ------------
    lea rdi, [rel input_fmt] ; rdi = pointer to format string
    lea rsi, [rsp]           ; rsi = address to store first input (a)
    xor rax, rax             ; rax must be 0 for variadic functions like scanf
    call scanf               ; scanf("%ld", &a)

    ; ----------- Second scanf -----------
    lea rdi, [rel input_fmt] ; same format string
    lea rsi, [rsp + 8]       ; rsi = address to store second input (b)
    xor rax, rax             ; clear rax again
    call scanf               ; scanf("%ld", &b)

    ; ----------- third scanf -----------
    lea rdi, [rel input_fmt] ; same format string
    lea rsi, [rsp + 16]       ; rsi = address to store second input (c)
    xor rax, rax             ; clear rax again
    call scanf               ; scanf("%ld", &c)

    ; ----------- fourth scanf -----------
    lea rdi, [rel input_fmt] ; same format string
    lea rsi, [rsp + 24]       ; rsi = address to store second input (d)
    xor rax, rax             ; clear rax again
    call scanf               ; scanf("%ld", &d)

    ; ----------- Add the two values -----
    mov rax, [rsp]           ; load a
    add rax, [rsp + 8]       ; add b
    add rax, [rsp + 16]      ; add c
    add rax, [rsp + 24]      ; add d

    add rsp, 40              ; clean up stack (deallocate locals)
    ret