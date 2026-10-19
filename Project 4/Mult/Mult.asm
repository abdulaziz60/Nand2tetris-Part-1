// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

//set the result to 0 initially
@R2
M=0

//check if the value of RAM[0] = 0
@R0
D=M
@END
D;JEQ

//Number of iterations (i,e, how many times should we add the number to itself) 
@R1
D=M
@Repeatetions
M=D


//If the RAM[1] is a non-zero negative number (i,e, the number of repeations is negative) 
//then make it positve and adjust the sign 
@COMP
D;JGE
-M
@R0
-M

//Add RAM[0] for RAM[1] times
(COMP)

    //if Reapetions reached 0 then stop.
    @Repeatetions
    D=M
    @END
    D;JEQ

    // Calculate RAM[2] = RAM[2] + RAM[0]
    @R0
    D=M
    @R2
    M=D+M

    //Repeatetions--
    @Repeatetions
    M=M-1
    @COMP
    0;JMP


(END)
    @END
    0;JMP










