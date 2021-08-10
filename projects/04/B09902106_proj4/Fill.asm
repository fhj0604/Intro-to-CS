// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INIT)
@8192 // 32*256 of pixels
D=A
@i 
M=D

(LOOP)
@i
M=M-1 // going backward
D=M
@INIT
D;JLT // if i == 0 then reset
@KBD
D=M // load keyboard's memory
@WHITE
D;JEQ // if memory at keyboard is 0 then it is not pressed
@BLACK
D;JNE

(BLACK)
@SCREEN
D=A
@i
A=D+M // color the current index
M=-1 //  111...111 16 bits
@LOOP
0;JMP

(WHITE)
@SCREEN
D=A
@i
A=D+M // color the current index
M=0   // 000...000 16 bits
@LOOP
0;JMP

