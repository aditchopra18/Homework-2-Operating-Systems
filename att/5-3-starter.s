# Part 5.3: itoa+

.code16       # Tell the assembler that this is 16-bit code
.globl start  # Make our "start" label public for the linker

start:
  mov $0x00, %ah # Set Video Mode to:
  mov $0x03, %al # Text, 80x25 characters
  int $0x10

  mov $105, %al    # The hard-coded input integer ranged from 0 to 255 inclusive

done:
  jmp done

itoa:
  # TODO
  ret

# This buffer might be useful
buffer: