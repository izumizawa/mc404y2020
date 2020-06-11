; código do menor
        ldr r2, [r0]
        mov r3, #0
loop    ldr r4, [r0, #4]!
        cmp r2, r4
        ble endIf
        mov r2, r4
        bal endIf
endIf   add r3, r3, #1
        cmp r3, r1
        bne loop