%include "asm_io.inc"

segment .data                   ; initialized data
first_player db "Player 1 R,P,S,L,K (K means Spock)?: ", 0
second_player db "Player 2 R,P,S,L,K(K means Spock)?: ", 0
tie db "It's a tie!", 0
player1_wins db "Player 1 Wins!", 0
player2_wins db "Player 2 Wins!", 0

segment .bss  
;reserves for byte-size variables                 
player1 resb 1
player2 resb 1  

segment .text                   
    global asm_main
asm_main:
    enter 0, 0                  ; setup routine
    pusha

    mov eax, first_player
    call print_string
    call read_char
    mov [player1], al

    mov eax, second_player
    call print_string
    call read_char      ;need to consume the second line character before moving forward
    call read_char 
  
    mov [player2], al  

    mov al, [player1]
    cmp al, [player2]
    ;jump not equal(jne)
    jne not_a_tie ; jump if false
    mov eax, tie ; then block
    call print_string   
    jmp end   

    ;we jumped to not_a_tie since it didn't match the comparison done before where I checked if it was a tie

not_a_tie:
    cmp al, "R"         ;compare the entry to R
    je rock_scissors    ;if equal jump to rock scissors

    cmp al, "S"         ;compare the entry to S
    je scissors_paper   ;if equal jump to scissors_paper

    cmp al, "P"         ;compare the entry to P
    je paper_rock       ;if equal jump to paper_rock

    cmp al, "L"         ;compare the entry to L
    je lizard_spock   ;if equal jump to lizard_spock

    cmp al, "K"         ;compare the entry to K
    je spock_scissors   ;if equal jump to spock_scissors


 
    jmp end             ; jump to end
    
    ;if the comparisons are accurate in this case then PLAYER 1 won

rock_scissors:
    cmp dword [player2], "S"        ;if player 2 entered S and player 1 R then player 1 wins
    mov eax, player1_wins
    call print_string
    jne rock_lizard                 ;we jump to rock_lizard since it the only other condition player 1 could win if they enter rock first
    jmp end

rock_lizard:
    cmp dword [player2],"L"         ;if player 2 entered L and player 1 R then player 1 wins
    mov eax, player1_wins
    call print_string
    jne rock_paper                   ;we jump to rock_paper since it's one of the conditions in which player 2 could win if player 1 enter rock first
    jmp end
    

scissors_paper:
    cmp dword [player2], "P"        ;if player 2 entered P and player 1 S then player 1 wins
    mov eax, player1_wins
    call print_string
    jne scissors_lizard             ;we jump to scissors_lizard since it the only other condition player 1 could win if they enter S first
    jmp end

scissors_lizard:
    cmp dword [player2], "L"        ;if player 2 entered L and player 1 S then player 1 wins
    mov eax, player1_wins
    call print_string
    jne scissors_rock                ;we jump to scissors_rock since it's one of the conditions in which player 2 could win if player 1 enter S first
    jmp end


paper_rock:
    cmp dword [player2], "R"        ;if player 2 entered R and player 1 P then player 1 wins
    mov eax, player1_wins
    call print_string
    jne paper_spock                 ;we jump to paper_spock since it the only other condition player 1 could win if they enter P first
    jmp end

paper_spock:
    cmp dword [player2], "K"        ;if player 2 entered K and player 1 P then player 1 wins
    mov eax, player1_wins
    call print_string
    jne paper_scissors               ;we jump to paper_scissors since it's one of the conditions in which player 2 could win if player 1 enter P first
    jmp end

lizard_spock:
    cmp dword [player2], "K"        ;if player 2 entered K and player 1 L then player 1 wins
    mov eax, player1_wins
    call print_string
    jmp end
    jne lizard_paper                ;we jump to lizard_paper since it the only other condition player 1 could win if they enter L first
    jmp end

lizard_paper:
    cmp dword [player2], "P"        ;if player 2 entered P and player 1 L then player 1 wins
    mov eax, player1_wins
    call print_string
    jmp end
    jne lizard_rock                 ;we jump to lizard_rock since it is a condition which player 2 could win if player1 enter L first
    jmp end

spock_scissors:
    cmp dword [player2], "S"        ;if player 2 entered S and player 1 K then player 1 wins
    mov eax, player1_wins
    call print_string
    jmp end
    jne spock_rock                  ;we jump to spock_scissors since it the only other condition player 1 could win if they enter K first
    jmp end

spock_rock:
    cmp dword [player2], "R"        ;if player 2 entered R and player 1 K then player 1 wins
    mov eax, player1_wins
    call print_string
    jne spock_paper                 ;we jump to spock_paper since it is a condition which player 2 could win if player1 enter K first
    jmp end

    ;if the comparisons are accurate in this case then PLAYER 2 won

rock_paper:
    cmp dword [player2], "P"        ;if player 2 entered P and player 1 R then player 2 wins
    je player2wins_block
    jne rock_spock
    jmp end

rock_spock:
    cmp dword[player2],"K"          ;if player 2 entered K and player 1 R then player 2 wins
    je player2wins_block
    jmp end

lizard_rock:
   cmp dword[player2],"R"           ;if player 2 entered R and player 1 L then player 2 wins
    je player2wins_block
    jne lizard_scissors
    jmp end

lizard_scissors:
    cmp dword[player2],"S"          ;if player 2 entered L and player 1 S then player 2 wins
    je player2wins_block
    jmp end

paper_scissors:
    cmp dword[player2],"S"          ;if player 2 entered S and player 1 P then player 2 wins
    je player2wins_block
    jne paper_lizard
    jmp end

paper_lizard:
    cmp dword[player2],"L"          ;if player 2 entered L and player 1 P then player 2 wins
    je player2wins_block
    jmp end

spock_paper:
    cmp dword[player2],"P"         ;if player 2 entered P and player 1 K then player 2 wins
    je player2wins_block
    jne spock_lizard
    jmp end

spock_lizard:
    cmp dword[player2],"L"          ;if player 2 entered L and player 1 K then player 2 wins
    je player2wins_block
    jmp end

scissors_rock:
    cmp dword[player2],"R"          ;if player 2 entered R and player 1 S then player 2 wins
    je player2wins_block
    jne scissors_spock
    jmp end

scissors_spock:
    cmp dword[player2],"K"          ;if player 2 entered K and player 1 S then player 2 wins
    je player2wins_block
    jmp end


    ;Winning printing blocks

player1wins_block:              ;this block prints the player 1 wins
    mov eax, player1_wins
    call print_string
    jmp end

player2wins_block:               ;this block prints the player 2 wins
    mov eax, player2_wins
    call print_string
    jmp end  

end:
    popa
    mov eax, 0       ; return back to C
    leave
    ret