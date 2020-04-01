.global lab2
.syntax unified

#define A #4
#define B #6
#define C #5

//   (a + b)/2 + c!
lab2:
    push {lr}
    mov r0, A
    mov r1, B
    mov r2, C
    add r0, r0, r1 // r0 = a + b
    asr r0, r0, #1 // r0 = (a + b) / 2
    // r2 = c!
    cmp r2, #0
    it eq
    moveq r2, #1
    cmp r2, #1
    beq factorial_end
    // not executed for c in (0, 1)
    mov r3, r2   // r3 = c
loop:
    sub r3, r3, #1   // r3 -= 1
    mul r2, r2, r3   // r2 = r2 * r3
    cmp r3, #1
    bne loop
factorial_end:
    add r0, r0, r2
    pop {pc}
