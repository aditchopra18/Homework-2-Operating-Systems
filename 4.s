; Part 4: Echo with storage and print
bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10

; Initialize buffer pointer
  mov bx, buffer  ; BX will point to the start of the buffer

read_loop:
  mov ah, 0x00     ; Function code for reading a keypress
  int 0x16         ; BIOS keyboard interrupt
  mov [bx], al     ; Store the character in the buffer
  inc bx           ; Move the buffer pointer to the next position
  
  cmp al, 0x0D     ; Check if the Enter key (carriage return) was pressed
  je print_buffer  ; If Enter was pressed, jump to print the buffer

  jmp read_loop    ; Otherwise, loop back to read another character

print_buffer:
  dec bx           ; Go back one byte to avoid printing the Enter key
  mov cx, bx       ; CX will count down the number of characters to print
  sub cx, buffer   ; Calculate the length of the buffer
  mov bx, buffer   ; Reset BX to the start of the buffer

print_loop:
  mov al, [bx]     ; Move the next character from the buffer into AL
  mov ah, 0x0E     ; Function code for teletype output
  int 0x10         ; BIOS video interrupt to print the character
  inc bx           ; Move the buffer pointer to the next character
  loop print_loop  ; Decrement CX, and keep printing if CX is not zero

  ; Print newline after printing buffer
  mov al, 0x0D     ; Carriage return
  int 0x10         ; Print it
  mov al, 0x0A     ; Line feed
  int 0x10         ; Print it

done:
  jmp done         ; Loop indefinitely when done

buffer:
  resb 256         ; Reserve 256 bytes for the buffer
