`timescale 1ns / 1ps

module ALU #(parameter N=32) (
        input [N-1:0] A, B,
        output [N-1:0] R,
        input [4:0] ALUfn,
        output FlagZ 
    );
    
    wire subtract, bool1, bool0, shft, math;
    assign {subtract, bool1, bool0, shft, math} = ALUfn[4:0];
    
    wire [N-1:0] addSubResult, shiftResult, logicalResult;
    wire compResult;
    wire FlagN, FlagC, FlagV;
    
    addsub #(N) AS(A, B, subtract, addSubResult, FlagN, FlagC, FlagV); 
    shifter #(N) S(B, A[4:0], bool1, bool0,  shiftResult); 
    logical #(N) L(A, B, {bool1, bool0}, logicalResult);
    comparator C(FlagN, FlagV, FlagC, bool0, compResult);
    
    assign R = (~shft & math) ? addSubResult :                //4 way multiplexer
               (shft & ~math) ? shiftResult :
               (~shft & ~math) ? logicalResult : {{(N-1){1'b0}}, compResult};
    assign FlagZ = (R == 0);

endmodule
