// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
// ()   ()   
// ( @ . @) /* 
// (  () ) /

(LOOP)
@16834
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