			adr		r0, vetor
			mov		r2, #tamanho
			bl		TotalizaVetor
			END
			
TotalizaVetor	stmfd	sp!, {r4-r12, lr}
			mov		r4, #0
			mov		r9, r0
			mov		r5, r2
Loop			ldr		r2, [r9] ; vetor como segundo parametro
			ldr		r3, [r9, #4] ; segunda parte do vetor
			mov		r0, r7 ; somatorio
			mov		r1, r8 ; somatorio
			bl		Soma64Bits ; chamada da funcao
			mov		r7, r0 ; guarda valor
			mov		r8, r1 ; guarda valor
			add		r9, r9, #8 ; itera o vetor
			add		r4, r4, #1 ; itera o laco
			cmp		r4, r5
			bne		Loop ; volta ao laco
			mov		r0, r7 ; somatorio como retorno
			mov		r1, r8 ; somatorio
			ldmfd	sp!, {r4-r12, lr}
			mov		pc, lr
			
vetor		dcd		10, 20, 30, 40, 50, 60, 70, 80, 37, 26, 45, 12, 0, 2, 100
tamanho		equ		15
