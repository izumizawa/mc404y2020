		mov		r0, #12
		mov		r1, #8
		
mdc		cmp		r0, r1
		beq		fim
		blt		menor
		sub		r0, r0, r1
		bal		mdc
menor	sub		r1, r1, r0
		bal		mdc
fim
