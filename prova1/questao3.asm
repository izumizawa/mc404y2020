@1000
D = A
@address // address começa na posição de memória 1000 e é o endereço do tempo
M = D

(LOOP1) // Verificação de que passou das 9:45
    @945
    D = A
    @address
    A = M 
    D = D-M 
    @LOOP2
    D; JLE // Sai do loop de "cedo demais"
    @address
    M = M+1
    @LOOP1
    0; JMP

(LOOP2) // Verificação de que passou das 10:45
    @1045
    D = A 
    @address
    A = M 
    D = D-M 
    @END
    D; JLE // Sai do loop por ser "tarde demais"
// Caso não tenha passado das 10:45, itera o número de pessoas e o endereço do tempo
    @R0
    M = M+1
    @address
    M = M+1
    @LOOP2
    0;JMP

(END)
    @END
    0; JMP
