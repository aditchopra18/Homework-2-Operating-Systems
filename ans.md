# Part 1 Responses

## Q1

In a 16-bit x86 system, 'cx' can store 16 bits, while 'cl' and 'ch' can store 8 bits each, as 'cx' is the full 16-bit register composed of 'cl' (lower 8 bits) and 'ch' (higher 8 bits).

## Q2

In a 32-bit x86 system, 'ecx' can store 32 bits, 'cx' can store 16 bits, and 'cl' and 'ch' can store 8 bits each, similar to the 16-bit system but with 'ecx' being the extended 32-bit version of 'cx'.

## Q3

1 byte = 8 bits

## Q4

In an x86 system, 1 byte is needed to represent an ASCII character, as ASCII characters are defined within a range (0 to 255).

## Q5

For carrying one ASCII character in a 16-bit x86 system, 'ch' or 'cl' would be sufficient as they are 8-bit registers, and an ASCII character fits into 8 bits. To carry a decimal number 95, 'ch' or 'cl' would be sufficient as 95 can be represented within 8 bits. Therefore, the answer is (A) 'ch' or 'cl'.

## Q6

At least 1 byte is needed to represent the hexadecimal number 0x67, as it falls within the range that can be represented by a single byte (0 to 255).

## Q7

The number 0x67 represents the ASCII character 'g'.

## Q8

After running the instructions:
'xor dx, dx' zeroes out 'dx', so 'dh' and 'dl' will be 0.
'mov ax, 1' sets 'ax' to 1, so 'ah' will be 0 and 'al' will be 1.
'mov bh, 4bh' sets 'bh' to 4Bh (75 in decimal).
'mov al, bh' copies 'bh' into 'al', so 'al' is now 75.
'mov cx, 0x000b' sets 'cx' to 11.
'div cx' divides 'ax' by 'cx', so 'ax' is divided by 11. With 'ax' initially set to 75 (from 'al'), the quotient will be in 'al' and the remainder in 'ah'. 
To find the exact values in 'ah', 'al', 'bh', 'cx', 'dh', and 'dl' after division, we would need to calculate the quotient and remainder of 75 divided by 11.
Thus, the values in the registers in decimal are:
- 'ah': 9 (remainder)
- 'al': 6 (quotient)
- 'bh': 75 (set by 'mov bh, 4bh')
- 'cx': 11 (set by 'mov cx, 0x000b')
- 'dh' and 'dl' would remain 0 since 'dx' was zeroed out by 'xor dx, dx' and not modified afterward.

(Note that for Part 2 onwards, the option 1: Intel is used)