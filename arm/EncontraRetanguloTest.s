vetor			DCD		10, 1, 2, 2, 4, 4, 3, -3, 1, 1
tam				EQU		5
				
				
				mov		r1,#tam
				adr		r0,vetor
				BL		EncontraRetangulo
				
				END
				
EncontraRetangulo
				STMFD	SP!, {r4, r5, r6, r7, r8, r9, r10, r14} ; salvar na pilha
				;		Zerar os registradores no inicio
				LDR		r6, [r0]
				LDR		r7, [r0, #4]
				SUB		r6, r6, #1
				SUB		r7, r7, #1
				ADD		r8, r6, #2
				ADD		r9, r7, #2
				;		Salvar os parametros antes de entrar nas funcoes
				MOV		r4, r0 ; vetor
				MOV		r5, r1 ; N
Loop
				LDR		r2, [r4] ; x do ponto em r0
				LDR		r3, [r4, #4] ; y do ponto em r1
				MOV		r0, r6 ; x do inferior
				MOV		r1, r7 ; y do inferior
				BL		AjustaBordaInfEsq ; chama a funcao
				MOV		r6, r0 ; salva o x do inferior
				MOV		r7, r1 ; salva o y do inferior
				
				LDR		r2, [r4] ; x do ponto
				LDR		r3, [r4, #4] ; y do ponto
				MOV		r0, r8 ; x do superior
				MOV		r1, r9 ; y do superior
				BL		AjustaBordaSupDir ; chama a funcao
				MOV		r8, r0 ; salva o x do superior
				MOV		r9, r1 ; salva o y do superior
				
				ADD		r4, r4, #8
				SUBS		r5, r5, #1 ; descrementa N
				BGT		Loop ; volta pro Loop
				;FimRetangulo
				MOV		r0, r6 ; x do inferior
				MOV		r1, r7 ; y do inferior
				MOV		r2, r8 ; x do superior
				MOV		r3, r9 ; y do superior
				LDMFD	SP!, {r4, r5, r6, r7, r8, r9, r10, r14} ; devolver da pilha
				MOV		PC, LR ; voltar na instrucao seguinte a chamada
				
AjustaBordaInfEsq
				CMP		r0, r2 ; comparar x do ponto e x do inferior
				SUBGE	r0, r2, #1
				CMP		r1, r3 ; comparar y do ponto e y do inferior
				SUBGE	r1, r3, #1
				
				MOV		PC, LR ; voltar na instrucao seguinte a chamada
				
AjustaBordaSupDir
				CMP		r0, r2 ; comparar x do ponto e x do inferior
				ADDLE	r0, r2, #1
				CMP		r1, r3 ; comparar y do ponto e y do inferior
				ADDLE	r1, r3, #1
				
				MOV		PC, LR ; voltar na instrucao seguinte a chamada
