# Part 5.2: itoa

.code16       # Tell the assembler that this is 16-bit code
.globl start  # Make our "start" label public for the linker

start:
  mov $0x00, %ah # Set Video Mode to:
  mov $0x03, %al # Text, 80x25 characters
  int $0x10

  mov $5, %al    # The hard-coded single-digit input integer ranged from 0 to 9 inclusive

done:
  jmp done

digit_to_char:
  # TODO
  ret
