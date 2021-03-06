SECTION .data
  ; Prime constant
  prime dq 0xA171020315130201

SECTION .text
  DEFAULT REL

  ; Slash
  GLOBAL _slash
  _slash:
    ; Initialize variables

    ; result
    xor rax, rax

    ; prime
    mov r8, qword [prime]

    ; current
    mov rdx, rdi
    xor rcx, rcx
    mov cl, byte [rdx]

    ; Initial condition
    cmp cl, 0
    je .return

    ; Main Loop
    .slashLoop:
      ; XOR result with current byte
      xor rax, rcx

      ; Multiply result and prime
      imul rax, r8

      ; Rotate right by 7
      ror rax, 7

      ; Loop logic
      add rdx, 1
      mov cl, byte [rdx]
      cmp cl, 0
      jne .slashLoop

    ; Return
    .return:
      ret
