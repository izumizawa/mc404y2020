while (1==1){
	scanf("%d", &kdb);
	if (kdb == 0) {
		for (int i=0; i<8191; i++) {
			tela[i]=0;
		}
	}
	else if (kdb != 0) {
		for (int i=0; i<8191; i++) {
			tela[i]=1;
		}
	}
}

/* 
------------------- Original:

(LOOP)
	@KDB
	D=M
	@BRANCO
	D;JEQ
	@SCREEN
	M=-1
	@FORA
	0;JMP
(BRANCO)
	@SCREEN
	M=0
(FORA)
	@SCREEN
	A=A+1
	@LOOP
	O;JMP
*/

/* 
---------------------- Última:

(LOOP)
@16384
D=A
@tela
M=D
	@KDB // Keyboard
	D=M
	@BRANCO
	D;JEQ // Jump to whitening condition
	@PRETO
	0;JMP // Else Jump to blackning condition
(BRANCO)
	@tela
	A=M
	D=M
	@24575
	D=A-D
	@FORA
	D;JLE
	@tela
	A=M
	M=0 // "White" pixel
	@tela
	M=M+1
	@BRANCO
	0;JMP // Back to white loop
(PRETO)
	@tela
	A=M
	D=M
	@24575
	D=A-D
	@FORA
	D;JLE
	@tela
	A=M
	M=-1 // "Black" pixel
	@tela
	M=M+1
	@PRETO
	0;JMP // Back to white loop
(FORA)
	@LOOP
	0;JMP // Return to loop
*/