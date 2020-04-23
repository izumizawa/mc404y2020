// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Compare with zero first
	@R0
	D=M
	@ZERO
	D;JLE
	@R1
	D=M
	@ZERO
	D;JLE
// Compare with one
	@R0
	D=M-1
	@RZERO
	D;JEQ
	@R1
	D=M-1
	@RUM
	D;JEQ
// Save R0 in another register
	@R0
	D=M
	@R4
	M=D
(LOOP)
	@R4
	D=M
	@R0 
	M=D+M // R4 = R0+R4
	@R1
	D=M
	M=D-1 // R1 = R1-1
	@R1
	D=M-1 
	@END
	D;JLE // R1 = 0 exit loop
	@LOOP
	0;JMP // BACK TO THE LOOP 
(ZERO)
	@R0
	D=0
	M=D
	@R1
	M=0
	@END
	0;JMP
(RZERO)
	@R1
	D=M
	@R0
	M=D
	@END
	0;JMP
(RUM)
(END)
	@R0
	D=M
	@R2
	M=D
	@END
	0;JMP