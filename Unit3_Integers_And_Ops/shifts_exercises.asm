; Base Author: Megan Avery Spring 2024
; Exercise Author: [YOUR NAME HERE]

; Purpose - to learn the following:
; 	- logical shifts
;	- arithmetic shifts
;	- rotate shifts

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

	; mov eax,10
        ; shl eax,3 ;shift to left eax by 3
        ; call print_int ;10 * 2^3 = 80
        ; call print_nl

        ; mov eax,23
        ; shr eax,2 ;shift right eax by 2
        ; call print_int ;23 / 2^2 =5
        ; call print_nl

        ;AND Instruction
        ; 1 1 0 0
        ;and
        ;1 0 1 0
        ;equal
        ;1 0 0 0

        ;TEST operation
        mov eax, 4 ;  0100
        mov ebx,2  ;  0010
        test eax,ebx ;test represents and
        dump_regs 1

        ;zero out  the whole register
        mov eax,12
        xor eax,eax ;this zeros out the register because matching numbers = 0 => 1 1 0 1 , 1 1 0 1 == 0 0 0 0 
        call print_int

        ;calculate the one's completemnt (flips all the bits == NOT)

        ;TURNING ON A SPECIFIC BIT
        mov ebx, 1
        shl ebx, 2

        mov eax, 11
        or eax, ebx
        call print_int ; eax will go from 11 to 4 as the 2nd number represents 2^2 which is 11+4 =15
        call print_nl

        ;TURNING OFF A SPECIFIC BIT (use NOT & AND)

        mov ebx,1
        shl ebx, 3

        not ebx
        mov eax,15
        and eax,ebx 
        call print_int
        call print_nl


        ;ZEROING OUT THE TOP 16 BITS OF EAX
         mov ebx, 00000FFFFH
         mov eax, -1

         and eax,ebx
         dump_regs 1

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


