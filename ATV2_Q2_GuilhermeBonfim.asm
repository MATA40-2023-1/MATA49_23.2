; ATIVIDADE PRÁTICA 2 - QUESTÃO 2

; Guilherme dos Santos Bonfim - 221115981

; nasm -f elf64 main.asm && gcc main.o -o main -no-pie && ./main

section .data
    pergunta_anos db "Digite os anos: ", 0
    pergunta_meses db "Digite os meses: ", 0
    pergunta_dias db "Digite os dias: ", 0
    output db "Sua idade em dias é: %d", 10, 0
    fmt db "%d", 0

    anos dd 0
    meses dd 0
    dias dd 0
    idade_dias dd 0

section .text
    global main
    extern scanf
    extern printf

main:
      push rbp
      mov rbp, rsp
  
    prompt_dos_anos:
      mov rdi, pergunta_anos
      call printf
      mov rdi, fmt
      lea rsi, [anos]
      call scanf
      
    prompt_dos_meses:
      mov rdi, pergunta_meses
      call printf
      mov rdi, fmt
      lea rsi, [meses]
      call scanf

    prompt_dos_dias:
      ; Pedir dias
      mov rdi, pergunta_dias
      call printf
      mov rdi, fmt
      lea rsi, [dias]
      call scanf
  
    calculo_dos_dias:
      mov rax, [anos]
      imul rax, 365
      mov rbx, [meses]
      imul rbx, 30
      add rax, rbx
      add rax, [dias]
      mov [idade_dias], rax
  
    prompt_out:
      mov rdi, output
      mov rsi, [idade_dias]
      call printf
  
    return:
      pop rbp
      ret
