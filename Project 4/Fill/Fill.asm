// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Replace this comment with your code.

//initilize the filling variable to -1 so that it fills the screen
//(blackens the screen)
@filling
M=-1


//listen for any pressed key
(PRESS_LISTEN)
    @KBD
    D=M
    //jump to the filling section once a key is pressed
    @FILL
    D;JNE
    @PRESS_LISTEN
    0;JMP
    //SO FAR THIS WORKS

(RELEASE_LISTEN)
    @KBD
    D=M
    //jump to the filling section once a key is released
    @FILL
    D;JEQ
    @RELEASE_LISTEN
    0;JMP
    //SO FAR THIS WORKS

//fill the screen with either black or white 
//according to the filling variable
(FILL)
    //store the address of the screen to the variable addr
    @SCREEN
    D=A
    @addr
    M=D
    //calculate n = addr - @KBD (last address - first address)
    @KBD
    D=A
    @addr
    D=D-M
    @n
    M=D
    //set i to 0
    @i
    M=0
    //start filling
    (LOOP)
        //if i >= n stop (i - n >= 0)
        @n
        D=M
        @i
        D=M-D

        @END
        D;JGE
        //get the value of filling store it in D
        @filling
        D=M
        //point and fill the memory location
        @addr 
        A=M
        M=D
        //addr ++
        @addr
        M=M+1
        //i++
        @i
        M=M+1

        @LOOP
        0;JMP

    (END)
        //switch the value of filling 
        @filling
        M=!M
        D=M
        //if filling is 0 (i,e we have just filled the screen
        //now we wait to clear. then wait for a button release)
        @RELEASE_LISTEN
        D;JEQ
        //if filling is 1 (i,e we have just cleared the screen
        //now we wait to fill. then wait for a button press)
        @PRESS_LISTEN
        0;JMP
    






        


    





