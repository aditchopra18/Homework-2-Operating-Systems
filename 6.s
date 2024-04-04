; Part 6: Caesar Encoding

bits 16        ; Tell the assembler that this is 16-bit code
global start   ; Make our "start" label public for the linker

start:
  mov ah, 0x00 ; Set Video Mode to:
  mov al, 0x03 ; Text, 80x25 characters
  int 0x10

  ; Prompt user for input
  mov ah, 0x0E ; Teletype function
  mov al, 'P'  ; Print 'Please enter a string: ' prompt
  int 0x10
  mov al, 'l'
  int 0x10

  call read_cmos
  xor bx, bx    ; Clear BX, which will serve as our input buffer index

read_input:
  mov ah, 0x00
  int 0x16      ; Wait for key press
  cmp al, 0x0D  ; Check if ENTER key was pressed
  je read_cmos  ; Jump to read CMOS seconds if ENTER pressed
  ; Otherwise, store the character and loop back
  mov [user_input + bx], al
  inc bx
  jmp read_input

; Subroutine to read CMOS seconds
read_cmos:
  ; Existing read_cmos code here to load the seconds into AL
  mov al, 0x00   ; Select the CMOS register for seconds (0x00)
  out 0x70, al   ; Copy address to CMOS register    
  in al, 0x71    ; Read the value from the selected register
  and al, 0x0F   ; Extract the last digit of the seconds
  ; Print the key
  mov ah, 0x0E
  add al, '0'    ; Convert to ASCII
  int 0x10


done:
  jmp done       ; When we're done, loop indefinitely

user_input:
  resb 256       ; Reserve space for user input
