`timescale 1ns / 1ps

module addsub #(parameter N=32)(
    input [N-1:0] A, B,
    input Subtract,
    output [N-1:0] Result,
    output FlagN, FlagC, FlagV
    );
    
    wire [N-1:0] ToBornottoB = {N{Subtract}} ^ B;
    adder # (N) add(A, ToBornottoB, Subtract, Result, FlagN, FlagC, FlagV);
endmodule
