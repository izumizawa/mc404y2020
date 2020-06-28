			;		Recebe dois numeros inteiros sem sinal e retorna a multiplicacao
			;		r0 = fator
			;		r1 = fator
			;		retorna resultado em r0
			
			mov		r0, #fator1
			mov		r1, #fator2
			bl		Multiplica
			END
			
Multiplica
			mov		r2, r0
			add		r3, r1, r1, LSL r2
			mov		r0, r3
			mov		pc, lr
			
fator1		equ		16
fator2		equ		2
