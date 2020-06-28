Divisao 
            mov r3, #1
            mov r2, r1
    Loop    add r3, r3, #1
            add r2, r2, r1
            cmp r2, r0
            bne Loop
            mov r0, r3
            mov pc, lr