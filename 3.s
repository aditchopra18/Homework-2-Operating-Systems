; Part 3: Print from buffer
bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10

; Your code can start here
  mov si, message          ; SI points to the start of the message
  mov cx, message_len      ; CX is the length of the message
  mov ah, 0x0E             ; Function code for teletype output

print_char:
  lodsb                     ; Load string byte at [SI] into AL, increment SI
  int 0x10                  ; Print AL
  loop print_char           ; Decrement CX, jump if not zero

done:
  jmp done                  ; Loop indefinitely when done

message:
  db 'Hello World', 13, 10  ; "message" is the address at the start of the character buffer, 13=CR, 10=LF

message_len equ $ - message ; "message_len" is a constant representing the length of the character buffer