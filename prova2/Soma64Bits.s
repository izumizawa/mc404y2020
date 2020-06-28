			adr		r0, zerou
			adr		r1, uno
			adr		r2, dos
			adr		r3, tres
			bl		Soma64Bits
			END
			
Soma64Bits	stmfd	sp!, {r4-r12,lr}
			adds		r0, r0, r2
			blvc		semOverflow
			adc		r1, r1, r3
			bl		fim
semOverflow	add		r1, r1, r3
			ldmfd	sp!, {r4-r12,lr}
			mov		pc, lr
			
			
zerou		equ		0b11111111
uno			equ		0b11111111
dos			equ		0b00000000
tres			equ		0b11111110
