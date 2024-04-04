; Part 5.3: itoa+

bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10

  mov al, 108  ; The hard-coded input integer ranged from 0 to 255 inclusive
  call itoa

done:
  jmp done

itoa:
  ; Set up the stack to temporarily hold the digits
  mov bx, 10    ; Converting integer to ASCII
  
  ; Ensure DI points to the end of buffer space to fill backwards
  lea di, buffer + 3  ; Assume max 3 digits for 0-255
  
  ; Add null terminator in advance
  mov byte [di], '$'

  ; Convert number to ASCII in reverse order
.more_digits:
  xor dx, dx    ; Clear dx for div
  div bx        ; Divide ax by 10, result in ax, remainder in dx
  add dl, '0'   ; Convert remainder to ASCII
  dec di        ; Move di backwards to fill digits correctly
  mov [di], dl  ; Store ASCII digit
  test ax, ax   ; Check if quotient is zero
  jnz .more_digits  ; If not, continue processing
  mov si, di    ; Point si to the start of the ASCII string

  ; Print the string
.print_char:
  lodsb         ; Load byte at ds:si into al, increment si
  cmp al, '$'   ; Check for string terminator
  je .finish    ; End of string
  mov ah, 0x0e  ; Prepare for teletype output
  int 0x10      ; Print al
  jmp .print_char

.finish:
  ret

buffer:
  resb 4  ; Reserve space for up to 3 digits + null terminator + padding