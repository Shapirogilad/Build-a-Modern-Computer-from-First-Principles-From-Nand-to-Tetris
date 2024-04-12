// Usage:Mult two numbers and save the answer in a register
//   pseudo code:
//    int num1, num2;
//    int sum = 0;
//    if(num2 > 0)
//    {
//      for(int i=0; i<num2; i++)
//      {
//         sum = sum + num1;
//      }
//    }
//    else
//    {
//      for(int i=0; i>num2; i++)
//      {
//         sum = sum + num1;
//      } 
//    }

@0
D = M
@num1
M = D // num1 = RAM[0]

@1
D = M
@num2
M = D // num2 = RAM[1]

@2
M = 0
D = M
@sum
M = D // sum = RAM[2]

@i
M = 0 // i = 0

@num2
D = M;
@NEGLOOP
D;JLT // if num2 < 0 go to NEGLOOP

(POSLOOP) // positive loop
@i
D = M
@num2
D = D - M
@END
D;JEQ // if i == num2 go to END

@i
M = M + 1 // i++

@num1
D = M
@sum
M = M + D // sum = sum + num1
D = M
@2
M = D //RAM[2] = sum

@POSLOOP
0;JMP // go to POSLOOP

(NEGLOOP) // negitive loop
@i
D = M
@num2
D = D + M
@END
D;JEQ // if i == num2 go to END

@i
M = M + 1 // i++

@num1
D = M
@sum
M = M - D // sum = sum - num1
D = M
@2
M = D //RAM[2] = sum

@NEGLOOP
0;JMP // go to NEGLOOP

(END)
@END
0;JMP //INFINITE loop