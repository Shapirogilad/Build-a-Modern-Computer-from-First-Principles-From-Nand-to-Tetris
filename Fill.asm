// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.


(LOOP1)
@KBD
D = M
@LOOP1
D;JEQ // if RAM[addrKBD] == 0 go to LOOP1

@SCREEN
D = A
@addrSCREEN
M = D // addrSCREEN = 16384 (screen's base address)
@8192
D = A
@n
M = D // n = last_word

@i
M = 0 // i = 0

(LOOP2)
@i
D = M
@n
D = D - M
@END
D;JEQ // if i==n go to END

@addrSCREEN
 A = M
 M = -1 // RAM[addrSCREEN] = 1111111111111111

@i
M = M + 1 //i++
@addrSCREEN
M = M + 1 // addrSCREEN = addrSCREEN + 1
@LOOP2
0;JMP

(END)
@KBD
D = M
@LOOP3
D;JEQ // if RAM[addrKBD] == 0 go to LOOP3
@END
0;JMP // infinite loop

(LOOP3)
@SCREEN
D = A
@addrSCREEN
M = D // addrSCREEN = 16384 (screen's base address)
@8192
D = A
@n
M = D // n = last_word

@i
M = 0 // i = 0

(LOOP4)
@i
D = M
@n
D = D - M
@LOOP1
D;JEQ // if i==n go to LOOP1 and listen to KBD

@addrSCREEN
 A = M
 M = 0 // RAM[addrSCREEN] = 0000000000000000

@i
M = M + 1 //i++
@addrSCREEN
M = M + 1 // addrSCREEN = addrSCREEN + 1
@LOOP4
0;JMP


