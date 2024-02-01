; Base Author: Megan Avery Spring 2024
; Exercise Author: Analeee Maharaj
; 
; Purpose - to learn about the following:
;	-  directives (dx, resx, & times)
;	- printing ints and characters
;	- dumping memory
;	- printing strings
;	- reading chars and ints

%include "asm_io.inc"

age equ 30 ;symbol

%define fav_number 14; macro

; initialized data
segment .data
; fav_color db "purple", 0 ;string
; least_fav_color db "yellow", 0 ;string

 greeting db "Hello World!", 0 ;string

 char_prompt db "Enter a character: ", 0
int_prompt db "Enter an integer: ", 0

many_numbers times 15 dd 34
character times 5 db "Z"

; number dd 65 ;integer
; letter db "A" ;character

; first_letter db "A"

; first_letter_ascii dd 65

; uninitialized data
segment .bss
space_for_int resd 1 ;space for 1 integer


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

        ;mov eax, [first_letter_ascii] ; eax=65

        ;call print_int
        ;call print_nl
        ;call print_char
        ;mov eax, fav_color + 3
        ; mov eax, greeting
        ; call print_string
        ; call print_nl
        ; dump_mem 1, greeting, 0

        ; mov eax, char_prompt
        ; call print_string
        ; call read_char

        ; mov eax, int_prompt
        ; call print_string
        ; call read_int

        dump_mem 1, characters, 0
        call print_nl
        dump_mem 2, characters +3 ,0


        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
