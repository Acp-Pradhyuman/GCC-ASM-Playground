global sum3
global sum2

extern scanf             ; declare external function

section .data
    input_fmt db "%ld", 0 ; format string for scanf

section .text

; sum3(long a, long b, long c, long d);
sum3:
    push ebp
    mov ebp, esp

    ; contents of stack
    ; ebp                   -> esp
    ; ret addr
    ; a
    ; b
    ; c
    ; d

    mov eax, [esp + 8]
    add eax, [ebp + 12]
    add eax, [ebp + 16]
    add eax, [ebp + 20]

    pop ebp
    ret

sum2:
    push ebp
    mov ebp, esp
    sub esp, 12                  ; space for two local integers (a, b)

    call get_eip
get_eip:
    pop esi                     ; ESI = current instruction address (PC)

    ; calculate address of input_fmt relative to ESI
    lea edi, [esi + input_fmt - get_eip]  ; EDI = &input_fmt (PIC)

    ; -------- First scanf ----------
    lea eax, [ebp - 4]          ; address of 'a'
    push eax
    push edi                    ; format string "%ld"
    call scanf
    add esp, 8

    ; -------- Second scanf ----------
    lea eax, [ebp - 8]          ; address of 'b'
    push eax
    push edi                    ; format string "%ld"
    call scanf
    add esp, 8

    ; -------- third scanf ----------
    lea eax, [ebp - 12]          ; address of 'b'
    push eax
    push edi                    ; format string "%ld"
    call scanf
    add esp, 8

    ; -------- Add a and b ----------
    mov eax, [ebp - 4]
    add eax, [ebp - 8]
    add eax, [ebp - 12]

    mov esp, ebp
    pop ebp
    ret