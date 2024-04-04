; Part 5.2: itoa

bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10

  mov al, 5      ; The hard-coded single-digit input integer ranged from 0 to 9 inclusive
  call digit_to_char   
done:
  jmp done

digit_to_char:
  ; TODO
  add al, '0'    ; Convert the integer to ASCII
  mov ah, 0x0e   ; Prepare for teletype output
  int 0x10       ; Print the character in AL
  ret