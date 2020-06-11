mov r2, #400
mov r3, #1
str r3, [r2, #4]!
str r3, [r2, #4]!

        mov r4, #2
        cmp r0, r4
        bgt else
        mov r1, #1
        bal endIf
else    mov r4, #2
loop    ldr r5, [r2]
        ldr r6, [r2, #-4]
        add r1, r5, r6
        str r1, [r2, #4]!
        add r4, r4, #1
        cmp r4, r0
        bne loop
endIf