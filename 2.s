; Part 2: Print a character

bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov sp, 0x7C00
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10


; Your code for part 2 starts here
; Write down your three-step subroutine for printing a single char

mov al, 0x3E  ; Step 1: Move the ASCII value of '>' into al
mov ah, 0x0E  ; Step 2: Move the Teletype output function code into ah
int 0x10      ; Step 3: Call the interrupt handler to print the character

; End of your code for part 2

done:
  jmp done

