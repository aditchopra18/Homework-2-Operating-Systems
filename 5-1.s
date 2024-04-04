; Part 5.1: atoi

bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10

  mov si, num1
  mov cl, 2
  call atoi
  mov ah, 0x0e
  int 0x10

  mov si, num2
  mov cl, 3
  call atoi
  mov ah, 0x0e
  int 0x10

done:
  jmp done

; Add your own comments to answer questions on lines marked with 'Q:'
atoi:           ; Q: What registers should be set by the caller of this
                ;    subroutine? What are they used for?
                ; A: The caller should set "si" to point to the 
                ; start of the ASCII string to be converted and "cl" to the length 
                ; of the string. "si" is used for loading the ASCII characters from the string, 
                ; and "CL" determines how many characters to process.
  xor al, al
  mov bh, 10
  .loop:
    mul bh      ; Q: What does this do? Explain it in terms of registers.
                ; A: It multiplies register "al" by "bh" .
    mov bl, al
    lodsb       ; Q: Where does lodsb read the byte from? Explain it in terms
                ;    of registers.
                ; A: It reads a byte from the memory's location referenced by "si" and increments "si".
                ; It should be loading the next ASCII character of the string.
    sub al, 48  ; Q: What does 48 mean in this context? Why do we subtract here?
                ; A: It references to the character "0". We substract it from "al" to convert it 
                ; to its numerical equivalent.
    add bl, al
    mov al, bl  ; Q: What do we have in 'al' after this line?
                ; A: After both of these statements, it contains the answer of numerical equivalent of 
                ; current digit + previous result * (10).
    loop .loop
  ret           ; Q: Where is the return value stored? Name the register.
                ; A: It is set in "al" register.

num1:
  db `42`  ; *

num2:
  db `109` ; m
