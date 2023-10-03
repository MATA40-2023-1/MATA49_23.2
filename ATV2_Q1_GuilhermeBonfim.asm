; ATIVIDADE PRÁTICA 2 - QUESTÃO 1

; Guilherme dos Santos Bonfim - 221115981

; nasm -f elf64 main.asm && gcc main.o -o main -no-pie && ./main

section .bss
    nome_dig resb 256
    achado resb 1
    
section .data
    Nome_usuario db "Digite o nome: ", 0
    Letra_Desejada db "Digite uma letra para a busca: ", 0
    letra_um db " %c", 0
    name_usuario db "%s", 0
    posicao_da_letra db "A primeira letra do nome: %c", 10, "A última letra do nome: %c", 10, 0
    mensagem_final db "A letra '%c' está no nome '%s'.", 10, 0
    nao_achou db "A letra '%c' não está no nome '%s'.", 10, 0

section .text
global main
extern scanf
extern printf

    main:
        push rbp
        mov rbp, rsp

        mov rdi, Nome_usuario
        call printf

        mov rdi, name_usuario
        mov rsi, nome_dig
        call scanf

        mov rdi, Letra_Desejada
        call printf

        mov rdi, letra_um
        mov rsi, achado
        call scanf

        mov rsi, [nome_dig]
        mov rax, nome_dig

    procurar_letra:
        inc rax
        cmp byte [rax], 0x0
        jne procurar_letra
        mov rdx, [rax-1]
        mov rdi, posicao_da_letra
        call printf

        mov rax, nome_dig-1
        mov bl, byte [achado]

    achado_dois:
        inc rax
        cmp byte [rax], 0x0
        je sem_letra_no_nome
        cmp byte [rax], bl
        jne achado_dois

    letra_no_nome:
        mov rdi, mensagem_final
        mov rsi, [achado]
        mov rdx, nome_dig
        call printf
        jmp return

    sem_letra_no_nome:
        mov rdi, nao_achou
        mov rsi, [achado]
        mov rdx, nome_dig
        call printf

    return:
        leave
        ret
