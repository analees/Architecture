; 
; Base Author:  Megan Avery Spring 2024
; Exercise Author: [YOUR NAME HERE]
; 
; Purpose - to learn about the following:
; 	- comments
;	- dumping registers
;	- printing empty lines
;	- instructions: mov, add, sub, inc/dec

%include "asm_io.inc"

; initialized data
segment .data

; uninitialized data
segment .bss


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
        ; dump_regs 1
        ; call print_n1
        ; dump_regs 2

        ; mov eax, 0
        ; mov ah, 18
        ; mov al, 0BAH
        ; dump_regs 1
        ; mov ax, 4
        ; dump_regs 2

        ; mov eax, 3
        ; mov ebx, 4
        ; add eax, ebx

        ; dump_regs 1

        ; mov eax, 40
        ; dump_regs 1
        ; call print_n1
        ; mov ebx, 2
        ; dump_regs 2
        ; call print_n1
        ; add eax, ebx
        ; dump_regs 3
        ; call print_n1

        ;mov eax, 34
        ;sub eax,19 ;immediate operand
        ;dump_regs 1

        mov eax , 16
        dump_regs 1
        call print_nl

        sub eax, 4
        dump_regs 2
        call print_nl

        mov ebx,eax
        dump_regs 3
        call print_nl

        inc ebx
        dump_regs 4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        mov ebx, 4

        add ebx, ebx ; 2*4=8(2a)
        add ebx, ebx ; 2*8=16(4a)

        mov ecx, ebx ;2*16 =32 (8a)

        add ebx, ecx ;16+32 =48 (12a)

        dump_regs 1






     



        

        		; TODO: add code

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


