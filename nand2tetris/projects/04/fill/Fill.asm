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

@24576
D=A
@variavel
M=D
(LOOP)
	@KBD // Keyboard
	D=M
	@BRANCO
	D;JEQ // Jump to whitening condition

(PRETO)
@16384
D=A
@i
M=D

(LOOP3)
	@i
	D=M
	@variavel
	D=M-D // D=24576-16384=8192
	@FORA
	D;JLE

	@i
	A=M
	M=-1 // "Black" pixel
	@i
	M=M+1
	@LOOP3
	0;JMP // Back to white loop

(BRANCO)
@16384
D=A
@i
M=D

(LOOP2)
	@i
	D=M // D=what in that address 16384
	@variavel
	D=M-D // D=24575-16384=8191
	@FORA
	D;JLE

	@i
	A=M
	M=0 // "White" pixel
	@i 
	M=M+1
	@LOOP2
	0;JMP // Back to white loop


(FORA)
	@LOOP
	0;JMP // Return to loop