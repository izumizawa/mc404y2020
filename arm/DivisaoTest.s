; Recebe dois numeros inteiros sem sinal e retorna a divisao
; r0 = dividendo
; r1 = divisor
; retorna quociente em r0

			mov		r0, #dividendo
			mov		r1, #divisor
			bl		Divisao
			END

Divisao 
            mov r3, #1
            mov r2, r1
    Loop    add r3, r3, #1
            add r2, r2, r1
            cmp r2, r0
            bne Loop
            mov r0, r3
            mov pc, lr

dividendo   equ 16
divisor     equ 2