; vetor
mov r11, #800
mov r5, #3
str r5, [r11, #4]!
mov r6, #7
str r6, [r11, #4]!
mov r7, #9
str r7, [r11, #4]!
mov r8, #2
str r8, [r11, #4]!
mov r9, #17
str r9, [r11, #4]!
mov r10, #6
str r10, [r11, #4]!

mov r0, #804
mov r1, #5
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