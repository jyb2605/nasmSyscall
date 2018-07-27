section .data
file: db '/etc/passwd', 0
endline: db 10, 0

section .bss
buf: resb 11


section .text
global _start

_start:
;syscall open
	mov	eax, 0x05	; read
	mov	ebx, file	; file name
	mov	ecx, 0		; read only flag 
	mov	edx, 0		; mode
	int	80h		; system call
;syscall read
	mov	ebx, eax	; fd number
	mov	eax, 0x3	; read
	mov	ecx, buf	; buffer in bss
	mov	edx, 0xa	; count
	int	80h

; syscall write
	mov	eax, 0x4	; write
	mov	ebx, 0x1	; fd, standard out
	mov	ecx, buf	; user buffer
	mov	edx, 0xd	; count
	int	80h		

; syscall write endline
	mov     eax, 0x4        ; write
        mov     ebx, 0x1        ; fd, standard out
        mov     ecx, endline	; user buffer
        mov     edx, 0x2        ; count
        int     80h



; syscall exit
	xor	ebx, ebx
	mov	eax, 1
	int	80h



